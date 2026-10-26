"""Check that the Equivariant chapter's in-text diagrams survive a book build."""

import json
import re
from html.parser import HTMLParser
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
NOTEBOOK = ROOT / "dl/Equivariant.ipynb"
HTML = ROOT / "_build/html/dl/Equivariant.html"


class InlineImages(HTMLParser):
    def __init__(self):
        super().__init__()
        self.tags = []
        self.sections = []
        self.sources = []

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if tag == "section":
            self.sections.append(attrs.get("id"))
        if (
            tag == "img"
            and self.tags
            and self.tags[-1] == "p"
            and "equivariant-neural-networks" in self.sections
        ):
            self.sources.append(attrs["src"])
        if tag not in {"img", "br", "hr", "input", "meta", "link", "source"}:
            self.tags.append(tag)

    def handle_endtag(self, tag):
        if tag == "section":
            self.sections.pop()
        if tag in self.tags:
            while self.tags.pop() != tag:
                pass


notebook = json.loads(NOTEBOOK.read_text())
markdown = "".join(
    "".join(cell["source"])
    for cell in notebook["cells"]
    if cell["cell_type"] == "markdown"
)
expected = len(
    re.findall(r"!\[[^]]+\]\(\.\./_static/images/equivariant/[^)]+\.png\)", markdown)
)
assert expected == 31, f"Expected 31 source diagrams, found {expected}"

parser = InlineImages()
parser.feed(HTML.read_text())
assert len(parser.sources) == expected, (
    f"Expected {expected} inline diagrams in rendered HTML, "
    f"found {len(parser.sources)}"
)

missing = [src for src in parser.sources if not (HTML.parent / src).is_file()]
assert not missing, f"Rendered diagrams are missing files: {missing}"
print(f"Verified {expected} rendered inline Equivariant diagrams and their image files")
