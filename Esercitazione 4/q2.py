from gurobipy import *

m = Model('TrainLoading')

C = 20  # n container
W = 7  # wagon

alpha = 10  # rehandling cost
T = 4  # max n tiers

container, c_length, c_weight, c_pi = multidict({
    (1): [20, 15, 30],
    (2): [20, 19, 40],
    (3): [20, 17, 30],
    (4): [20, 18, 40],
    (5): [20, 15, 40],
    (6): [20, 16, 30],
    (7): [20, 17, 20],
    (8): [20, 18, 20],
    (9): [20, 16, 30],
    (10): [20, 19, 30],
    (11): [20, 18, 40],
    (12): [20, 19, 20],
    (13): [40, 22, 40],
    (14): [40, 24, 60],
    (15): [40, 27, 80],
    (16): [40, 25, 40],
    (17): [40, 28, 40],
    (18): [40, 24, 80],
    (19): [40, 24, 40],
    (20): [40, 27, 40]
}
)
gamma = {}
for i in range(1, C + 1):
    for j in range(1, C + 1):
        gamma[i, j] = 0

gamma[1, 2] = 1
gamma[1, 3] = 1
gamma[1, 4] = 1

gamma[2, 3] = 1
gamma[2, 4] = 1

gamma[3, 4] = 1

gamma[5, 6] = 1
gamma[5, 7] = 1
gamma[5, 8] = 1

gamma[6, 7] = 1
gamma[6, 8] = 1

gamma[7, 8] = 1

gamma[9, 10] = 1
gamma[9, 11] = 1
gamma[9, 12] = 1

gamma[10, 11] = 1
gamma[10, 12] = 1

gamma[11, 12] = 1

gamma[13, 14] = 1
gamma[13, 15] = 1
gamma[13, 16] = 1

gamma[14, 15] = 1
gamma[14, 16] = 1

gamma[15, 16] = 1

gamma[17, 18] = 1
gamma[17, 19] = 1
gamma[17, 20] = 1

gamma[18, 19] = 1
gamma[18, 20] = 1

gamma[19, 20] = 1

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

m.addConstrs(quicksum(x[j, w] for j in container if gamma[j, i] == 1) <= 1000 * (y[i, w] + quicksum(x[i, h] for h in wagon if h <= w)) for i in container for w in wagon)

m.setObjective(obj, GRB.MINIMIZE)
m.optimize()

for v in m.getVars():
    if v.X != 0:
        print('%s %f' % (v.Varname, v.X))

print('Optimal cost: %f' % m.objVal)

n_rehandling = 0

for j in wagon:
    for i in container:
        if x[i,j].X !=0:
            print('container', i, 'caricato sul vagone', j)
        if y[i,j].X != 0:
            n_rehandling += 1
            print('container', i ,'rehandled durante il caricamento del vagone', j)

print('numero di operazioni di rehandling', n_rehandling)
print('costo delle operazioni di rehandling', n_rehandling*alpha)

for i in container:
    load = 0
    for w in wagon:
        load = x[i,w].X + load

    if load == 0:
        print('container', i, 'non caricato')

teu_total = 0
teu_wagone_total = 0

for j in wagon:
    for i in container:
        if x[i,j].X !=0:
            teu_total = teu_total + c_length[i]/20

    teu_wagone_total = teu_wagone_total + w_length[j]/20

print("teu caricati: ", teu_total)

priority_value = 0
for j in wagon:
    for i in container:
        if x[i,j].X !=0:
            priority_value = priority_value + c_pi[i]

print("valore commerciale totale caricato: ", priority_value)
print("percentuale teu caricata: ", (teu_total/teu_wagone_total)*100 , '%')






