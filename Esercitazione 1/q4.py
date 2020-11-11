from gurobipy import *

m = Model('Linear Transport')

Potential_nodes, f, q = multidict({
    'Torino': [70000, 1600],
    'Genova': [90000, 1400],
    'Milano': [100000, 1700],
    'Bologna': [90000, 1500]
})

Demand_points, d1, d2 = multidict({
    'Torino': [600, 200],
    'Savona': [200, 50],
    'Genova': [500, 150],
    'Milano': [700, 200],
    'Brescia': [250, 50],
    'Piacenza': [300, 100],
    'Bologna': [350, 100],
    'Padova': [250, 50]
})

Arcs, c1, c2 = multidict({
    ('Torino', 'Torino'): [30 * 0.45, 30*0.60],
    ('Torino', 'Savona'): [140 * 0.45, 140*0.60],
    ('Torino', 'Genova'): [180 * 0.45, 180*0.60],
    ('Torino', 'Milano'): [140 * 0.45, 140*0.60],
    ('Torino', 'Brescia'): [230 * 0.45, 230*0.60],
    ('Torino', 'Piacenza'): [180 * 0.45, 180*0.60],
    ('Torino', 'Bologna'): [330 * 0.45, 330*0.60],
    ('Torino', 'Padova'): [370 * 0.45, 370*0.60],
    ('Genova', 'Torino'): [180 * 0.45, 180*0.60],
    ('Genova', 'Savona'): [50 * 0.45, 50*0.60],
    ('Genova', 'Genova'): [20 * 0.45, 20*0.60],
    ('Genova', 'Milano'): [145 * 0.45, 145*0.60],
    ('Genova', 'Brescia'): [230 * 0.45, 230*0.60],
    ('Genova', 'Piacenza'): [150 * 0.45, 150*0.60],
    ('Genova', 'Bologna'): [300 * 0.45, 300*0.60],
    ('Genova', 'Padova'): [370 * 0.45, 370*0.60],
    ('Milano', 'Torino'): [140 * 0.45, 140*0.60],
    ('Milano', 'Savona'): [180 * 0.45, 180*0.60],
    ('Milano', 'Genova'): [145 * 0.45, 145*0.60],
    ('Milano', 'Milano'): [40 * 0.45, 40*0.60],
    ('Milano', 'Brescia'): [100 * 0.45, 100*0.60],
    ('Milano', 'Piacenza'): [75 * 0.45, 75*0.60],
    ('Milano', 'Bologna'): [215 * 0.45, 215*0.60],
    ('Milano', 'Padova'): [250 * 0.45, 250*0.60],
    ('Bologna', 'Torino'): [330 * 0.45, 330*0.60],
    ('Bologna', 'Savona'): [340 * 0.45, 340*0.60],
    ('Bologna', 'Genova'): [300 * 0.45, 300*0.60],
    ('Bologna', 'Milano'): [215 * 0.45, 215*0.60],
    ('Bologna', 'Brescia'): [205 * 0.45, 205*0.60],
    ('Bologna', 'Piacenza'): [155 * 0.45, 155*0.60],
    ('Bologna', 'Bologna'): [30 * 0.45, 30*0.60],
    ('Bologna', 'Padova'): [120 * 0.45, 120*0.60],
})

y = m.addVars(Potential_nodes, name='y', vtype=GRB.BINARY)

s = m.addVars([1,2],Arcs, name='s', lb=0, vtype=GRB.CONTINUOUS)

obj = quicksum(f[i] * y[i] for i in Potential_nodes) + \
      quicksum((c1[i, j] * s[1, i, j]) + (c2[i, j] * s[2, i, j]) for i in Potential_nodes for j in Demand_points)

m.setObjective(obj, GRB.MINIMIZE)

m.addConstrs((quicksum(s[1, i, j] for i in Potential_nodes) == d1[j] for j in Demand_points), name='demand1_satisfied')
m.addConstrs((quicksum(s[2, i, j] for i in Potential_nodes) == d2[j] for j in Demand_points), name='demand2_satisfied')

m.addConstrs((quicksum(s[1, i, j] + s[2, i, j] for j in Demand_points) <= q[i] * y[i] for i in Potential_nodes),
             name='max_capacity')

m.optimize()

for v in m.getVars():
    if v.X != 0:
        print('%s %f' % (v.Varname, v.X))

print('Optimal cost: %f' % m.objVal)

m.write('model_q4.lp')