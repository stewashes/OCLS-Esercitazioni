from gurobipy import *
import numpy as np

m = Model('TrainLoading')

C = 20  # n container
W = 7  # wagon

alpha = 10  # rehandling cost
T = 4  # max n tiers

container, c_length, c_weight, c_pi = multidict({
    1: [20, 15, 30],
    2: [20, 19, 40],
    3: [20, 17, 30],
    4: [20, 18, 40],
    5: [20, 15, 40],
    6: [20, 16, 30],
    7: [20, 17, 20],
    8: [20, 18, 20],
    9: [20, 16, 30],
    10: [20, 19, 30],
    11: [20, 18, 40],
    12: [20, 19, 20],
    13: [40, 22, 40],
    14: [40, 24, 60],
    15: [40, 27, 80],
    16: [40, 25, 40],
    17: [40, 28, 40],
    18: [40, 24, 80],
    19: [40, 24, 40],
    20: [40, 27, 40]
}
)
gamma = np.zeros((20, 20))

for i in range(0, 20):
    for j in range(0, 20):
        if i in range(0, 4) and j in range(0, 4) and i < j:
            gamma[i, j] = 1
        if i in range(4, 8) and j in range(4, 8) and i < j:
            gamma[i, j] = 1
        if i in range(8, 12) and j in range(8, 12) and i < j:
            gamma[i, j] = 1
        if i in range(12, 16) and j in range(12, 16) and i < j:
            gamma[i, j] = 1
        if i in range(16, 20) and j in range(16, 20) and i < j:
            gamma[i, j] = 1

wagon, w_length, w_weight = multidict({
    1: (60, 48),
    2: (60, 48),
    3: (60, 48),
    4: (60, 48),
    5: (40, 33),
    6: (40, 33),
    7: (40, 33)
})

train_capacity = 300

x = m.addVars(container, wagon, name='x', lb=0, vtype=GRB.BINARY)

y = m.addVars(container, wagon, name='y', lb=0, vtype=GRB.BINARY)

obj = quicksum(quicksum(alpha * y[i, w] for i in container) for w in wagon) + quicksum(
    c_pi[i] * (1 - quicksum(x[i, w] for w in wagon)) for i in container)

m.addConstrs(quicksum(x[i, w] for w in wagon) <= 1 for i in container)

m.addConstrs(quicksum(c_length[i] * x[i, w] for i in container) <= w_length[w] for w in wagon)

m.addConstrs(quicksum(c_weight[i] * x[i, w] for i in container) <= w_weight[w] for w in wagon)

m.addConstr(quicksum(quicksum(c_weight[i] * x[i, w] for w in wagon) for i in container) <= train_capacity)

m.addConstrs(quicksum(x[j, w] for j in container if gamma[j - 1, i - 1] == 1) <= 1000 * (
        y[i, w] + quicksum(x[i, h] for h in wagon if h <= w)) for i in container for w in wagon)

m.setObjective(obj, GRB.MINIMIZE)
m.optimize()

print('Optimal cost: %f' % m.objVal)

n_rehandling = 0

for j in wagon:
    for i in container:
        if x[i, j].X != 0:
            print('Container', i, 'caricato sul vagone', j)
        if y[i, j].X != 0:
            n_rehandling += 1
            print('Container', i, 'rehandled durante il caricamento del vagone', j)

print('\nNumero di operazioni di rehandling:', n_rehandling)
print('\nCosto totale delle operazioni di rehandling:', n_rehandling * alpha)
print()

load_list = []
for i in container:
    load = 0
    for w in wagon:
        load = x[i, w].X + load

    if load == 0:
        load_list.append(i)

print('Container',load_list, 'non caricati')

teu_total = 0
teu_wagone_total = 0

for j in wagon:
    for i in container:
        if x[i, j].X != 0:
            teu_total = teu_total + c_length[i] / 20

    teu_wagone_total = teu_wagone_total + w_length[j] / 20

print("\nTEU caricati: ", teu_total)

priority_value = 0
for j in wagon:
    for i in container:
        if x[i, j].X != 0:
            priority_value = priority_value + c_pi[i]

print("\nValore commerciale totale caricato: ", priority_value)
print("\nPercentuale teu caricata: ", (teu_total / teu_wagone_total) * 100, '%')
