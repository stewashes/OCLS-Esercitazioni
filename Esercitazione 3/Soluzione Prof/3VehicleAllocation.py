from gurobipy import *

m = Model ('Vehicle Allocation')

cost=0.5
revenue=0.9
Num_days=6

Times=range(1,Num_days+1);
Nodes=['Amsterdam', 'Hamburg', 'Frankfurt', 'Dresden']

Arcs, distance = multidict({
('Amsterdam', 'Hamburg'): [465],
('Hamburg', 'Amsterdam'): [465],
('Amsterdam', 'Frankfurt'): [440],
('Frankfurt', 'Amsterdam'): [440],
('Amsterdam', 'Dresden'): [735],
('Dresden', 'Amsterdam'): [735],
('Frankfurt', 'Hamburg'): [500],
('Hamburg', 'Frankfurt'): [500],
('Frankfurt', 'Dresden'): [465],
('Dresden', 'Frankfurt'): [465],
('Hamburg', 'Dresden'): [480],
('Dresden', 'Hamburg'): [480],
('Amsterdam', 'Amsterdam'): [0],  
('Hamburg', 'Hamburg'): [0],
('Frankfurt', 'Frankfurt'): [0],
('Dresden', 'Dresden'): [0]
})

# I set the availabilities of vehicles to 0, then I define only the valus different from 0 

avail={}

for i in Nodes:
    for t in Times:
        avail[i,t]=0

avail['Amsterdam', 1]=1
avail['Frankfurt', 2]=1
avail['Hamburg', 2]=1


# I set the demands to 0, then I define only the valus different from 0 

demand={}

for i,j in Arcs:
    for t in Times:
        demand[i,j,t]=0
        
demand['Amsterdam','Hamburg',1]=1
demand['Frankfurt','Dresden',2]=2
demand['Hamburg','Amsterdam',2]=1
demand['Dresden','Hamburg',3]=2
demand['Amsterdam','Frankfurt',4]=1
demand['Hamburg','Frankfurt',4]=1
demand['Dresden','Frankfurt',4]=1
demand['Dresden','Amsterdam',5]=1
demand['Dresden','Hamburg',5]=1
demand['Hamburg','Amsterdam',5]=2
demand['Hamburg','Frankfurt',6]=1
demand['Dresden','Amsterdam',6]=1




y=m.addVars(Arcs, Times, name='y')
x=m.addVars(Arcs, Times, name='x', ub=demand)


obj = quicksum(revenue* distance[i,j] * x[i,j,t] for i,j in Arcs for t in Times)\
    -quicksum(cost* distance[i,j] * y[i,j,t] for i,j in Arcs for t in Times)

m.setObjective(obj, GRB.MAXIMIZE)


m.addConstrs((avail[i,1]== (quicksum(x[i,j,1]+y[i,j,1] for j in Nodes)) for i in Nodes),\
             name='constr_balance_time1')
    
m.addConstrs((avail[i,t]+ (quicksum(x[j,i,t-1]+y[j,i,t-1] for j in Nodes))==  \
             (quicksum(x[i,j,t]+y[i,j,t] for j in Nodes)) for i in Nodes for t in Times if t!=1),\
             name='constr_balance_time>1')


m.optimize()

# Print outpout

print()

print('OPTIMAL COST: %f' % m.objVal)

print()
print('FULL VEHICLES')

for t in Times:
    for i,j in Arcs:
        if x[i,j,t].X !=0:
            print('day', t, 'from', i, 'to', j, x[i,j,t].X)
        
print()
print('EMPTY VEHICLES')

for t in Times:
    for i,j in Arcs:
        if y[i,j,t].X!=0:
            print('day', t, 'from', i, 'to', j, y[i,j,t].X)
  

print()
print('UNSATISFIED DEMAND')

demand_unsat={}

for t in Times:
    for i,j in Arcs:
        demand_unsat[i,j,t]=demand[i,j,t]-x[i,j,t].X
        if demand_unsat[i,j,t] !=0.0:
            print ('day', t, 'from', i, 'to', j, demand_unsat[i,j,t])

print()
print('FINAL VEHICLES')

final_vehicles={}

for i in Nodes:
    final_vehicles[i]= sum(x[j,i,Num_days].X+y[j,i,Num_days].X for j in Nodes)
    print (i, final_vehicles[i])



m.write('/Users/silvia/Desktop/model_vehall.lp')


