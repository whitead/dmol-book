import symd
import numpy as np
import pickle
import gzip
from multiprocessing import Pool

titles = [
    "p1",
    "p2",
    "pm",
    "pg",
    "cm",
    "pmm",
    "pmg",
    "pgg",
    "cmm",
    "p4",
    "p4m",
    "p4g",
    "p3",
    "p3m1",
    "p31m",
    "p6",
    "p6m",
]


def make_traj(
    n,
    group,
    w=None,
    retries=5,
    steps=10**6,
    steps2=5 * 10**3,
    ndims=2,
    starting_density=0.2,
    count=10,
):
    # trying to have n be number in UNIT CELLL
    # so have to adjust for group size
    m = len(symd.groups.load_group(group, ndims).genpos)
    n = max(2, n // m)
    if w is not None:
        n += sum(w)
        name = f"{group}-{n}-{sum(w)}"
    else:
        name = f"{group}-{n}"
    print("Simulating", n, "particles:", name)
    # break out the try/except because we will accept failed NPT (because it jams so hard)
    for i in range(retries):
        np.random.seed(i)
        cell = symd.groups.get_cell(starting_density, group, 2, n, w)
        # NPT
        md = symd.Symd(
            nparticles=n,
            cell=cell,
            ndims=ndims,
            images=2,
            force="lj",
            wyckoffs=w,
            group=group,
            steps=steps,
            exeDir=f"crystal-{name}",
            pressure=0.25,
            temperature=0.1,
            start_temperature=0.5,
        )
        try:
            md.remove_overlap()
        except RuntimeError as e:
            continue
        md.log_positions(period=250)
        try:
            md.run()
        except:
            if md.positions.shape[0] < 100:
                continue
    if md.positions is None:
        return None
    T = md.positions.shape[0]
    return md.positions[np.random.choice(T, size=count)]


trajs = {}
results = []

with Pool(6) as pool:
    for N in [8, 16, 32]:
        for i, t in enumerate(titles):
            W = len(symd.groups.load_group(i + 1, 2).specpos)
            for j in range(1 + W):
                wycks = None if j == 0 else [1] * j
                name = f"{t}-w{j}-n{N}"
                job = pool.apply_async(make_traj, (N, i + 1, wycks))
                # job = crystal(N, i+1, wycks)
                results.append((name, job))

    for r in results:
        name, job = r
        print("Getting result for ", name)
        traj = job.get()
        if traj is None:
            continue
        trajs[name] = traj

with gzip.open("sym_trajs.pb.gz", "wb") as f:
    pickle.dump(trajs, f, pickle.HIGHEST_PROTOCOL)
