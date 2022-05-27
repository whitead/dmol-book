from IPython.display import set_matplotlib_formats
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
from rdkit.rdBase import BlockLogs
from rdkit.Chem.Draw import IPythonConsole
import warnings
import urllib.request
import random


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
plt.rcParams.update(
    {
        "axes.facecolor": "#f5f4e9",
        "grid.color": "#AAAAAA",
        "axes.edgecolor": "#333333",
        "figure.facecolor": "#FFFFFF",
        "axes.grid": False,
        "axes.prop_cycle": plt.cycler("color", plt.cm.Dark2.colors),
        "font.family": fe.name,
        "figure.figsize": (4, 4 / 1.2),
        "figure.dpi": 150,
        "ytick.left": True,
        "xtick.bottom": True,
        "image.cmap": "gist_yarg",
        "lines.markersize": 6,
    }
)
color_cycle = ["#444444", "#1BBC9B", "#a895bb", "#F06060", "#F3B562", "#80cedb"]
mpl.rcParams["axes.prop_cycle"] = mpl.cycler(color=color_cycle)
