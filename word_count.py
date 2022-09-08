import json
import glob


def count_md(path):
    with open(path, "r") as f:
        return sum([len(l.split()) for l in f.readlines()])


def count_nb(path):
    with open(path, encoding="utf-8") as json_file:
        data = json.load(json_file)
    wordCount = 0
    lineCount = 0
    for each in data["cells"]:
        cellType = each["cell_type"]
        if cellType == "markdown":
            content = each["source"]
            for line in content:
                temp = [word for word in line.split() if "#" not in word]
                wordCount = wordCount + len(temp)
        elif cellType == "code":
            content = each["source"]
            lineCount += sum([1 for line in content if len(line) > 0])
    return wordCount, lineCount


wordCount = 0
lineCount = 0
for p in glob.glob("**/*.md"):
    wordCount += count_md(p)
for p in glob.glob("**/*.ipynb"):
    w, l = count_nb(p)
    wordCount += w
    lineCount += l

print(f"Words: {wordCount}, Lines: {lineCount}")
