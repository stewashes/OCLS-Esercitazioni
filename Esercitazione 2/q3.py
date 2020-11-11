from gurobipy import *

m = Model('Network Design')

Product = ['prod1', 'prod2']

Links, f, q, qmax, c1, c2 = multidict({
    ('Lyon', 'Frankfurt'): [70000, 2000, 1000, 200, 250],
    ('Frankfurt', 'Lyon'): [70000, 2000, 1000, 200, 250],
    ('Frankfurt', 'Linz'): [70000, 2000, 1000, 200, 250],
    ('Linz', 'Frankfurt'): [70000, 2000, 1000, 200, 250],

    ('Nantes', 'Frankfurt'): [50000, 600, 400, 450, 500],
    ('Frankfurt', 'Nantes'): [50000, 600, 400, 450, 500],
    ('Nantes', 'Lyon'): [50000, 600, 400, 300, 350],
    ('Lyon', 'Nantes'): [50000, 600, 400, 300, 350],
    ('Paris', 'Frankfurt'): [50000, 600, 400, 450, 500],
    ('Frankfurt', 'Paris'): [50000, 600, 400, 450, 500],
    ('Paris', 'Lyon'): [50000, 600, 400, 300, 350],
    ('Lyon', 'Paris'): [50000, 600, 400, 300, 350],
    ('Marseille', 'Frankfurt'): [50000, 600, 400, 450, 500],
    ('Frankfurt', 'Marseille'): [50000, 600, 400, 450, 500],
    ('Marseille', 'Lyon'): [50000, 600, 400, 250, 300],
    ('Lyon', 'Marseille'): [50000, 600, 400, 250, 300],
    ('Hannover', 'Frankfurt'): [50000, 600, 400, 250, 300],
    ('Frankfurt', 'Hannover'): [50000, 600, 400, 250, 300],
    ('Milan', 'Frankfurt'): [50000, 600, 400, 350, 400],
    ('Frankfurt', 'Milan'): [50000, 600, 400, 350, 400],
    ('Hannover', 'Linz'): [50000, 600, 400, 400, 450],
    ('Linz', 'Hannover'): [50000, 600, 400, 400, 450],
    ('Milan', 'Linz'): [50000, 600, 400, 450, 500],
    ('Linz', 'Milan'): [50000, 600, 400, 450, 500],
    ('Prague', 'Linz'): [50000, 600, 400, 150, 200],
    ('Linz', 'Prague'): [50000, 600, 400, 150, 200]
})

Nodes, connections = multidict({
    'Linz': [['Milan', 'Hannover', 'Prague', 'Frankfurt']],
    'Frankfurt': [['Nantes', 'Paris', 'Marseille', 'Milan', 'Hannover', 'Lyon', 'Linz']],
    'Lyon': [['Nantes', 'Paris', 'Marseille', 'Frankfurt']],

    'Nantes': [['Lyon', 'Frankfurt']],
    'Paris': [['Lyon', 'Frankfurt']],
    'Marseille': [['Lyon', 'Frankfurt']],
    'Hannover': [['Linz', 'Frankfurt']],
    'Milan': [['Linz', 'Frankfurt']],
    'Prague': [['Linz']],
})

Quantity, od = multidict({
    ('Nantes', 'prod1'): 150,
    ('Nantes', 'prod2'): -290,
    ('Paris', 'prod1'): 220,
    ('Paris', 'prod2'): 380,
    ('Marseille', 'prod1'): -270,
    ('Marseille', 'prod2'): 180,
    ('Hannover', 'prod1'): 300,
    ('Hannover', 'prod2'): -300,
    ('Milan', 'prod1'): -200,
    ('Milan', 'prod2'): -200,
    ('Prague', 'prod1'): -200,
    ('Prague', 'prod2'): 230,
    ('Lyon', 'prod1'): 0,
    ('Lyon', 'prod2'): 0,
    ('Frankfurt', 'prod1'): 0,
    ('Frankfurt', 'prod2'): 0,
    ('Linz', 'prod1'): 0,
    ('Linz', 'prod2'): 0,
})

y = m.addVars(Links, name='y', vtype=GRB.BINARY)

x = m.addVars(Links, Product, name='x', lb=0, vtype=GRB.CONTINUOUS)

obj = quicksum(f[i, j] * y[i, j] for i, j in Links) + \
      quicksum(c1[i, j] * x[i, j, 'prod1'] for i, j in Links) + \
      quicksum(c2[i, j] * x[i, j, 'prod2'] for i, j in Links)

m.setObjective(obj, GRB.MINIMIZE)

m.addConstrs(
    (quicksum(x[i, j, 'prod1'] for j in connections[i]) - quicksum(x[j, i, 'prod1'] for j in connections[i]) == od[
        i, 'prod1'] for i in Nodes), name='flow_prod1')

m.addConstrs(
    (quicksum(x[i, j, 'prod2'] for j in connections[i]) - quicksum(x[j, i, 'prod2'] for j in connections[i]) == od[
        i, 'prod2'] for i in Nodes), name='flow_prod2')

m.addConstrs(x[i, j, 'prod1'] + x[i, j, 'prod2'] <= q[i, j] * y[i, j] for i, j in Links)

m.addConstrs(x[i, j, 'prod1'] <= qmax[i, j] for i, j in Links)
m.addConstrs(x[i, j, 'prod2'] <= qmax[i, j] for i, j in Links)

m.addConstr(y['Lyon', 'Frankfurt'] == 1)
m.addConstr(y['Frankfurt', 'Lyon'] == 1)
m.addConstr(y['Frankfurt', 'Linz'] == 1)
m.addConstr(y['Linz', 'Frankfurt'] == 1)

m.optimize()

for v in m.getVars():
    if v.X != 0:
        print('%s %f' % (v.Varname, v.X))

print('Optimal cost: %f' % m.objVal)

m.write('model_q3.lp')
