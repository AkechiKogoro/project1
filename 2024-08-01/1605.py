from heapq import heapify, heappush, heappop 
class Solution:
    def restoreMatrix(self, rowSum: List[int], colSum: List[int]) -> List[List[int]]:
        m, n = len(rowSum), len(colSum)
        

        matrix = [[0 for _ in range(n)] for _ in range(m)]

        i, j = 0, 0 
        while i < m and j < n:
            p = min(rowSum[i], colSum[j])
            matrix[i][j] = p 
            rowSum[i] -= p
            colSum[j] -= p     
            if rowSum[i] == 0:
                i += 1 
            
            if colSum[j] == 0:
                j += 1
        
        return matrix