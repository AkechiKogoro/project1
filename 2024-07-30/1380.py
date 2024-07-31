class Solution:
    def luckyNumbers (self, matrix: List[List[int]]) -> List[int]:
        m, n = len(matrix), len(matrix[0])
        min_row = [min(x) for x in matrix]
        max_col = []
        lucky = []
        for j in range(n):
            col = [matrix[i][j] for i in range(m)]
            max_col.append(max(col))
        
        for i in range(m):
            for j in range(n):
                if min_row[i] == max_col[j]:
                    lucky.append(matrix[i][j])
        
        return lucky
