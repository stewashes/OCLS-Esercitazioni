from gurobipy import *

m = Model ('Location')

Potential_nodes, f, q = multidict({
'TO': [70000, 1600],
'GE': [90000, 1400],
'MI': [100000, 1700],
'BO': [90000, 1500]
})

Demand_points, d = multidict({
'TO': [600],
'SV': [200],
'GE': [500],
'MI': [700],
'BS': [250],
'PC': [300],
'BO': [350],
'PD': [250]
})

Arcs, dist= multidict({
('TO', 'TO'): [30],
('TO', 'SV'): [140],
('TO', 'GE'): [180],
('TO', 'MI'): [140],
('TO', 'BS'): [230],
('TO', 'PC'): [180],
('TO', 'BO'): [330],
('TO', 'PD'): [370],
('GE', 'TO'): [180],
('GE', 'SV'): [50],
('GE', 'GE'): [20],
('GE', 'MI'): [145],
('GE', 'BS'): [230],
('GE', 'PC'): [150],
('GE', 'BO'): [300],
('GE', 'PD'): [370],
('MI', 'TO'): [140],
('MI', 'SV'): [180],
('MI', 'GE'): [145],
('MI', 'MI'): [40],
('MI', 'BS'): [100],
('MI', 'PC'): [75],
('MI', 'BO'): [215],
('MI', 'PD'): [250],
('BO', 'TO'): [330],
('BO', 'SV'): [340],
('BO', 'GE'): [300],
('BO', 'MI'): [215],
('BO', 'BS'): [205],
('BO', 'PC'): [155],
('BO', 'BO'): [30],
('BO', 'PD'): [120],
})

y=m.addVars(Potential_nodes, name='y', vtype=GRB.BINARY)

s=m.addVars(Arcs, name='s')


obj = quicksum(f[i] * y[i] for i in Potential_nodes)+ quicksum(0.45*dist[i,j]*s[i,j] for i,j in Arcs)

m.setObjective(obj, GRB.MINIMIZE)

m.addConstrs((quicksum(s[i,j] for i in Potential_nodes)==d[j] for j in Demand_points), name='constr_demand')

m.addConstrs((quicksum(s[i,j] for j in Demand_points) <= q[i]*y[i] for i in Potential_nodes), name='constr_capac')

m.addConstr(quicksum(y[i] for i in Potential_nodes) ==3, name='constr_num_nodes')

m.optimize()

for v in m.getVars():
    if v.X != 0:
        print ('%s %f' % (v.Varname, v.X))

print('Optimal cost: %f' % m.objVal)


m.write('/Users/silvia/Desktop/model.lp')
