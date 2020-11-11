\ Model Linear Transport
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  70000 y[Torino] + 90000 y[Genova] + 100000 y[Milano] + 90000 y[Bologna]
   + 13.5 s[1,Torino,Torino] + 63 s[1,Torino,Savona]
   + 81 s[1,Torino,Genova] + 63 s[1,Torino,Milano]
   + 103.5 s[1,Torino,Brescia] + 81 s[1,Torino,Piacenza]
   + 148.5 s[1,Torino,Bologna] + 166.5 s[1,Torino,Padova]
   + 81 s[1,Genova,Torino] + 22.5 s[1,Genova,Savona] + 9 s[1,Genova,Genova]
   + 65.25 s[1,Genova,Milano] + 103.5 s[1,Genova,Brescia]
   + 67.5 s[1,Genova,Piacenza] + 135 s[1,Genova,Bologna]
   + 166.5 s[1,Genova,Padova] + 63 s[1,Milano,Torino]
   + 81 s[1,Milano,Savona] + 65.25 s[1,Milano,Genova]
   + 18 s[1,Milano,Milano] + 45 s[1,Milano,Brescia]
   + 33.75 s[1,Milano,Piacenza] + 96.75 s[1,Milano,Bologna]
   + 112.5 s[1,Milano,Padova] + 148.5 s[1,Bologna,Torino]
   + 153 s[1,Bologna,Savona] + 135 s[1,Bologna,Genova]
   + 96.75 s[1,Bologna,Milano] + 92.25 s[1,Bologna,Brescia]
   + 69.75 s[1,Bologna,Piacenza] + 13.5 s[1,Bologna,Bologna]
   + 54 s[1,Bologna,Padova] + 18 s[2,Torino,Torino] + 84 s[2,Torino,Savona]
   + 108 s[2,Torino,Genova] + 84 s[2,Torino,Milano]
   + 138 s[2,Torino,Brescia] + 108 s[2,Torino,Piacenza]
   + 198 s[2,Torino,Bologna] + 222 s[2,Torino,Padova]
   + 108 s[2,Genova,Torino] + 30 s[2,Genova,Savona] + 12 s[2,Genova,Genova]
   + 87 s[2,Genova,Milano] + 138 s[2,Genova,Brescia]
   + 90 s[2,Genova,Piacenza] + 180 s[2,Genova,Bologna]
   + 222 s[2,Genova,Padova] + 84 s[2,Milano,Torino]
   + 108 s[2,Milano,Savona] + 87 s[2,Milano,Genova] + 24 s[2,Milano,Milano]
   + 60 s[2,Milano,Brescia] + 45 s[2,Milano,Piacenza]
   + 129 s[2,Milano,Bologna] + 150 s[2,Milano,Padova]
   + 198 s[2,Bologna,Torino] + 204 s[2,Bologna,Savona]
   + 180 s[2,Bologna,Genova] + 129 s[2,Bologna,Milano]
   + 123 s[2,Bologna,Brescia] + 93 s[2,Bologna,Piacenza]
   + 18 s[2,Bologna,Bologna] + 72 s[2,Bologna,Padova]
Subject To
 demand1_satisfied[Torino]: s[1,Torino,Torino] + s[1,Genova,Torino]
   + s[1,Milano,Torino] + s[1,Bologna,Torino] = 600
 demand1_satisfied[Savona]: s[1,Torino,Savona] + s[1,Genova,Savona]
   + s[1,Milano,Savona] + s[1,Bologna,Savona] = 200
 demand1_satisfied[Genova]: s[1,Torino,Genova] + s[1,Genova,Genova]
   + s[1,Milano,Genova] + s[1,Bologna,Genova] = 500
 demand1_satisfied[Milano]: s[1,Torino,Milano] + s[1,Genova,Milano]
   + s[1,Milano,Milano] + s[1,Bologna,Milano] = 700
 demand1_satisfied[Brescia]: s[1,Torino,Brescia] + s[1,Genova,Brescia]
   + s[1,Milano,Brescia] + s[1,Bologna,Brescia] = 250
 demand1_satisfied[Piacenza]: s[1,Torino,Piacenza] + s[1,Genova,Piacenza]
   + s[1,Milano,Piacenza] + s[1,Bologna,Piacenza] = 300
 demand1_satisfied[Bologna]: s[1,Torino,Bologna] + s[1,Genova,Bologna]
   + s[1,Milano,Bologna] + s[1,Bologna,Bologna] = 350
 demand1_satisfied[Padova]: s[1,Torino,Padova] + s[1,Genova,Padova]
   + s[1,Milano,Padova] + s[1,Bologna,Padova] = 250
 demand2_satisfied[Torino]: s[2,Torino,Torino] + s[2,Genova,Torino]
   + s[2,Milano,Torino] + s[2,Bologna,Torino] = 200
 demand2_satisfied[Savona]: s[2,Torino,Savona] + s[2,Genova,Savona]
   + s[2,Milano,Savona] + s[2,Bologna,Savona] = 50
 demand2_satisfied[Genova]: s[2,Torino,Genova] + s[2,Genova,Genova]
   + s[2,Milano,Genova] + s[2,Bologna,Genova] = 150
 demand2_satisfied[Milano]: s[2,Torino,Milano] + s[2,Genova,Milano]
   + s[2,Milano,Milano] + s[2,Bologna,Milano] = 200
 demand2_satisfied[Brescia]: s[2,Torino,Brescia] + s[2,Genova,Brescia]
   + s[2,Milano,Brescia] + s[2,Bologna,Brescia] = 50
 demand2_satisfied[Piacenza]: s[2,Torino,Piacenza] + s[2,Genova,Piacenza]
   + s[2,Milano,Piacenza] + s[2,Bologna,Piacenza] = 100
 demand2_satisfied[Bologna]: s[2,Torino,Bologna] + s[2,Genova,Bologna]
   + s[2,Milano,Bologna] + s[2,Bologna,Bologna] = 100
 demand2_satisfied[Padova]: s[2,Torino,Padova] + s[2,Genova,Padova]
   + s[2,Milano,Padova] + s[2,Bologna,Padova] = 50
 max_capacity[Torino]: - 1600 y[Torino] + s[1,Torino,Torino]
   + s[1,Torino,Savona] + s[1,Torino,Genova] + s[1,Torino,Milano]
   + s[1,Torino,Brescia] + s[1,Torino,Piacenza] + s[1,Torino,Bologna]
   + s[1,Torino,Padova] + s[2,Torino,Torino] + s[2,Torino,Savona]
   + s[2,Torino,Genova] + s[2,Torino,Milano] + s[2,Torino,Brescia]
   + s[2,Torino,Piacenza] + s[2,Torino,Bologna] + s[2,Torino,Padova] <= 0
 max_capacity[Genova]: - 1400 y[Genova] + s[1,Genova,Torino]
   + s[1,Genova,Savona] + s[1,Genova,Genova] + s[1,Genova,Milano]
   + s[1,Genova,Brescia] + s[1,Genova,Piacenza] + s[1,Genova,Bologna]
   + s[1,Genova,Padova] + s[2,Genova,Torino] + s[2,Genova,Savona]
   + s[2,Genova,Genova] + s[2,Genova,Milano] + s[2,Genova,Brescia]
   + s[2,Genova,Piacenza] + s[2,Genova,Bologna] + s[2,Genova,Padova] <= 0
 max_capacity[Milano]: - 1700 y[Milano] + s[1,Milano,Torino]
   + s[1,Milano,Savona] + s[1,Milano,Genova] + s[1,Milano,Milano]
   + s[1,Milano,Brescia] + s[1,Milano,Piacenza] + s[1,Milano,Bologna]
   + s[1,Milano,Padova] + s[2,Milano,Torino] + s[2,Milano,Savona]
   + s[2,Milano,Genova] + s[2,Milano,Milano] + s[2,Milano,Brescia]
   + s[2,Milano,Piacenza] + s[2,Milano,Bologna] + s[2,Milano,Padova] <= 0
 max_capacity[Bologna]: - 1500 y[Bologna] + s[1,Bologna,Torino]
   + s[1,Bologna,Savona] + s[1,Bologna,Genova] + s[1,Bologna,Milano]
   + s[1,Bologna,Brescia] + s[1,Bologna,Piacenza] + s[1,Bologna,Bologna]
   + s[1,Bologna,Padova] + s[2,Bologna,Torino] + s[2,Bologna,Savona]
   + s[2,Bologna,Genova] + s[2,Bologna,Milano] + s[2,Bologna,Brescia]
   + s[2,Bologna,Piacenza] + s[2,Bologna,Bologna] + s[2,Bologna,Padova]
   <= 0
Bounds
Binaries
 y[Torino] y[Genova] y[Milano] y[Bologna]
End
