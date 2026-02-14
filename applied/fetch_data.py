import numpy as np
import tarfile
import urllib.request
import os.path
import pickle

AA_atoms = 22


def _float(x):
    try:
        return float(x)
    except:
        return 0


def qm9_fetch():
    raw_filepath = "qm9.tar.bz2"
    cache_file = "qm9.pkl"

    if os.path.isfile(cache_file):
        print("Found existing cache file, delete if you want to re-fetch")
        with open(cache_file, "rb") as f:
            return pickle.load(f)

    if not os.path.isfile(raw_filepath):
        print("Downloading qm9 data...", end="")
        urllib.request.urlretrieve(
            "https://ndownloader.figshare.com/files/3195389", raw_filepath
        )
        print("File downloaded")
    else:
        print(f"Found downloaded file {raw_filepath}, delete if you want to redownload")

    pt = {"C": 6, "H": 1, "O": 8, "N": 7, "F": 9}
    tar = tarfile.open(raw_filepath, "r:bz2")

    records = []
    print("")
    for i in range(1, 133886):
        if i % 100 == 0:
            print("\r {:.2%}".format(i / 133886), end="")
        with tar.extractfile(f"dsgdb9nsd_{i:06d}.xyz") as f:
            lines = [l.decode("UTF-8") for l in f.readlines()]
            N = int(lines[0])
            labels = np.array(
                [float(x) for x in lines[1].split("gdb")[1].split()], dtype=np.float32
            )
            elements = np.array(
                [pt[x.split()[0]] for x in lines[2 : N + 2]], dtype=np.int64
            )
            coords = np.empty((N, 4), dtype=np.float32)
            for j in range(N):
                coords[j] = [_float(x) for x in lines[j + 2].split()[1:]]
            records.append(((elements, coords), labels))
    print("")

    with open(cache_file, "wb") as f:
        pickle.dump(records, f)

    return records


def aa_fetch():
    raw_filepath = "aa0.dcd"
    cache_file = "aa.pkl"

    if os.path.isfile(cache_file):
        print("Found existing cache file, delete if you want to re-fetch")
        with open(cache_file, "rb") as f:
            return pickle.load(f)

    if not os.path.isfile(raw_filepath):
        print("Downloading AA data...", end="")
        urllib.request.urlretrieve(
            "https://ndownloader.figshare.com/files/1497002", raw_filepath
        )
        print("File downloaded")
    else:
        print(f"Found downloaded file {raw_filepath}, delete if you want to redownload")
    print("Converting...")

    try:
        from MDAnalysis.lib.formats.libdcd import DCDFile
    except ImportError:
        raise ImportError("Please install MDanalysis with pip first")

    records = []
    with DCDFile(raw_filepath) as dcd:
        for frame in dcd:
            records.append(frame.xyz.astype(np.float32))

    with open(cache_file, "wb") as f:
        pickle.dump(records, f)

    return records
