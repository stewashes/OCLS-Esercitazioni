from gurobipy import *

m = Model ('Location')

Products = ['prod1', 'prod2']
Nodes=['Nantes', 'Paris', 'Lyon', 'Marseille', 'Frankfurt', 'Milan', 'Hannover', 'Linz', 'Prague']

# od is the offer if positive, the demand if negative and it is associated to a transhipment node when 0
Nodes_Products, od = multidict({
('Nantes', 'prod1'): [150],
('Nantes', 'prod2'): [-290],
('Paris', 'prod1'): [220],
('Paris', 'prod2'): [380],
('Marseille', 'prod1'): [-270],
('Marseille', 'prod2'): [180],
('Hannover', 'prod1'): [300],
('Hannover', 'prod2'): [-300],
('Milan', 'prod1'): [-200],
('Milan', 'prod2'): [-200],
('Prague', 'prod1'): [-200],
('Prague', 'prod2'): [230],
('Lyon', 'prod1'): [0],
('Lyon', 'prod2'): [0],
('Frankfurt', 'prod1'): [0],
('Frankfurt', 'prod2'): [0],
('Linz', 'prod1'): [0],
('Linz', 'prod2'): [0]
})

Nodes, connections =multidict({
'Nantes': [['Lyon', 'Frankfurt']],
'Paris': [['Lyon', 'Frankfurt']],
'Marseille': [['Lyon', 'Frankfurt']],
'Hannover': [['Frankfurt', 'Linz']],
'Milan': [['Frankfurt', 'Linz']],
'Prague': [['Linz']],
'Lyon': [['Nantes', 'Paris', 'Marseille', 'Frankfurt']],
'Frankfurt': [['Nantes', 'Paris', 'Marseille', 'Milan', 'Hannover', 'Lyon', 'Linz']],
'Linz': [['Milan', 'Hannover', 'Prague', 'Frankfurt']]
})

Arcs, q_tot, f = multidict({
('Nantes', 'Lyon'): [600, 50000],
('Lyon', 'Nantes'): [600, 50000],
('Nantes', 'Frankfurt'): [600, 50000],
('Frankfurt', 'Nantes'): [600, 50000],

('Paris', 'Lyon'): [600, 50000],
('Lyon', 'Paris'): [600, 50000],
('Paris', 'Frankfurt'): [600, 50000],
('Frankfurt', 'Paris'): [600, 50000],

('Marseille', 'Lyon'): [600, 50000],
('Lyon', 'Marseille'): [600, 50000],
('Marseille', 'Frankfurt'): [600, 50000],
('Frankfurt', 'Marseille'): [600, 50000],

('Hannover', 'Frankfurt'): [600, 50000],
('Frankfurt', 'Hannover'): [600, 50000],
('Hannover', 'Linz'): [600, 50000],
('Linz', 'Hannover'): [600, 50000],

('Milan', 'Frankfurt'): [600, 50000],
('Frankfurt', 'Milan'): [600, 50000],
('Milan', 'Linz'): [600, 50000],
('Linz', 'Milan'): [600, 50000],

('Prague', 'Linz'): [600, 50000],
('Linz', 'Prague'): [600, 50000],

('Lyon', 'Frankfurt'): [2000, 70000],
('Frankfurt', 'Lyon'): [2000, 70000],

('Frankfurt', 'Linz'): [2000, 70000],
('Linz', 'Frankfurt'): [2000, 70000],
})


Arcs_Products, q_per_prod, c = multidict({
('Nantes', 'Lyon', 'prod1'): [400, 300],
('Nantes', 'Lyon', 'prod2'): [400, 350],
('Lyon', 'Nantes', 'prod1'): [400, 300],
('Lyon', 'Nantes', 'prod2'): [400, 350],

('Nantes', 'Frankfurt', 'prod1'): [400, 450],
('Nantes', 'Frankfurt', 'prod2'): [400, 500],
('Frankfurt', 'Nantes', 'prod1'): [400, 450],
('Frankfurt', 'Nantes', 'prod2'): [400, 500],

('Paris', 'Lyon', 'prod1'): [400, 300],
('Paris', 'Lyon', 'prod2'): [400, 350],
('Lyon', 'Paris', 'prod1'): [400, 300],
('Lyon', 'Paris', 'prod2'): [400, 350],

('Paris', 'Frankfurt', 'prod1'): [400, 450],
('Paris', 'Frankfurt', 'prod2'): [400, 500],
('Frankfurt', 'Paris', 'prod1'): [400, 450],
('Frankfurt', 'Paris', 'prod2'): [400, 500],

('Marseille', 'Lyon', 'prod1'): [400, 250],
('Marseille', 'Lyon', 'prod2'): [400, 300],
('Lyon', 'Marseille', 'prod1'): [400, 250],
('Lyon', 'Marseille', 'prod2'): [400, 300],

('Marseille', 'Frankfurt', 'prod1'): [400, 450],
('Marseille', 'Frankfurt', 'prod2'): [400, 500],
('Frankfurt', 'Marseille', 'prod1'): [400, 450],
('Frankfurt', 'Marseille', 'prod2'): [400, 500],

('Milan', 'Frankfurt', 'prod1'): [400, 350],
('Milan', 'Frankfurt', 'prod2'): [400, 400],
('Frankfurt', 'Milan', 'prod1'): [400, 350],
('Frankfurt', 'Milan', 'prod2'): [400, 400],

('Milan', 'Linz', 'prod1'): [400, 450],
('Milan', 'Linz', 'prod2'): [400, 500],
('Linz', 'Milan', 'prod1'): [400, 450],
('Linz', 'Milan', 'prod2'): [400, 500],

('Hannover', 'Frankfurt', 'prod1'): [400, 250],
('Hannover', 'Frankfurt', 'prod2'): [400, 300],
('Frankfurt', 'Hannover', 'prod1'): [400, 250],
('Frankfurt', 'Hannover', 'prod2'): [400, 300],

('Hannover', 'Linz', 'prod1'): [400, 400],
('Hannover', 'Linz', 'prod2'): [400, 450],
('Linz', 'Hannover', 'prod1'): [400, 400],
('Linz', 'Hannover', 'prod2'): [400, 450],

('Prague', 'Linz', 'prod1'): [400, 150],
('Prague', 'Linz', 'prod2'): [400, 200],
('Linz', 'Prague', 'prod1'): [400, 150],
('Linz', 'Prague', 'prod2'): [400, 200],

('Lyon', 'Frankfurt', 'prod1'): [1000, 200],
('Lyon', 'Frankfurt', 'prod2'): [1000, 250],
('Frankfurt', 'Lyon', 'prod1'): [1000, 200],
('Frankfurt', 'Lyon', 'prod2'): [1000, 250],

('Frankfurt', 'Linz', 'prod1'): [1000, 200],
('Frankfurt', 'Linz', 'prod2'): [1000, 250],
('Linz', 'Frankfurt', 'prod1'): [1000, 200],
('Linz', 'Frankfurt', 'prod2'): [1000, 250]
})


y=m.addVars(Arcs, name='y', vtype=GRB.BINARY)
x=m.addVars(Arcs_Products, name='x', ub=q_per_prod)

obj = quicksum(f[i,j] * y[i,j] for i,j in Arcs)+ quicksum(c[i,j,k] * x[i,j,k] for i,j,k in Arcs_Products)

m.setObjective(obj, GRB.MINIMIZE)

m.addConstrs((quicksum(x[i,j,k] for j in connections[i])-quicksum(x[j,i,k] for j in connections[i])==od[i,k] for i,k in Nodes_Products), name='constr_balance')

m.addConstrs((quicksum(x[i,j,k] for k in Products) <= q_tot[i,j]*y[i,j] for i,j in Arcs), name='constr_capac')

'''
#point 3 of the exercise
m.addConstr(y['Lyon', 'Frankfurt']==1)
m.addConstr(y['Frankfurt', 'Lyon']==1)
m.addConstr(y['Linz', 'Frankfurt']==1)
m.addConstr(y['Frankfurt', 'Linz']==1)
'''


m.optimize()


for v in m.getVars():
    if v.X != 0:
        print ('%s %f' % (v.Varname, v.X))

print('Optimal cost: %f' % m.objVal)


m.write('/Users/silvia/Desktop/model_nd.lp')
