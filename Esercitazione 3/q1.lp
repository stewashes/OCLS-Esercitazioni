\ Model Vehicle Allocation Model
\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  186 x[1,4,1] + 186 x[3,2,2] + 186 x[4,1,2] + 192 x[2,4,3] + 176 x[1,3,4]
   + 186 x[2,3,4] + 200 x[4,3,4] + 294 x[2,1,5] + 192 x[2,4,5]
   + 186 x[4,1,5] + 294 x[2,1,6] + 200 x[4,3,6] - 232.5 y[1,4,1]
   - 232.5 y[3,2,2] - 232.5 y[4,1,2] - 240 y[2,4,3] - 220 y[1,3,4]
   - 232.5 y[2,3,4] - 250 y[4,3,4] - 367.5 y[2,1,5] - 240 y[2,4,5]
   - 232.5 y[4,1,5] - 367.5 y[2,1,6] - 250 y[4,3,6]
Subject To
 conservazione_t1[1]: x[1,1,1] + x[1,2,1] + x[1,3,1] + x[1,4,1] + y[1,1,1]
   + y[1,2,1] + y[1,3,1] + y[1,4,1] = 1
 conservazione_t1[2]: x[2,1,1] + x[2,2,1] + x[2,3,1] + x[2,4,1] + y[2,1,1]
   + y[2,2,1] + y[2,3,1] + y[2,4,1] = 0
 conservazione_t1[3]: x[3,1,1] + x[3,2,1] + x[3,3,1] + x[3,4,1] + y[3,1,1]
   + y[3,2,1] + y[3,3,1] + y[3,4,1] = 0
 conservazione_t1[4]: x[4,1,1] + x[4,2,1] + x[4,3,1] + x[4,4,1] + y[4,1,1]
   + y[4,2,1] + y[4,3,1] + y[4,4,1] = 0
 conservazione_t2[1,2]: x[2,1,1] + x[3,1,1] + x[4,1,1] - x[1,1,2]
   - x[1,2,2] - x[1,3,2] - x[1,4,2] + 3 y[1,1,1] + y[2,1,1] + y[3,1,1]
   + y[4,1,1] - y[1,1,2] - y[1,2,2] - y[1,3,2] - y[1,4,2] = 0
 conservazione_t2[1,3]: x[2,1,2] + x[3,1,2] + x[4,1,2] - x[1,1,3]
   - x[1,2,3] - x[1,3,3] - x[1,4,3] + 3 y[1,1,2] + y[2,1,2] + y[3,1,2]
   + y[4,1,2] - y[1,1,3] - y[1,2,3] - y[1,3,3] - y[1,4,3] = 0
 conservazione_t2[1,4]: x[2,1,3] + x[3,1,3] + x[4,1,3] - x[1,1,4]
   - x[1,2,4] - x[1,3,4] - x[1,4,4] + 3 y[1,1,3] + y[2,1,3] + y[3,1,3]
   + y[4,1,3] - y[1,1,4] - y[1,2,4] - y[1,3,4] - y[1,4,4] = 0
 conservazione_t2[1,5]: x[2,1,4] + x[3,1,4] + x[4,1,4] - x[1,1,5]
   - x[1,2,5] - x[1,3,5] - x[1,4,5] + 3 y[1,1,4] + y[2,1,4] + y[3,1,4]
   + y[4,1,4] - y[1,1,5] - y[1,2,5] - y[1,3,5] - y[1,4,5] = 0
 conservazione_t2[1,6]: x[2,1,5] + x[3,1,5] + x[4,1,5] - x[1,1,6]
   - x[1,2,6] - x[1,3,6] - x[1,4,6] + 3 y[1,1,5] + y[2,1,5] + y[3,1,5]
   + y[4,1,5] - y[1,1,6] - y[1,2,6] - y[1,3,6] - y[1,4,6] = 0
 conservazione_t2[2,2]: x[1,2,1] + x[3,2,1] + x[4,2,1] - x[2,1,2]
   - x[2,2,2] - x[2,3,2] - x[2,4,2] + y[1,2,1] + 3 y[2,2,1] + y[3,2,1]
   + y[4,2,1] - y[2,1,2] - y[2,2,2] - y[2,3,2] - y[2,4,2] = 0
 conservazione_t2[2,3]: x[1,2,2] + x[3,2,2] + x[4,2,2] - x[2,1,3]
   - x[2,2,3] - x[2,3,3] - x[2,4,3] + y[1,2,2] + 3 y[2,2,2] + y[3,2,2]
   + y[4,2,2] - y[2,1,3] - y[2,2,3] - y[2,3,3] - y[2,4,3] = 0
 conservazione_t2[2,4]: x[1,2,3] + x[3,2,3] + x[4,2,3] - x[2,1,4]
   - x[2,2,4] - x[2,3,4] - x[2,4,4] + y[1,2,3] + 3 y[2,2,3] + y[3,2,3]
   + y[4,2,3] - y[2,1,4] - y[2,2,4] - y[2,3,4] - y[2,4,4] = 0
 conservazione_t2[2,5]: x[1,2,4] + x[3,2,4] + x[4,2,4] - x[2,1,5]
   - x[2,2,5] - x[2,3,5] - x[2,4,5] + y[1,2,4] + 3 y[2,2,4] + y[3,2,4]
   + y[4,2,4] - y[2,1,5] - y[2,2,5] - y[2,3,5] - y[2,4,5] = 0
 conservazione_t2[2,6]: x[1,2,5] + x[3,2,5] + x[4,2,5] - x[2,1,6]
   - x[2,2,6] - x[2,3,6] - x[2,4,6] + y[1,2,5] + 3 y[2,2,5] + y[3,2,5]
   + y[4,2,5] - y[2,1,6] - y[2,2,6] - y[2,3,6] - y[2,4,6] = 0
 conservazione_t2[3,2]: x[1,3,1] + x[2,3,1] + x[4,3,1] - x[3,1,2]
   - x[3,2,2] - x[3,3,2] - x[3,4,2] + y[1,3,1] + y[2,3,1] + 3 y[3,3,1]
   + y[4,3,1] - y[3,1,2] - y[3,2,2] - y[3,3,2] - y[3,4,2] = -1
 conservazione_t2[3,3]: x[1,3,2] + x[2,3,2] + x[4,3,2] - x[3,1,3]
   - x[3,2,3] - x[3,3,3] - x[3,4,3] + y[1,3,2] + y[2,3,2] + 3 y[3,3,2]
   + y[4,3,2] - y[3,1,3] - y[3,2,3] - y[3,3,3] - y[3,4,3] = 0
 conservazione_t2[3,4]: x[1,3,3] + x[2,3,3] + x[4,3,3] - x[3,1,4]
   - x[3,2,4] - x[3,3,4] - x[3,4,4] + y[1,3,3] + y[2,3,3] + 3 y[3,3,3]
   + y[4,3,3] - y[3,1,4] - y[3,2,4] - y[3,3,4] - y[3,4,4] = 0
 conservazione_t2[3,5]: x[1,3,4] + x[2,3,4] + x[4,3,4] - x[3,1,5]
   - x[3,2,5] - x[3,3,5] - x[3,4,5] + y[1,3,4] + y[2,3,4] + 3 y[3,3,4]
   + y[4,3,4] - y[3,1,5] - y[3,2,5] - y[3,3,5] - y[3,4,5] = 0
 conservazione_t2[3,6]: x[1,3,5] + x[2,3,5] + x[4,3,5] - x[3,1,6]
   - x[3,2,6] - x[3,3,6] - x[3,4,6] + y[1,3,5] + y[2,3,5] + 3 y[3,3,5]
   + y[4,3,5] - y[3,1,6] - y[3,2,6] - y[3,3,6] - y[3,4,6] = 0
 conservazione_t2[4,2]: x[1,4,1] + x[2,4,1] + x[3,4,1] - x[4,1,2]
   - x[4,2,2] - x[4,3,2] - x[4,4,2] + y[1,4,1] + y[2,4,1] + y[3,4,1]
   + 3 y[4,4,1] - y[4,1,2] - y[4,2,2] - y[4,3,2] - y[4,4,2] = -1
 conservazione_t2[4,3]: x[1,4,2] + x[2,4,2] + x[3,4,2] - x[4,1,3]
   - x[4,2,3] - x[4,3,3] - x[4,4,3] + y[1,4,2] + y[2,4,2] + y[3,4,2]
   + 3 y[4,4,2] - y[4,1,3] - y[4,2,3] - y[4,3,3] - y[4,4,3] = 0
 conservazione_t2[4,4]: x[1,4,3] + x[2,4,3] + x[3,4,3] - x[4,1,4]
   - x[4,2,4] - x[4,3,4] - x[4,4,4] + y[1,4,3] + y[2,4,3] + y[3,4,3]
   + 3 y[4,4,3] - y[4,1,4] - y[4,2,4] - y[4,3,4] - y[4,4,4] = 0
 conservazione_t2[4,5]: x[1,4,4] + x[2,4,4] + x[3,4,4] - x[4,1,5]
   - x[4,2,5] - x[4,3,5] - x[4,4,5] + y[1,4,4] + y[2,4,4] + y[3,4,4]
   + 3 y[4,4,4] - y[4,1,5] - y[4,2,5] - y[4,3,5] - y[4,4,5] = 0
 conservazione_t2[4,6]: x[1,4,5] + x[2,4,5] + x[3,4,5] - x[4,1,6]
   - x[4,2,6] - x[4,3,6] - x[4,4,6] + y[1,4,5] + y[2,4,5] + y[3,4,5]
   + 3 y[4,4,5] - y[4,1,6] - y[4,2,6] - y[4,3,6] - y[4,4,6] = 0
 soddisfazione_domanda[1,1,1]: x[1,1,1] <= 0
 soddisfazione_domanda[1,2,1]: x[1,2,1] <= 0
 soddisfazione_domanda[1,3,1]: x[1,3,1] <= 0
 soddisfazione_domanda[1,4,1]: x[1,4,1] <= 1
 soddisfazione_domanda[2,1,1]: x[2,1,1] <= 0
 soddisfazione_domanda[2,2,1]: x[2,2,1] <= 0
 soddisfazione_domanda[2,3,1]: x[2,3,1] <= 0
 soddisfazione_domanda[2,4,1]: x[2,4,1] <= 0
 soddisfazione_domanda[3,1,1]: x[3,1,1] <= 0
 soddisfazione_domanda[3,2,1]: x[3,2,1] <= 0
 soddisfazione_domanda[3,3,1]: x[3,3,1] <= 0
 soddisfazione_domanda[3,4,1]: x[3,4,1] <= 0
 soddisfazione_domanda[4,1,1]: x[4,1,1] <= 0
 soddisfazione_domanda[4,2,1]: x[4,2,1] <= 0
 soddisfazione_domanda[4,3,1]: x[4,3,1] <= 0
 soddisfazione_domanda[4,4,1]: x[4,4,1] <= 0
 soddisfazione_domanda[1,1,2]: x[1,1,2] <= 0
 soddisfazione_domanda[1,2,2]: x[1,2,2] <= 0
 soddisfazione_domanda[1,3,2]: x[1,3,2] <= 0
 soddisfazione_domanda[1,4,2]: x[1,4,2] <= 0
 soddisfazione_domanda[2,1,2]: x[2,1,2] <= 0
 soddisfazione_domanda[2,2,2]: x[2,2,2] <= 0
 soddisfazione_domanda[2,3,2]: x[2,3,2] <= 0
 soddisfazione_domanda[2,4,2]: x[2,4,2] <= 0
 soddisfazione_domanda[3,1,2]: x[3,1,2] <= 0
 soddisfazione_domanda[3,2,2]: x[3,2,2] <= 2
 soddisfazione_domanda[3,3,2]: x[3,3,2] <= 0
 soddisfazione_domanda[3,4,2]: x[3,4,2] <= 0
 soddisfazione_domanda[4,1,2]: x[4,1,2] <= 1
 soddisfazione_domanda[4,2,2]: x[4,2,2] <= 0
 soddisfazione_domanda[4,3,2]: x[4,3,2] <= 0
 soddisfazione_domanda[4,4,2]: x[4,4,2] <= 0
 soddisfazione_domanda[1,1,3]: x[1,1,3] <= 0
 soddisfazione_domanda[1,2,3]: x[1,2,3] <= 0
 soddisfazione_domanda[1,3,3]: x[1,3,3] <= 0
 soddisfazione_domanda[1,4,3]: x[1,4,3] <= 0
 soddisfazione_domanda[2,1,3]: x[2,1,3] <= 0
 soddisfazione_domanda[2,2,3]: x[2,2,3] <= 0
 soddisfazione_domanda[2,3,3]: x[2,3,3] <= 0
 soddisfazione_domanda[2,4,3]: x[2,4,3] <= 2
 soddisfazione_domanda[3,1,3]: x[3,1,3] <= 0
 soddisfazione_domanda[3,2,3]: x[3,2,3] <= 0
 soddisfazione_domanda[3,3,3]: x[3,3,3] <= 0
 soddisfazione_domanda[3,4,3]: x[3,4,3] <= 0
 soddisfazione_domanda[4,1,3]: x[4,1,3] <= 0
 soddisfazione_domanda[4,2,3]: x[4,2,3] <= 0
 soddisfazione_domanda[4,3,3]: x[4,3,3] <= 0
 soddisfazione_domanda[4,4,3]: x[4,4,3] <= 0
 soddisfazione_domanda[1,1,4]: x[1,1,4] <= 0
 soddisfazione_domanda[1,2,4]: x[1,2,4] <= 0
 soddisfazione_domanda[1,3,4]: x[1,3,4] <= 1
 soddisfazione_domanda[1,4,4]: x[1,4,4] <= 0
 soddisfazione_domanda[2,1,4]: x[2,1,4] <= 0
 soddisfazione_domanda[2,2,4]: x[2,2,4] <= 0
 soddisfazione_domanda[2,3,4]: x[2,3,4] <= 1
 soddisfazione_domanda[2,4,4]: x[2,4,4] <= 0
 soddisfazione_domanda[3,1,4]: x[3,1,4] <= 0
 soddisfazione_domanda[3,2,4]: x[3,2,4] <= 0
 soddisfazione_domanda[3,3,4]: x[3,3,4] <= 0
 soddisfazione_domanda[3,4,4]: x[3,4,4] <= 0
 soddisfazione_domanda[4,1,4]: x[4,1,4] <= 0
 soddisfazione_domanda[4,2,4]: x[4,2,4] <= 0
 soddisfazione_domanda[4,3,4]: x[4,3,4] <= 1
 soddisfazione_domanda[4,4,4]: x[4,4,4] <= 0
 soddisfazione_domanda[1,1,5]: x[1,1,5] <= 0
 soddisfazione_domanda[1,2,5]: x[1,2,5] <= 0
 soddisfazione_domanda[1,3,5]: x[1,3,5] <= 0
 soddisfazione_domanda[1,4,5]: x[1,4,5] <= 0
 soddisfazione_domanda[2,1,5]: x[2,1,5] <= 1
 soddisfazione_domanda[2,2,5]: x[2,2,5] <= 0
 soddisfazione_domanda[2,3,5]: x[2,3,5] <= 0
 soddisfazione_domanda[2,4,5]: x[2,4,5] <= 1
 soddisfazione_domanda[3,1,5]: x[3,1,5] <= 0
 soddisfazione_domanda[3,2,5]: x[3,2,5] <= 0
 soddisfazione_domanda[3,3,5]: x[3,3,5] <= 0
 soddisfazione_domanda[3,4,5]: x[3,4,5] <= 0
 soddisfazione_domanda[4,1,5]: x[4,1,5] <= 2
 soddisfazione_domanda[4,2,5]: x[4,2,5] <= 0
 soddisfazione_domanda[4,3,5]: x[4,3,5] <= 0
 soddisfazione_domanda[4,4,5]: x[4,4,5] <= 0
 soddisfazione_domanda[1,1,6]: x[1,1,6] <= 0
 soddisfazione_domanda[1,2,6]: x[1,2,6] <= 0
 soddisfazione_domanda[1,3,6]: x[1,3,6] <= 0
 soddisfazione_domanda[1,4,6]: x[1,4,6] <= 0
 soddisfazione_domanda[2,1,6]: x[2,1,6] <= 1
 soddisfazione_domanda[2,2,6]: x[2,2,6] <= 0
 soddisfazione_domanda[2,3,6]: x[2,3,6] <= 0
 soddisfazione_domanda[2,4,6]: x[2,4,6] <= 0
 soddisfazione_domanda[3,1,6]: x[3,1,6] <= 0
 soddisfazione_domanda[3,2,6]: x[3,2,6] <= 0
 soddisfazione_domanda[3,3,6]: x[3,3,6] <= 0
 soddisfazione_domanda[3,4,6]: x[3,4,6] <= 0
 soddisfazione_domanda[4,1,6]: x[4,1,6] <= 0
 soddisfazione_domanda[4,2,6]: x[4,2,6] <= 0
 soddisfazione_domanda[4,3,6]: x[4,3,6] <= 1
 soddisfazione_domanda[4,4,6]: x[4,4,6] <= 0
Bounds
End
