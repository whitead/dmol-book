import random
import urllib.request
import warnings
from rdkit.Chem.Draw import IPythonConsole
from rdkit.rdBase import BlockLogs
import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np

# make sure it is called here!
from IPython import get_ipython

get_ipython().run_line_magic("matplotlib", "inline")

block = BlockLogs()
random.seed(0)
np.random.seed(0)
IPythonConsole.ipython_useSVG = True
IPythonConsole.drawOptions.useBWAtomPalette()
IPythonConsole.drawOptions.drawMolsSameScale = False
warnings.filterwarnings("ignore")

urllib.request.urlretrieve(
    "https://github.com/google/fonts/raw/main/ofl/courierprime/CourierPrime-Regular.ttf",
    "CourierPrime-Regular.ttf",
)
fe = mpl.font_manager.FontEntry(fname="CourierPrime-Regular.ttf", name="courierprime")
mpl.font_manager.fontManager.ttflist.append(fe)
color_cycle = ["#444444", "#1BBC9B", "#a895bb", "#F06060", "#F3B562", "#80cedb"]
mpl.rcParams.update(
    {
        "axes.facecolor": "#f5f4e9",
        "grid.color": "#AAAAAA",
        "axes.edgecolor": "#333333",
        "figure.facecolor": "#FFFFFFFF",
        "axes.grid": False,
        "axes.prop_cycle": plt.cycler(color=color_cycle),
        "font.family": fe.name,
        "font.size": 14,
        "figure.figsize": (4.5, 4.5 / 1.3),
        "figure.dpi": 200,
        "ytick.left": True,
        "xtick.bottom": True,
        "image.cmap": "gist_yarg",
        "lines.markersize": 6,
    }
)
