import numpy as np
import tensorflow as tf
import tarfile
import urllib.request
import os.path

AA_atoms = 22


def _float_feature(value):
    return tf.train.Feature(float_list=tf.train.FloatList(value=[value]))


def _int64_feature(value):
    return tf.train.Feature(int64_list=tf.train.Int64List(value=[value]))


def _float(x):
    try:
        return float(x)
    except:
        return 0


def qm9_data_parse(record):
    features = {
        'N': tf.io.FixedLenFeature([], tf.int64),
        'labels': tf.io.FixedLenFeature([16], tf.float32),
        'elements': tf.io.VarLenFeature(tf.int64),
        'coords': tf.io.VarLenFeature(tf.float32),
    }
    parsed_features = tf.io.parse_single_example(
        serialized=record, features=features)
    coords = tf.reshape(tf.sparse.to_dense(
        parsed_features['coords'], default_value=0), [-1, 4])
    elements = tf.sparse.to_dense(parsed_features['elements'], default_value=0)
    return (elements, coords), parsed_features['labels']


def aa_data_parse(record):
    features = {
        'coords': tf.io.FixedLenFeature([AA_atoms * 3], tf.float32),
    }
    parsed_features = tf.io.parse_single_example(
        serialized=record, features=features)
    coords = tf.reshape(parsed_features['coords'], [-1, 3])
    return coords


def qm9_prepare_records(lines):
    pt = {'C': 6, 'H': 1, 'O': 8, 'N': 7, 'F': 9}
    N = int(lines[0])
    labels = [float(x) for x in lines[1].split('gdb')[1].split()]
    coords = np.empty((N, 4), dtype=np.float64)
    elements = [pt[x.split()[0]] for x in lines[2:N+2]]
    for i in range(N):
        coords[i] = [_float(x) for x in lines[i + 2].split()[1:]]
    feature = {
        'N': tf.train.Feature(int64_list=tf.train.Int64List(value=[N])),
        'labels': tf.train.Feature(float_list=tf.train.FloatList(value=labels)),
        'elements': tf.train.Feature(int64_list=tf.train.Int64List(value=elements)),
        'coords': tf.train.Feature(float_list=tf.train.FloatList(value=coords.flatten())),
    }
    return tf.train.Example(features=tf.train.Features(feature=feature))


def aa_fetch():
    raw_filepath = 'aa0.dcd'
    record_file = 'aa.tfrecords'

    if os.path.isfile(record_file):
        print('Found existing record file, delete if you want to re-fetch')
        return record_file

    if not os.path.isfile(raw_filepath):
        print('Downloading AA data...', end='')
        urllib.request.urlretrieve(
            'https://ndownloader.figshare.com/files/1497002', raw_filepath)
        print('File downloaded')

    else:
        print(
            f'Found downloaded file {raw_filepath}, delete if you want to redownload')
    print('Converting...')

    try:
        import MDAnalysis
        from MDAnalysis.lib.formats.libdcd import DCDFile
    except ImportError:
        raise ImportError('Please install MDanalysis with pip first')

    with tf.io.TFRecordWriter(record_file, options=tf.io.TFRecordOptions(compression_type='GZIP')) as writer:
        with DCDFile(raw_filepath) as dcd:
            for frame in dcd:
                feature = {
                    'coords': tf.train.Feature(float_list=tf.train.FloatList(value=frame.xyz.flatten()))
                }
                example = tf.train.Example(
                    features=tf.train.Features(feature=feature))
                writer.write(example.SerializeToString())
    return record_file


def qm9_fetch():

    raw_filepath = 'qm9.tar.bz2'
    record_file = 'qm9.tfrecords'

    if os.path.isfile(record_file):
        print('Found existing record file, delete if you want to re-fetch')
        return record_file

    if not os.path.isfile(raw_filepath):
        print('Downloading qm9 data...', end='')
        urllib.request.urlretrieve(
            'https://ndownloader.figshare.com/files/3195389', raw_filepath)
        print('File downloaded')

    else:
        print(
            f'Found downloaded file {raw_filepath}, delete if you want to redownload')
    tar = tarfile.open(raw_filepath, 'r:bz2')

    print('')
    with tf.io.TFRecordWriter(record_file, options=tf.io.TFRecordOptions(compression_type='GZIP')) as writer:
        for i in range(1, 133886):
            if i % 100 == 0:
                print('\r {:.2%}'.format(i / 133886), end='')
            with tar.extractfile(f'dsgdb9nsd_{i:06d}.xyz') as f:
                lines = [l.decode('UTF-8') for l in f.readlines()]
                try:
                    writer.write(qm9_prepare_records(
                        lines).SerializeToString())
                except ValueError as e:
                    print(i)
                    raise e
    print('')
    return record_file


def qm9_parse(record_file):
    return tf.data.TFRecordDataset(
        record_file, compression_type='GZIP').map(qm9_data_parse)


def aa_parse(record_file):
    return tf.data.TFRecordDataset(
        record_file, compression_type='GZIP').map(aa_data_parse)
