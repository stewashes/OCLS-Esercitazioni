from gurobipy import *

m = Model ('Location')

Commodities = ['prod1', 'prod2']
Demand_points = ['TO', 'SV', 'GE', 'MI', 'BS', 'PC', 'BO', 'PD' ]

Potential_nodes, f, q = multidict({
'TO': [70000, 1600],
'GE': [90000, 1400],
'MI': [100000, 1700],
'BO': [90000, 1500]
})

Demand_commodities, d = multidict({
('TO', 'prod1'): [600],
('TO', 'prod2'): [200],
('SV', 'prod1'): [200],
('SV', 'prod2'): [50],
('GE', 'prod1'): [500],
('GE', 'prod2'): [150],
('MI', 'prod1'): [700],
('MI', 'prod2'): [200],
('BS', 'prod1'): [250],
('BS', 'prod2'): [50],
('PC', 'prod1'): [300],
('PC', 'prod2'): [100],
('BO', 'prod1'): [350],
('BO', 'prod2'): [100],
('PD', 'prod1'): [250],
('PD', 'prod2'): [50]
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
s=m.addVars(Arcs, Commodities, name='s')

obj = quicksum(f[i] * y[i] for i in Potential_nodes)+ quicksum(0.45*dist[i,j]*s[i,j,'prod1']+0.6*dist[i,j]*s[i,j,'prod2'] for i,j in Arcs)

m.setObjective(obj, GRB.MINIMIZE)

m.addConstrs((quicksum(s[i,j,h] for i in Potential_nodes)==d[j,h] for j,h in Demand_commodities), name='constr_demand')

m.addConstrs((quicksum(s[i,j,h] for j in Demand_points for h in Commodities) <= q[i]*y[i] for i in Potential_nodes), name='constr_capac')


m.optimize()

for v in m.getVars():
    if v.X != 0:
        print ('%s %f' % (v.Varname, v.X))

print('Optimal cost: %f' % m.objVal)


m.write('/Users/silvia/Desktop/model_mp.lp')
