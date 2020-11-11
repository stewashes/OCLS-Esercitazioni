\ Model Network Design
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  70000 y[Lyon,Frankfurt] + 70000 y[Frankfurt,Lyon]
   + 70000 y[Frankfurt,Linz] + 70000 y[Linz,Frankfurt]
   + 50000 y[Nantes,Frankfurt] + 50000 y[Frankfurt,Nantes]
   + 50000 y[Nantes,Lyon] + 50000 y[Lyon,Nantes] + 50000 y[Paris,Frankfurt]
   + 50000 y[Frankfurt,Paris] + 50000 y[Paris,Lyon] + 50000 y[Lyon,Paris]
   + 50000 y[Marseille,Frankfurt] + 50000 y[Frankfurt,Marseille]
   + 50000 y[Marseille,Lyon] + 50000 y[Lyon,Marseille]
   + 50000 y[Hannover,Frankfurt] + 50000 y[Frankfurt,Hannover]
   + 50000 y[Milan,Frankfurt] + 50000 y[Frankfurt,Milan]
   + 50000 y[Hannover,Linz] + 50000 y[Linz,Hannover] + 50000 y[Milan,Linz]
   + 50000 y[Linz,Milan] + 50000 y[Prague,Linz] + 50000 y[Linz,Prague]
   + 200 x[Lyon,Frankfurt,prod1] + 250 x[Lyon,Frankfurt,prod2]
   + 200 x[Frankfurt,Lyon,prod1] + 250 x[Frankfurt,Lyon,prod2]
   + 200 x[Frankfurt,Linz,prod1] + 250 x[Frankfurt,Linz,prod2]
   + 200 x[Linz,Frankfurt,prod1] + 250 x[Linz,Frankfurt,prod2]
   + 450 x[Nantes,Frankfurt,prod1] + 500 x[Nantes,Frankfurt,prod2]
   + 450 x[Frankfurt,Nantes,prod1] + 500 x[Frankfurt,Nantes,prod2]
   + 300 x[Nantes,Lyon,prod1] + 350 x[Nantes,Lyon,prod2]
   + 300 x[Lyon,Nantes,prod1] + 350 x[Lyon,Nantes,prod2]
   + 450 x[Paris,Frankfurt,prod1] + 500 x[Paris,Frankfurt,prod2]
   + 450 x[Frankfurt,Paris,prod1] + 500 x[Frankfurt,Paris,prod2]
   + 300 x[Paris,Lyon,prod1] + 350 x[Paris,Lyon,prod2]
   + 300 x[Lyon,Paris,prod1] + 350 x[Lyon,Paris,prod2]
   + 450 x[Marseille,Frankfurt,prod1] + 500 x[Marseille,Frankfurt,prod2]
   + 450 x[Frankfurt,Marseille,prod1] + 500 x[Frankfurt,Marseille,prod2]
   + 250 x[Marseille,Lyon,prod1] + 300 x[Marseille,Lyon,prod2]
   + 250 x[Lyon,Marseille,prod1] + 300 x[Lyon,Marseille,prod2]
   + 250 x[Hannover,Frankfurt,prod1] + 300 x[Hannover,Frankfurt,prod2]
   + 250 x[Frankfurt,Hannover,prod1] + 300 x[Frankfurt,Hannover,prod2]
   + 350 x[Milan,Frankfurt,prod1] + 400 x[Milan,Frankfurt,prod2]
   + 350 x[Frankfurt,Milan,prod1] + 400 x[Frankfurt,Milan,prod2]
   + 400 x[Hannover,Linz,prod1] + 450 x[Hannover,Linz,prod2]
   + 400 x[Linz,Hannover,prod1] + 450 x[Linz,Hannover,prod2]
   + 450 x[Milan,Linz,prod1] + 500 x[Milan,Linz,prod2]
   + 450 x[Linz,Milan,prod1] + 500 x[Linz,Milan,prod2]
   + 150 x[Prague,Linz,prod1] + 200 x[Prague,Linz,prod2]
   + 150 x[Linz,Prague,prod1] + 200 x[Linz,Prague,prod2]
Subject To
 flow_prod1[Linz]: - x[Frankfurt,Linz,prod1] + x[Linz,Frankfurt,prod1]
   - x[Hannover,Linz,prod1] + x[Linz,Hannover,prod1] - x[Milan,Linz,prod1]
   + x[Linz,Milan,prod1] - x[Prague,Linz,prod1] + x[Linz,Prague,prod1] = 0
 flow_prod1[Frankfurt]: - x[Lyon,Frankfurt,prod1] + x[Frankfurt,Lyon,prod1]
   + x[Frankfurt,Linz,prod1] - x[Linz,Frankfurt,prod1]
   - x[Nantes,Frankfurt,prod1] + x[Frankfurt,Nantes,prod1]
   - x[Paris,Frankfurt,prod1] + x[Frankfurt,Paris,prod1]
   - x[Marseille,Frankfurt,prod1] + x[Frankfurt,Marseille,prod1]
   - x[Hannover,Frankfurt,prod1] + x[Frankfurt,Hannover,prod1]
   - x[Milan,Frankfurt,prod1] + x[Frankfurt,Milan,prod1] = 0
 flow_prod1[Lyon]: x[Lyon,Frankfurt,prod1] - x[Frankfurt,Lyon,prod1]
   - x[Nantes,Lyon,prod1] + x[Lyon,Nantes,prod1] - x[Paris,Lyon,prod1]
   + x[Lyon,Paris,prod1] - x[Marseille,Lyon,prod1]
   + x[Lyon,Marseille,prod1] = 0
 flow_prod1[Nantes]: x[Nantes,Frankfurt,prod1] - x[Frankfurt,Nantes,prod1]
   + x[Nantes,Lyon,prod1] - x[Lyon,Nantes,prod1] = 150
 flow_prod1[Paris]: x[Paris,Frankfurt,prod1] - x[Frankfurt,Paris,prod1]
   + x[Paris,Lyon,prod1] - x[Lyon,Paris,prod1] = 220
 flow_prod1[Marseille]: x[Marseille,Frankfurt,prod1]
   - x[Frankfurt,Marseille,prod1] + x[Marseille,Lyon,prod1]
   - x[Lyon,Marseille,prod1] = -270
 flow_prod1[Hannover]: x[Hannover,Frankfurt,prod1]
   - x[Frankfurt,Hannover,prod1] + x[Hannover,Linz,prod1]
   - x[Linz,Hannover,prod1] = 300
 flow_prod1[Milan]: x[Milan,Frankfurt,prod1] - x[Frankfurt,Milan,prod1]
   + x[Milan,Linz,prod1] - x[Linz,Milan,prod1] = -200
 flow_prod1[Prague]: x[Prague,Linz,prod1] - x[Linz,Prague,prod1] = -200
 flow_prod2[Linz]: - x[Frankfurt,Linz,prod2] + x[Linz,Frankfurt,prod2]
   - x[Hannover,Linz,prod2] + x[Linz,Hannover,prod2] - x[Milan,Linz,prod2]
   + x[Linz,Milan,prod2] - x[Prague,Linz,prod2] + x[Linz,Prague,prod2] = 0
 flow_prod2[Frankfurt]: - x[Lyon,Frankfurt,prod2] + x[Frankfurt,Lyon,prod2]
   + x[Frankfurt,Linz,prod2] - x[Linz,Frankfurt,prod2]
   - x[Nantes,Frankfurt,prod2] + x[Frankfurt,Nantes,prod2]
   - x[Paris,Frankfurt,prod2] + x[Frankfurt,Paris,prod2]
   - x[Marseille,Frankfurt,prod2] + x[Frankfurt,Marseille,prod2]
   - x[Hannover,Frankfurt,prod2] + x[Frankfurt,Hannover,prod2]
   - x[Milan,Frankfurt,prod2] + x[Frankfurt,Milan,prod2] = 0
 flow_prod2[Lyon]: x[Lyon,Frankfurt,prod2] - x[Frankfurt,Lyon,prod2]
   - x[Nantes,Lyon,prod2] + x[Lyon,Nantes,prod2] - x[Paris,Lyon,prod2]
   + x[Lyon,Paris,prod2] - x[Marseille,Lyon,prod2]
   + x[Lyon,Marseille,prod2] = 0
 flow_prod2[Nantes]: x[Nantes,Frankfurt,prod2] - x[Frankfurt,Nantes,prod2]
   + x[Nantes,Lyon,prod2] - x[Lyon,Nantes,prod2] = -290
 flow_prod2[Paris]: x[Paris,Frankfurt,prod2] - x[Frankfurt,Paris,prod2]
   + x[Paris,Lyon,prod2] - x[Lyon,Paris,prod2] = 380
 flow_prod2[Marseille]: x[Marseille,Frankfurt,prod2]
   - x[Frankfurt,Marseille,prod2] + x[Marseille,Lyon,prod2]
   - x[Lyon,Marseille,prod2] = 180
 flow_prod2[Hannover]: x[Hannover,Frankfurt,prod2]
   - x[Frankfurt,Hannover,prod2] + x[Hannover,Linz,prod2]
   - x[Linz,Hannover,prod2] = -300
 flow_prod2[Milan]: x[Milan,Frankfurt,prod2] - x[Frankfurt,Milan,prod2]
   + x[Milan,Linz,prod2] - x[Linz,Milan,prod2] = -200
 flow_prod2[Prague]: x[Prague,Linz,prod2] - x[Linz,Prague,prod2] = 230
 R18: - 2000 y[Lyon,Frankfurt] + x[Lyon,Frankfurt,prod1]
   + x[Lyon,Frankfurt,prod2] <= 0
 R19: - 2000 y[Frankfurt,Lyon] + x[Frankfurt,Lyon,prod1]
   + x[Frankfurt,Lyon,prod2] <= 0
 R20: - 2000 y[Frankfurt,Linz] + x[Frankfurt,Linz,prod1]
   + x[Frankfurt,Linz,prod2] <= 0
 R21: - 2000 y[Linz,Frankfurt] + x[Linz,Frankfurt,prod1]
   + x[Linz,Frankfurt,prod2] <= 0
 R22: - 600 y[Nantes,Frankfurt] + x[Nantes,Frankfurt,prod1]
   + x[Nantes,Frankfurt,prod2] <= 0
 R23: - 600 y[Frankfurt,Nantes] + x[Frankfurt,Nantes,prod1]
   + x[Frankfurt,Nantes,prod2] <= 0
 R24: - 600 y[Nantes,Lyon] + x[Nantes,Lyon,prod1] + x[Nantes,Lyon,prod2]
   <= 0
 R25: - 600 y[Lyon,Nantes] + x[Lyon,Nantes,prod1] + x[Lyon,Nantes,prod2]
   <= 0
 R26: - 600 y[Paris,Frankfurt] + x[Paris,Frankfurt,prod1]
   + x[Paris,Frankfurt,prod2] <= 0
 R27: - 600 y[Frankfurt,Paris] + x[Frankfurt,Paris,prod1]
   + x[Frankfurt,Paris,prod2] <= 0
 R28: - 600 y[Paris,Lyon] + x[Paris,Lyon,prod1] + x[Paris,Lyon,prod2] <= 0
 R29: - 600 y[Lyon,Paris] + x[Lyon,Paris,prod1] + x[Lyon,Paris,prod2] <= 0
 R30: - 600 y[Marseille,Frankfurt] + x[Marseille,Frankfurt,prod1]
   + x[Marseille,Frankfurt,prod2] <= 0
 R31: - 600 y[Frankfurt,Marseille] + x[Frankfurt,Marseille,prod1]
   + x[Frankfurt,Marseille,prod2] <= 0
 R32: - 600 y[Marseille,Lyon] + x[Marseille,Lyon,prod1]
   + x[Marseille,Lyon,prod2] <= 0
 R33: - 600 y[Lyon,Marseille] + x[Lyon,Marseille,prod1]
   + x[Lyon,Marseille,prod2] <= 0
 R34: - 600 y[Hannover,Frankfurt] + x[Hannover,Frankfurt,prod1]
   + x[Hannover,Frankfurt,prod2] <= 0
 R35: - 600 y[Frankfurt,Hannover] + x[Frankfurt,Hannover,prod1]
   + x[Frankfurt,Hannover,prod2] <= 0
 R36: - 600 y[Milan,Frankfurt] + x[Milan,Frankfurt,prod1]
   + x[Milan,Frankfurt,prod2] <= 0
 R37: - 600 y[Frankfurt,Milan] + x[Frankfurt,Milan,prod1]
   + x[Frankfurt,Milan,prod2] <= 0
 R38: - 600 y[Hannover,Linz] + x[Hannover,Linz,prod1]
   + x[Hannover,Linz,prod2] <= 0
 R39: - 600 y[Linz,Hannover] + x[Linz,Hannover,prod1]
   + x[Linz,Hannover,prod2] <= 0
 R40: - 600 y[Milan,Linz] + x[Milan,Linz,prod1] + x[Milan,Linz,prod2] <= 0
 R41: - 600 y[Linz,Milan] + x[Linz,Milan,prod1] + x[Linz,Milan,prod2] <= 0
 R42: - 600 y[Prague,Linz] + x[Prague,Linz,prod1] + x[Prague,Linz,prod2]
   <= 0
 R43: - 600 y[Linz,Prague] + x[Linz,Prague,prod1] + x[Linz,Prague,prod2]
   <= 0
 R44: x[Lyon,Frankfurt,prod1] <= 1000
 R45: x[Frankfurt,Lyon,prod1] <= 1000
 R46: x[Frankfurt,Linz,prod1] <= 1000
 R47: x[Linz,Frankfurt,prod1] <= 1000
 R48: x[Nantes,Frankfurt,prod1] <= 400
 R49: x[Frankfurt,Nantes,prod1] <= 400
 R50: x[Nantes,Lyon,prod1] <= 400
 R51: x[Lyon,Nantes,prod1] <= 400
 R52: x[Paris,Frankfurt,prod1] <= 400
 R53: x[Frankfurt,Paris,prod1] <= 400
 R54: x[Paris,Lyon,prod1] <= 400
 R55: x[Lyon,Paris,prod1] <= 400
 R56: x[Marseille,Frankfurt,prod1] <= 400
 R57: x[Frankfurt,Marseille,prod1] <= 400
 R58: x[Marseille,Lyon,prod1] <= 400
 R59: x[Lyon,Marseille,prod1] <= 400
 R60: x[Hannover,Frankfurt,prod1] <= 400
 R61: x[Frankfurt,Hannover,prod1] <= 400
 R62: x[Milan,Frankfurt,prod1] <= 400
 R63: x[Frankfurt,Milan,prod1] <= 400
 R64: x[Hannover,Linz,prod1] <= 400
 R65: x[Linz,Hannover,prod1] <= 400
 R66: x[Milan,Linz,prod1] <= 400
 R67: x[Linz,Milan,prod1] <= 400
 R68: x[Prague,Linz,prod1] <= 400
 R69: x[Linz,Prague,prod1] <= 400
 R70: x[Lyon,Frankfurt,prod2] <= 1000
 R71: x[Frankfurt,Lyon,prod2] <= 1000
 R72: x[Frankfurt,Linz,prod2] <= 1000
 R73: x[Linz,Frankfurt,prod2] <= 1000
 R74: x[Nantes,Frankfurt,prod2] <= 400
 R75: x[Frankfurt,Nantes,prod2] <= 400
 R76: x[Nantes,Lyon,prod2] <= 400
 R77: x[Lyon,Nantes,prod2] <= 400
 R78: x[Paris,Frankfurt,prod2] <= 400
 R79: x[Frankfurt,Paris,prod2] <= 400
 R80: x[Paris,Lyon,prod2] <= 400
 R81: x[Lyon,Paris,prod2] <= 400
 R82: x[Marseille,Frankfurt,prod2] <= 400
 R83: x[Frankfurt,Marseille,prod2] <= 400
 R84: x[Marseille,Lyon,prod2] <= 400
 R85: x[Lyon,Marseille,prod2] <= 400
 R86: x[Hannover,Frankfurt,prod2] <= 400
 R87: x[Frankfurt,Hannover,prod2] <= 400
 R88: x[Milan,Frankfurt,prod2] <= 400
 R89: x[Frankfurt,Milan,prod2] <= 400
 R90: x[Hannover,Linz,prod2] <= 400
 R91: x[Linz,Hannover,prod2] <= 400
 R92: x[Milan,Linz,prod2] <= 400
 R93: x[Linz,Milan,prod2] <= 400
 R94: x[Prague,Linz,prod2] <= 400
 R95: x[Linz,Prague,prod2] <= 400
 R96: y[Lyon,Frankfurt] = 1
 R97: y[Frankfurt,Lyon] = 1
 R98: y[Frankfurt,Linz] = 1
 R99: y[Linz,Frankfurt] = 1
Bounds
Binaries
 y[Lyon,Frankfurt] y[Frankfurt,Lyon] y[Frankfurt,Linz] y[Linz,Frankfurt]
 y[Nantes,Frankfurt] y[Frankfurt,Nantes] y[Nantes,Lyon] y[Lyon,Nantes]
 y[Paris,Frankfurt] y[Frankfurt,Paris] y[Paris,Lyon] y[Lyon,Paris]
 y[Marseille,Frankfurt] y[Frankfurt,Marseille] y[Marseille,Lyon]
 y[Lyon,Marseille] y[Hannover,Frankfurt] y[Frankfurt,Hannover]
 y[Milan,Frankfurt] y[Frankfurt,Milan] y[Hannover,Linz] y[Linz,Hannover]
 y[Milan,Linz] y[Linz,Milan] y[Prague,Linz] y[Linz,Prague]
End
