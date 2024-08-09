from collections import Counter
class Solution:
    def countOfAtoms(self, formula: str) -> str:
        L = []
        lower = set([chr(i) for i in range(ord('a'), ord('z')+1)])
        upper = set([chr(i) for i in range(ord('A'), ord('Z')+1)])
        

        i = 0
        while i < len(formula):
        
            while len(L) >= 2 and type(L[-1]) == type(Counter()) and type(L[-2]) == type(Counter()):
                L[-2] = L[-2] + L[-1]
                L.pop()

            if formula[i] in upper:
                c = formula[i]
                if len(L) == 0 or L[-1] == '(':
                    L.append(Counter())
                
                j = i + 1
                while j < len(formula) and formula[j] in lower:
                    c = c + formula[j]
                    j += 1
                
                
                if c not in L[-1].keys():
                    L[-1][c] = 0

                if j < len(formula) and formula[j] >= '0' and formula[j] <= '9':
                    k = 0
                    while j < len(formula) and formula[j] >= '0' and formula[j] <= '9':
                        k = k * 10 
                        k += int(formula[j])
                        j += 1
                    
                    L[-1][c] = L[-1].get(c, 0) + k
                
                else:
                    L[-1][c] = L[-1].get(c, 0) + 1
                
                i = j
            elif formula[i] == '(':
                L.append('(')
                i += 1
            elif formula[i] == ')':
                k = 0
                
                j = i + 1
                if j < len(formula) and formula[j] >= '0' and formula[j] <= '9':
                    while j < len(formula) and formula[j] >= '0' and formula[j] <= '9':
                        k = k * 10 + int(formula[j])
                        j += 1
                else:
                    k = 1
                

                L[-2] = L[-1]
                L.pop()
                temp_list = L[-1].keys()
                for c in temp_list:
                    L[-1][c] = L[-1][c] * k 
                
                i = j

        while len(L) >= 2 and type(L[-1]) == type(Counter()) and type(L[-2]) == type(Counter()):
            L[-2] = L[-2] + L[-1]
            L.pop()

        D = L[0]
        temp = list(D.items())
        temp.sort()
        s = ""
        for i in range(len(temp)):
            s = s + temp[i][0]
            if temp[i][1] > 1:
                s = s + str(temp[i][1])
        
        return s