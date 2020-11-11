\ Model Linear Transport
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  70000 y[Torino] + 90000 y[Genova] + 100000 y[Milano] + 90000 y[Bologna]
   + 8100 x[Torino,Torino] + 12600 x[Torino,Savona]
   + 40500 x[Torino,Genova] + 44100 x[Torino,Milano]
   + 25875 x[Torino,Brescia] + 24300 x[Torino,Piacenza]
   + 51975 x[Torino,Bologna] + 41625 x[Torino,Padova]
   + 48600 x[Genova,Torino] + 4500 x[Genova,Savona] + 4500 x[Genova,Genova]
   + 45675 x[Genova,Milano] + 25875 x[Genova,Brescia]
   + 20250 x[Genova,Piacenza] + 47250 x[Genova,Bologna]
   + 41625 x[Genova,Padova] + 37800 x[Milano,Torino]
   + 16200 x[Milano,Savona] + 32625 x[Milano,Genova]
   + 12600 x[Milano,Milano] + 11250 x[Milano,Brescia]
   + 10125 x[Milano,Piacenza] + 33862.5 x[Milano,Bologna]
   + 28125 x[Milano,Padova] + 89100 x[Bologna,Torino]
   + 30600 x[Bologna,Savona] + 67500 x[Bologna,Genova]
   + 67725 x[Bologna,Milano] + 23062.5 x[Bologna,Brescia]
   + 20925 x[Bologna,Piacenza] + 4725 x[Bologna,Bologna]
   + 13500 x[Bologna,Padova]
Subject To
 demand_satisfied[Torino]: x[Torino,Torino] + x[Genova,Torino]
   + x[Milano,Torino] + x[Bologna,Torino] = 1
 demand_satisfied[Savona]: x[Torino,Savona] + x[Genova,Savona]
   + x[Milano,Savona] + x[Bologna,Savona] = 1
 demand_satisfied[Genova]: x[Torino,Genova] + x[Genova,Genova]
   + x[Milano,Genova] + x[Bologna,Genova] = 1
 demand_satisfied[Milano]: x[Torino,Milano] + x[Genova,Milano]
   + x[Milano,Milano] + x[Bologna,Milano] = 1
 demand_satisfied[Brescia]: x[Torino,Brescia] + x[Genova,Brescia]
   + x[Milano,Brescia] + x[Bologna,Brescia] = 1
 demand_satisfied[Piacenza]: x[Torino,Piacenza] + x[Genova,Piacenza]
   + x[Milano,Piacenza] + x[Bologna,Piacenza] = 1
 demand_satisfied[Bologna]: x[Torino,Bologna] + x[Genova,Bologna]
   + x[Milano,Bologna] + x[Bologna,Bologna] = 1
 demand_satisfied[Padova]: x[Torino,Padova] + x[Genova,Padova]
   + x[Milano,Padova] + x[Bologna,Padova] = 1
 max_capacity[Torino]: - 1600 y[Torino] + 600 x[Torino,Torino]
   + 200 x[Torino,Savona] + 500 x[Torino,Genova] + 700 x[Torino,Milano]
   + 250 x[Torino,Brescia] + 300 x[Torino,Piacenza] + 350 x[Torino,Bologna]
   + 250 x[Torino,Padova] <= 0
 max_capacity[Genova]: - 1400 y[Genova] + 600 x[Genova,Torino]
   + 200 x[Genova,Savona] + 500 x[Genova,Genova] + 700 x[Genova,Milano]
   + 250 x[Genova,Brescia] + 300 x[Genova,Piacenza] + 350 x[Genova,Bologna]
   + 250 x[Genova,Padova] <= 0
 max_capacity[Milano]: - 1700 y[Milano] + 600 x[Milano,Torino]
   + 200 x[Milano,Savona] + 500 x[Milano,Genova] + 700 x[Milano,Milano]
   + 250 x[Milano,Brescia] + 300 x[Milano,Piacenza] + 350 x[Milano,Bologna]
   + 250 x[Milano,Padova] <= 0
 max_capacity[Bologna]: - 1500 y[Bologna] + 600 x[Bologna,Torino]
   + 200 x[Bologna,Savona] + 500 x[Bologna,Genova] + 700 x[Bologna,Milano]
   + 250 x[Bologna,Brescia] + 300 x[Bologna,Piacenza]
   + 350 x[Bologna,Bologna] + 250 x[Bologna,Padova] <= 0
Bounds
 x[Torino,Torino] <= 1
 x[Torino,Savona] <= 1
 x[Torino,Genova] <= 1
 x[Torino,Milano] <= 1
 x[Torino,Brescia] <= 1
 x[Torino,Piacenza] <= 1
 x[Torino,Bologna] <= 1
 x[Torino,Padova] <= 1
 x[Genova,Torino] <= 1
 x[Genova,Savona] <= 1
 x[Genova,Genova] <= 1
 x[Genova,Milano] <= 1
 x[Genova,Brescia] <= 1
 x[Genova,Piacenza] <= 1
 x[Genova,Bologna] <= 1
 x[Genova,Padova] <= 1
 x[Milano,Torino] <= 1
 x[Milano,Savona] <= 1
 x[Milano,Genova] <= 1
 x[Milano,Milano] <= 1
 x[Milano,Brescia] <= 1
 x[Milano,Piacenza] <= 1
 x[Milano,Bologna] <= 1
 x[Milano,Padova] <= 1
 x[Bologna,Torino] <= 1
 x[Bologna,Savona] <= 1
 x[Bologna,Genova] <= 1
 x[Bologna,Milano] <= 1
 x[Bologna,Brescia] <= 1
 x[Bologna,Piacenza] <= 1
 x[Bologna,Bologna] <= 1
 x[Bologna,Padova] <= 1
Binaries
 y[Torino] y[Genova] y[Milano] y[Bologna]
End
