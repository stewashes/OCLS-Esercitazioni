from gurobipy import *

m = Model('Linear Transport')

Potential_nodes, f, q = multidict({
    'Torino': [70000, 1600],
    'Genova': [90000, 1400],
    'Milano': [100000, 1700],
    'Bologna': [90000, 1500]
})

Demand_points, d = multidict({
    'Torino': [600],
    'Savona': [200],
    'Genova': [500],
    'Milano': [700],
    'Brescia': [250],
    'Piacenza': [300],
    'Bologna': [350],
    'Padova': [250]
})

Arcs, c = multidict({
    ('Torino', 'Torino'): [30 * 0.45],
    ('Torino', 'Savona'): [140 * 0.45],
    ('Torino', 'Genova'): [180 * 0.45],
    ('Torino', 'Milano'): [140 * 0.45],
    ('Torino', 'Brescia'): [230 * 0.45],
    ('Torino', 'Piacenza'): [180 * 0.45],
    ('Torino', 'Bologna'): [330 * 0.45],
    ('Torino', 'Padova'): [370 * 0.45],
    ('Genova', 'Torino'): [180 * 0.45],
    ('Genova', 'Savona'): [50 * 0.45],
    ('Genova', 'Genova'): [20 * 0.45],
    ('Genova', 'Milano'): [145 * 0.45],
    ('Genova', 'Brescia'): [230 * 0.45],
    ('Genova', 'Piacenza'): [150 * 0.45],
    ('Genova', 'Bologna'): [300 * 0.45],
    ('Genova', 'Padova'): [370 * 0.45],
    ('Milano', 'Torino'): [140 * 0.45],
    ('Milano', 'Savona'): [180 * 0.45],
    ('Milano', 'Genova'): [145 * 0.45],
    ('Milano', 'Milano'): [40 * 0.45],
    ('Milano', 'Brescia'): [100 * 0.45],
    ('Milano', 'Piacenza'): [75 * 0.45],
    ('Milano', 'Bologna'): [215 * 0.45],
    ('Milano', 'Padova'): [250 * 0.45],
    ('Bologna', 'Torino'): [330 * 0.45],
    ('Bologna', 'Savona'): [340 * 0.45],
    ('Bologna', 'Genova'): [300 * 0.45],
    ('Bologna', 'Milano'): [215 * 0.45],
    ('Bologna', 'Brescia'): [205 * 0.45],
    ('Bologna', 'Piacenza'): [155 * 0.45],
    ('Bologna', 'Bologna'): [30 * 0.45],
    ('Bologna', 'Padova'): [120 * 0.45],
})

y = m.addVars(Potential_nodes, name='y', vtype=GRB.BINARY)

x = m.addVars(Arcs, name='x', lb=0, ub=1, vtype=GRB.CONTINUOUS)

obj = quicksum(f[i] * y[i] for i in Potential_nodes) + quicksum(
    c[i, j] * d[j] * x[i, j] for i in Potential_nodes for j in Demand_points)

m.setObjective(obj, GRB.MINIMIZE)

m.addConstrs((quicksum(x[i, j] for i in Potential_nodes) == 1 for j in Demand_points), name='demand_satisfied')

m.addConstrs((quicksum(x[i, j] * d[j] for j in Demand_points) <= q[i] * y[i] for i in Potential_nodes),
             name='max_capacity')

m.optimize()

for v in m.getVars():
    if v.X != 0:
        print('%s %f' % (v.Varname, v.X))

print('Optimal cost: %f' % m.objVal)

m.write('model_q2.lp')