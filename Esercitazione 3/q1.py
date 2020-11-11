from gurobipy import *

m = Model('Vehicle Allocation Model')

N = 4

T = 6
tau = 1

Nodes = ['1', '2', '3', '4']
Time = [1, 2, 3, 4, 5, 6]

av = {}
demand = {}
profit = {}
cost = {}

for i in Nodes:
    for t in Time:
        av[i, t] = 0

av['1', 1] = 1
av['3', 2] = 1
av['4', 2] = 1

for i in Nodes:
    for j in Nodes:
        for t in Time:
            demand[i, j, t] = 0
            profit[i, j, t] = 0
            cost[i, j, t] = 0

demand['1', '4', 1] = 1
profit['1', '4', 1] = 0.4 * 465
cost['1', '4', 1] = 0.5 * 465

demand['3', '2', 2] = 2
profit['3', '2', 2] = 0.4 * 465
cost['3', '2', 2] = 0.5 * 465

demand['4', '1', 2] = 1
profit['4', '1', 2] = 0.4 * 465
cost['4', '1', 2] = 0.5 * 465

demand['2', '4', 3] = 2
profit['2', '4', 3] = 0.4 * 480
cost['2', '4', 3] = 0.5 * 480

demand['1', '3', 4] = 1
profit['1', '3', 4] = 0.4 * 440
cost['1', '3', 4] = 0.5 * 440

demand['2', '3', 4] = 1
profit['2', '3', 4] = 0.4 * 465
cost['2', '3', 4] = 0.5 * 465,

demand['4', '3', 4] = 1
profit['4', '3', 4] = 0.4 * 500
cost['4', '3', 4] = 0.5 * 500

demand['2', '1', 5] = 1
profit['2', '1', 5] = 0.4 * 735
cost['2', '1', 5] = 0.5 * 735

demand['2', '4', 5] = 1
profit['2', '4', 5] = 0.4 * 480
cost['2', '4', 5] = 0.5 * 480

demand['4', '1', 5] = 2
profit['4', '1', 5] = 0.4 * 465
cost['4', '1', 5] = 0.5 * 465

demand['2', '1', 6] = 1
profit['2', '1', 6] = 0.4 * 735
cost['2', '1', 6] = 0.5 * 735

demand['4', '3', 6] = 1
profit['4', '3', 6] = 0.4 * 500
cost['4', '3', 6] = 0.5 * 500

x = m.addVars(Nodes, Nodes, Time, name='x', lb=0, vtype=GRB.CONTINUOUS)

y = m.addVars(Nodes, Nodes, Time, name='y', lb=0, vtype=GRB.CONTINUOUS)

# obj = quicksum(profit[i, j, t] * x[i, j, t] - cost[i, j, t] * y[i, j, t] for i in Nodes for j in Nodes for t in Time)

m.addConstrs((av[i, 1] == quicksum(x[i, j, 1] + y[i, j, 1] for j in Nodes) for i in Nodes), name='conservazione_t1')

m.addConstrs(((av[i, t] + quicksum(
    x[j, i, t - tau] + y[j, i, t - tau] + y[i, i, t - 1] for j in Nodes if j != i)) == quicksum(
    x[i, j, t] + y[i, j, t] for j in Nodes) for i in Nodes for t in Time[1:6]), name='conservazione')

m.addConstrs((x[i, j, t] <= demand[i, j, t] for t in Time for i in Nodes for j in Nodes ), name='soddisfazione_domanda')

# m.setObjective(obj, GRB.MAXIMIZE)
# m.optimize()
m.write('q1.lp')

# for v in m.getVars():
#     print('%s %f' % (v.Varname, v.X))

# print('Optimal cost: %f' % m.objVal)


