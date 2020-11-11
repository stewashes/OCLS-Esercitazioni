# -*- coding: utf-8 -*-
"""
Created on Thu Oct 29 11:25:48 2020

"""

from gurobipy import *

m = Model ('Location')

Commodities = ['prod1', 'prod2']
Nodes = ['NA', 'PA', 'HA', 'MA', 'MI', 'PR', 'LY', 'FR', 'LI']
Transhipment_nodes = ['LY', 'FR', 'LI']
Non_Transhipment_nodes = ['NA', 'PA', 'HA', 'MA', 'MI', 'PR']

Primary_connections= [['LY', 'FR'], ['LY', 'FR'], ['FR', 'LY'], ['FR', 'LI'], ['LI', 'FR']]

Secondary_connections=[['NA', 'LY'], ['LY', 'NA'], ['NA', 'FR'], ['FR', 'NA'], ['PA', 'LY'], ['LY', 'PA'],
['PA', 'FR'], ['FR', 'PA'], ['MA', 'LY'], ['LY', 'MA'], ['MA', 'FR'], ['FR', 'MA'], ['MI', 'FR'],
['FR', 'MI'], ['MI', 'LI'], ['LI', 'MI'], ['HA', 'FR'], ['FR', 'HA'], ['HA', 'LI'], ['LI', 'HA'],
['PR', 'LI'], ['LI', 'PR']  ]


Connections, c1, c2 = multidict({
    ('LY', 'FR'): [200, 250],
    ('FR', 'LY'): [200, 250],
    ('FR', 'LI'): [200, 250],
    ('LI', 'FR'): [200, 250],
    ('NA', 'LY'): [300, 350],
    ('LY', 'NA'): [300, 350],
    ('NA', 'FR'): [450, 500],
    ('FR', 'NA'): [450, 500],
    ('PA', 'LY'): [300, 350],
    ('LY', 'PA'): [300, 350],
    ('PA', 'FR'): [450, 500],
    ('FR', 'PA'): [450, 500],
    ('MA', 'LY'): [250, 300],
    ('LY', 'MA'): [250, 300],
    ('MA', 'FR'): [450, 500],
    ('FR', 'MA'): [450, 500],
    ('MI', 'FR'): [350, 400],
    ('FR', 'MI'): [350, 400],
    ('MI', 'LI'): [450, 500],
    ('LI', 'MI'): [450, 500],
    ('HA', 'FR'): [250, 300],
    ('FR', 'HA'): [250, 300],
    ('HA', 'LI'): [400, 450],
    ('LI', 'HA'): [400, 450],
    ('PR', 'LI'): [150, 200],
    ('LI', 'PR'): [150, 200]

})


Demand, d = multidict({
('MA', 'prod1'): [270],
('MI', 'prod1'): [200],
('PR', 'prod1'): [200],
('NA', 'prod2'): [290],
('HA', 'prod2'): [300],
('MI', 'prod2'): [200]

})

Offer, o = multidict({
('NA', 'prod1'): [150],
('PA', 'prod1'): [220],
('HA', 'prod1'): [300],
('PA', 'prod2'): [380],
('MA', 'prod2'): [180],
('PR', 'prod2'): [230]
})

Trans, tr = multidict({
('LY', 'prod1'): [0],
('LY', 'prod2'): [0],
('FR', 'prod1'): [0],
('FR', 'prod2'): [0],
('LI', 'prod2'): [0],
('LI', 'prod2'): [0]
})


y=m.addVars(Connections, name='y', vtype=GRB.BINARY)
x=m.addVars(Connections, Commodities, name='x')

obj = quicksum(70000 * y[i,j] for i,j in Primary_connections)+ quicksum(50000*y[i,j] for i,j in Secondary_connections)+quicksum(c1[i,j]*x[i,j,'prod1']+c2[i,j]*x[i,j,'prod2'] for i,j in Connections)

m.setObjective(obj, GRB.MINIMIZE)

m.addConstrs(quicksum(x[i,j,k] for j in Transhipment_nodes if (i,j) in Connections)-quicksum(x[j,i,k] for j in Transhipment_nodes if (j,i) in Connections) == o[i,k] for i,k in Offer)
m.addConstrs(quicksum(x[i,j,k] for j in Transhipment_nodes if (i,j) in Connections)-quicksum(x[j,i,k] for j in Transhipment_nodes if (j,i) in Connections) == -d[i,k] for i,k in Demand)
m.addConstrs(quicksum(x[i,j,k] for j in Nodes if (i,j) in Connections)-quicksum(x[j,i,k] for j in Nodes if (j,i) in Connections) == 0 for i,k in Trans)

m.addConstrs(quicksum(x[i,j,k] for k in Commodities) <= 2000*y[i,j] for i,j in Primary_connections)
m.addConstrs(quicksum(x[i,j,k] for k in Commodities) <= 600*y[i,j] for i,j in Secondary_connections)

m.addConstrs(x[i,j,'prod1'] <= 1000 for i,j in Primary_connections)
m.addConstrs(x[i,j,'prod2'] <= 1000 for i,j in Primary_connections)
m.addConstrs(x[i,j,'prod1'] <= 400 for i,j in Secondary_connections)
m.addConstrs(x[i,j,'prod2'] <= 400 for i,j in Secondary_connections)




m.optimize()
for v in m.getVars():
    if v.X != 0:
        print ('%s %f' % (v.Varname, v.X))

print('Optimal cost: %f' % m.objVal)


m.write('/Users/silvia/Desktop/model_nd_gr1.lp')
