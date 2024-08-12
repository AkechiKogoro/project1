class Solution:
    def spiralMatrixIII(self, rows: int, cols: int, rStart: int, cStart: int) -> List[List[int]]:
        remain = rows * cols - 1 
        L = [[rStart, cStart]]
        rCur, cCur = rStart, cStart
        p = 1
        while remain > 0:
            for i in range(p):
                cCur += 1
                if rCur >= 0 and rCur < rows and cCur >= 0 and cCur < cols:
                    L.append([rCur, cCur])
                    remain -= 1
            
            for i in range(p):
                rCur += 1
                if rCur >= 0 and rCur < rows and cCur >= 0 and cCur < cols:
                    L.append([rCur, cCur])
                    remain -= 1
            
            p += 1

            for i in range(p):
                cCur -= 1
                if rCur >= 0 and rCur < rows and cCur >= 0 and cCur < cols:
                    L.append([rCur, cCur])
                    remain -= 1
            
            for i in range(p):
                rCur -= 1
                if rCur >= 0 and rCur < rows and cCur >= 0 and cCur < cols:
                    L.append([rCur, cCur])
                    remain -= 1
            
            p += 1
        
        return L