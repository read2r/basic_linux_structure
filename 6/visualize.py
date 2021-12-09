import matplotlib.pyplot as plt
import math

with open("cache_test.log", 'r') as f:
    lines = f.readlines()

results = list()
for line in lines:
    line = line.replace("\n", "")
    num = float(line)
    results.append(num)

ax1 = plt.subplot(211)
ax2 = plt.subplot(212)

x = list()
y1 = list()
y2 = list()

for i, res in enumerate(results):
    x.append(2 + i)
    y1.append(res)
    y2.append(math.log(res))

ax1.plot(x, y1, 'o-')
ax2.plot(x, y2, 'o-')
plt.show()
