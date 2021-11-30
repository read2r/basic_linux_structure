import matplotlib.pyplot as plt
import sys

def getLines(uri):
    with open(uri, 'r') as f:
        data = f.readlines()

    lines = list()
    for i, line in enumerate(data):
        line = line.replace("\n", "")
        line = line.split("\t")
        line = list(map(int, line))

        if len(line) == 3:
            lines.append(line)

    return lines

def getProcNum(lines):
    proc = -1
    procNum = 0
    for line in lines:
        if line[0] != proc:
            proc = line[0]
            procNum += 1
    return procNum

def main():
    lines = getLines(sys.argv[1])
    procNum = getProcNum(lines)
    last = len(lines) - 1

    ax1 = plt.subplot(211)
    ax2 = plt.subplot(212)

    for i in range(procNum):
        total = list()
        proc = list()
        progress = list()
        for j in range(100):
            line = lines[i * 100 + j]
            total.append(line[1])
            proc.append(line[0])
            progress.append(line[2])
        ax1.scatter(total, proc, s=5)
        ax2.scatter(total, progress, s=5)
    plt.show()

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f'usage : python3 {sys.argv[0]} <log_uri>')
    else:
        main()
