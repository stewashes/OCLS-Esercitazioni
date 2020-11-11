\ Model Vehicle Allocation Model
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
 
Subject To
 conservazione_t1[1]: x[1,1,1] + x[1,2,1] + x[1,3,1] + x[1,4,1] + y[1,1,1]
   + y[1,2,1] + y[1,3,1] + y[1,4,1] = 1
 conservazione_t1[2]: x[2,1,1] + x[2,2,1] + x[2,3,1] + x[2,4,1] + y[2,1,1]
   + y[2,2,1] + y[2,3,1] + y[2,4,1] = 0
 conservazione_t1[3]: x[3,1,1] + x[3,2,1] + x[3,3,1] + x[3,4,1] + y[3,1,1]
   + y[3,2,1] + y[3,3,1] + y[3,4,1] = 0
 conservazione_t1[4]: x[4,1,1] + x[4,2,1] + x[4,3,1] + x[4,4,1] + y[4,1,1]
   + y[4,2,1] + y[4,3,1] + y[4,4,1] = 0
 conservazione[1,2]: - x[1,1,2] - x[1,2,2] - x[1,3,2] - x[1,4,2] + x[2,1,1]
   + x[3,1,1] + x[4,1,1] + 3 y[1,1,1] - y[1,1,2] - y[1,2,2] - y[1,3,2]
   - y[1,4,2] + y[2,1,1] + y[3,1,1] + y[4,1,1] = 0
 conservazione[1,3]: - x[1,1,3] - x[1,2,3] - x[1,3,3] - x[1,4,3] + x[2,1,2]
   + x[3,1,2] + x[4,1,2] + 3 y[1,1,2] - y[1,1,3] - y[1,2,3] - y[1,3,3]
   - y[1,4,3] + y[2,1,2] + y[3,1,2] + y[4,1,2] = 0
 conservazione[1,4]: - x[1,1,4] - x[1,2,4] - x[1,3,4] - x[1,4,4] + x[2,1,3]
   + x[3,1,3] + x[4,1,3] + 3 y[1,1,3] - y[1,1,4] - y[1,2,4] - y[1,3,4]
   - y[1,4,4] + y[2,1,3] + y[3,1,3] + y[4,1,3] = 0
 conservazione[1,5]: - x[1,1,5] - x[1,2,5] - x[1,3,5] - x[1,4,5] + x[2,1,4]
   + x[3,1,4] + x[4,1,4] + 3 y[1,1,4] - y[1,1,5] - y[1,2,5] - y[1,3,5]
   - y[1,4,5] + y[2,1,4] + y[3,1,4] + y[4,1,4] = 0
 conservazione[1,6]: - x[1,1,6] - x[1,2,6] - x[1,3,6] - x[1,4,6] + x[2,1,5]
   + x[3,1,5] + x[4,1,5] + 3 y[1,1,5] - y[1,1,6] - y[1,2,6] - y[1,3,6]
   - y[1,4,6] + y[2,1,5] + y[3,1,5] + y[4,1,5] = 0
 conservazione[2,2]: x[1,2,1] - x[2,1,2] - x[2,2,2] - x[2,3,2] - x[2,4,2]
   + x[3,2,1] + x[4,2,1] + y[1,2,1] - y[2,1,2] + 3 y[2,2,1] - y[2,2,2]
   - y[2,3,2] - y[2,4,2] + y[3,2,1] + y[4,2,1] = 0
 conservazione[2,3]: x[1,2,2] - x[2,1,3] - x[2,2,3] - x[2,3,3] - x[2,4,3]
   + x[3,2,2] + x[4,2,2] + y[1,2,2] - y[2,1,3] + 3 y[2,2,2] - y[2,2,3]
   - y[2,3,3] - y[2,4,3] + y[3,2,2] + y[4,2,2] = 0
 conservazione[2,4]: x[1,2,3] - x[2,1,4] - x[2,2,4] - x[2,3,4] - x[2,4,4]
   + x[3,2,3] + x[4,2,3] + y[1,2,3] - y[2,1,4] + 3 y[2,2,3] - y[2,2,4]
   - y[2,3,4] - y[2,4,4] + y[3,2,3] + y[4,2,3] = 0
 conservazione[2,5]: x[1,2,4] - x[2,1,5] - x[2,2,5] - x[2,3,5] - x[2,4,5]
   + x[3,2,4] + x[4,2,4] + y[1,2,4] - y[2,1,5] + 3 y[2,2,4] - y[2,2,5]
   - y[2,3,5] - y[2,4,5] + y[3,2,4] + y[4,2,4] = 0
 conservazione[2,6]: x[1,2,5] - x[2,1,6] - x[2,2,6] - x[2,3,6] - x[2,4,6]
   + x[3,2,5] + x[4,2,5] + y[1,2,5] - y[2,1,6] + 3 y[2,2,5] - y[2,2,6]
   - y[2,3,6] - y[2,4,6] + y[3,2,5] + y[4,2,5] = 0
 conservazione[3,2]: x[1,3,1] + x[2,3,1] - x[3,1,2] - x[3,2,2] - x[3,3,2]
   - x[3,4,2] + x[4,3,1] + y[1,3,1] + y[2,3,1] - y[3,1,2] - y[3,2,2]
   + 3 y[3,3,1] - y[3,3,2] - y[3,4,2] + y[4,3,1] = -1
 conservazione[3,3]: x[1,3,2] + x[2,3,2] - x[3,1,3] - x[3,2,3] - x[3,3,3]
   - x[3,4,3] + x[4,3,2] + y[1,3,2] + y[2,3,2] - y[3,1,3] - y[3,2,3]
   + 3 y[3,3,2] - y[3,3,3] - y[3,4,3] + y[4,3,2] = 0
 conservazione[3,4]: x[1,3,3] + x[2,3,3] - x[3,1,4] - x[3,2,4] - x[3,3,4]
   - x[3,4,4] + x[4,3,3] + y[1,3,3] + y[2,3,3] - y[3,1,4] - y[3,2,4]
   + 3 y[3,3,3] - y[3,3,4] - y[3,4,4] + y[4,3,3] = 0
 conservazione[3,5]: x[1,3,4] + x[2,3,4] - x[3,1,5] - x[3,2,5] - x[3,3,5]
   - x[3,4,5] + x[4,3,4] + y[1,3,4] + y[2,3,4] - y[3,1,5] - y[3,2,5]
   + 3 y[3,3,4] - y[3,3,5] - y[3,4,5] + y[4,3,4] = 0
 conservazione[3,6]: x[1,3,5] + x[2,3,5] - x[3,1,6] - x[3,2,6] - x[3,3,6]
   - x[3,4,6] + x[4,3,5] + y[1,3,5] + y[2,3,5] - y[3,1,6] - y[3,2,6]
   + 3 y[3,3,5] - y[3,3,6] - y[3,4,6] + y[4,3,5] = 0
 conservazione[4,2]: x[1,4,1] + x[2,4,1] + x[3,4,1] - x[4,1,2] - x[4,2,2]
   - x[4,3,2] - x[4,4,2] + y[1,4,1] + y[2,4,1] + y[3,4,1] - y[4,1,2]
   - y[4,2,2] - y[4,3,2] + 3 y[4,4,1] - y[4,4,2] = -1
 conservazione[4,3]: x[1,4,2] + x[2,4,2] + x[3,4,2] - x[4,1,3] - x[4,2,3]
   - x[4,3,3] - x[4,4,3] + y[1,4,2] + y[2,4,2] + y[3,4,2] - y[4,1,3]
   - y[4,2,3] - y[4,3,3] + 3 y[4,4,2] - y[4,4,3] = 0
 conservazione[4,4]: x[1,4,3] + x[2,4,3] + x[3,4,3] - x[4,1,4] - x[4,2,4]
   - x[4,3,4] - x[4,4,4] + y[1,4,3] + y[2,4,3] + y[3,4,3] - y[4,1,4]
   - y[4,2,4] - y[4,3,4] + 3 y[4,4,3] - y[4,4,4] = 0
 conservazione[4,5]: x[1,4,4] + x[2,4,4] + x[3,4,4] - x[4,1,5] - x[4,2,5]
   - x[4,3,5] - x[4,4,5] + y[1,4,4] + y[2,4,4] + y[3,4,4] - y[4,1,5]
   - y[4,2,5] - y[4,3,5] + 3 y[4,4,4] - y[4,4,5] = 0
 conservazione[4,6]: x[1,4,5] + x[2,4,5] + x[3,4,5] - x[4,1,6] - x[4,2,6]
   - x[4,3,6] - x[4,4,6] + y[1,4,5] + y[2,4,5] + y[3,4,5] - y[4,1,6]
   - y[4,2,6] - y[4,3,6] + 3 y[4,4,5] - y[4,4,6] = 0
 soddisfazione_domanda[1,1,1]: x[1,1,1] <= 0
 soddisfazione_domanda[1,1,2]: x[1,2,1] <= 0
 soddisfazione_domanda[1,1,3]: x[1,3,1] <= 0
 soddisfazione_domanda[1,1,4]: x[1,4,1] <= 1
 soddisfazione_domanda[1,2,1]: x[2,1,1] <= 0
 soddisfazione_domanda[1,2,2]: x[2,2,1] <= 0
 soddisfazione_domanda[1,2,3]: x[2,3,1] <= 0
 soddisfazione_domanda[1,2,4]: x[2,4,1] <= 0
 soddisfazione_domanda[1,3,1]: x[3,1,1] <= 0
 soddisfazione_domanda[1,3,2]: x[3,2,1] <= 0
 soddisfazione_domanda[1,3,3]: x[3,3,1] <= 0
 soddisfazione_domanda[1,3,4]: x[3,4,1] <= 0
 soddisfazione_domanda[1,4,1]: x[4,1,1] <= 0
 soddisfazione_domanda[1,4,2]: x[4,2,1] <= 0
 soddisfazione_domanda[1,4,3]: x[4,3,1] <= 0
 soddisfazione_domanda[1,4,4]: x[4,4,1] <= 0
 soddisfazione_domanda[2,1,1]: x[1,1,2] <= 0
 soddisfazione_domanda[2,1,2]: x[1,2,2] <= 0
 soddisfazione_domanda[2,1,3]: x[1,3,2] <= 0
 soddisfazione_domanda[2,1,4]: x[1,4,2] <= 0
 soddisfazione_domanda[2,2,1]: x[2,1,2] <= 0
 soddisfazione_domanda[2,2,2]: x[2,2,2] <= 0
 soddisfazione_domanda[2,2,3]: x[2,3,2] <= 0
 soddisfazione_domanda[2,2,4]: x[2,4,2] <= 0
 soddisfazione_domanda[2,3,1]: x[3,1,2] <= 0
 soddisfazione_domanda[2,3,2]: x[3,2,2] <= 2
 soddisfazione_domanda[2,3,3]: x[3,3,2] <= 0
 soddisfazione_domanda[2,3,4]: x[3,4,2] <= 0
 soddisfazione_domanda[2,4,1]: x[4,1,2] <= 1
 soddisfazione_domanda[2,4,2]: x[4,2,2] <= 0
 soddisfazione_domanda[2,4,3]: x[4,3,2] <= 0
 soddisfazione_domanda[2,4,4]: x[4,4,2] <= 0
 soddisfazione_domanda[3,1,1]: x[1,1,3] <= 0
 soddisfazione_domanda[3,1,2]: x[1,2,3] <= 0
 soddisfazione_domanda[3,1,3]: x[1,3,3] <= 0
 soddisfazione_domanda[3,1,4]: x[1,4,3] <= 0
 soddisfazione_domanda[3,2,1]: x[2,1,3] <= 0
 soddisfazione_domanda[3,2,2]: x[2,2,3] <= 0
 soddisfazione_domanda[3,2,3]: x[2,3,3] <= 0
 soddisfazione_domanda[3,2,4]: x[2,4,3] <= 2
 soddisfazione_domanda[3,3,1]: x[3,1,3] <= 0
 soddisfazione_domanda[3,3,2]: x[3,2,3] <= 0
 soddisfazione_domanda[3,3,3]: x[3,3,3] <= 0
 soddisfazione_domanda[3,3,4]: x[3,4,3] <= 0
 soddisfazione_domanda[3,4,1]: x[4,1,3] <= 0
 soddisfazione_domanda[3,4,2]: x[4,2,3] <= 0
 soddisfazione_domanda[3,4,3]: x[4,3,3] <= 0
 soddisfazione_domanda[3,4,4]: x[4,4,3] <= 0
 soddisfazione_domanda[4,1,1]: x[1,1,4] <= 0
 soddisfazione_domanda[4,1,2]: x[1,2,4] <= 0
 soddisfazione_domanda[4,1,3]: x[1,3,4] <= 1
 soddisfazione_domanda[4,1,4]: x[1,4,4] <= 0
 soddisfazione_domanda[4,2,1]: x[2,1,4] <= 0
 soddisfazione_domanda[4,2,2]: x[2,2,4] <= 0
 soddisfazione_domanda[4,2,3]: x[2,3,4] <= 1
 soddisfazione_domanda[4,2,4]: x[2,4,4] <= 0
 soddisfazione_domanda[4,3,1]: x[3,1,4] <= 0
 soddisfazione_domanda[4,3,2]: x[3,2,4] <= 0
 soddisfazione_domanda[4,3,3]: x[3,3,4] <= 0
 soddisfazione_domanda[4,3,4]: x[3,4,4] <= 0
 soddisfazione_domanda[4,4,1]: x[4,1,4] <= 0
 soddisfazione_domanda[4,4,2]: x[4,2,4] <= 0
 soddisfazione_domanda[4,4,3]: x[4,3,4] <= 1
 soddisfazione_domanda[4,4,4]: x[4,4,4] <= 0
 soddisfazione_domanda[5,1,1]: x[1,1,5] <= 0
 soddisfazione_domanda[5,1,2]: x[1,2,5] <= 0
 soddisfazione_domanda[5,1,3]: x[1,3,5] <= 0
 soddisfazione_domanda[5,1,4]: x[1,4,5] <= 0
 soddisfazione_domanda[5,2,1]: x[2,1,5] <= 1
 soddisfazione_domanda[5,2,2]: x[2,2,5] <= 0
 soddisfazione_domanda[5,2,3]: x[2,3,5] <= 0
 soddisfazione_domanda[5,2,4]: x[2,4,5] <= 1
 soddisfazione_domanda[5,3,1]: x[3,1,5] <= 0
 soddisfazione_domanda[5,3,2]: x[3,2,5] <= 0
 soddisfazione_domanda[5,3,3]: x[3,3,5] <= 0
 soddisfazione_domanda[5,3,4]: x[3,4,5] <= 0
 soddisfazione_domanda[5,4,1]: x[4,1,5] <= 2
 soddisfazione_domanda[5,4,2]: x[4,2,5] <= 0
 soddisfazione_domanda[5,4,3]: x[4,3,5] <= 0
 soddisfazione_domanda[5,4,4]: x[4,4,5] <= 0
 soddisfazione_domanda[6,1,1]: x[1,1,6] <= 0
 soddisfazione_domanda[6,1,2]: x[1,2,6] <= 0
 soddisfazione_domanda[6,1,3]: x[1,3,6] <= 0
 soddisfazione_domanda[6,1,4]: x[1,4,6] <= 0
 soddisfazione_domanda[6,2,1]: x[2,1,6] <= 1
 soddisfazione_domanda[6,2,2]: x[2,2,6] <= 0
 soddisfazione_domanda[6,2,3]: x[2,3,6] <= 0
 soddisfazione_domanda[6,2,4]: x[2,4,6] <= 0
 soddisfazione_domanda[6,3,1]: x[3,1,6] <= 0
 soddisfazione_domanda[6,3,2]: x[3,2,6] <= 0
 soddisfazione_domanda[6,3,3]: x[3,3,6] <= 0
 soddisfazione_domanda[6,3,4]: x[3,4,6] <= 0
 soddisfazione_domanda[6,4,1]: x[4,1,6] <= 0
 soddisfazione_domanda[6,4,2]: x[4,2,6] <= 0
 soddisfazione_domanda[6,4,3]: x[4,3,6] <= 1
 soddisfazione_domanda[6,4,4]: x[4,4,6] <= 0
Bounds
End
