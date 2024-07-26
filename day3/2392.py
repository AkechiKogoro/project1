class Solution:
    def buildMatrix(self, k: int, rowConditions: List[List[int]], colConditions: List[List[int]]) -> List[List[int]]:
        m, n = len(rowConditions), len(colConditions)
        
        def top_sort(conditions: List[List[int]]) -> List[int]:
            m = len(conditions)
            nonlocal k 
            pre = [0 for _ in range(k)]
            follow = [[] for _ in range(k)]
            for l in range(m):
                i, j = conditions[l]
                i -= 1; j -= 1;
                pre[j] += 1
                follow[i].append(j)
        
            List = []
            for l in range(k):
                if pre[l] == 0:
                    List.append(l)

            l = 0
            while l < len(List):
                p = List[l]
                for i in follow[p]:
                    pre[i] -= 1
                    if pre[i] == 0:
                        List.append(i)

                l += 1
            
            if len(List) == k:
                # print(List)
                return List
            else:
                return []


        row_list = top_sort(rowConditions)
        if len(row_list) < k:
            return []
        
        col_list = top_sort(colConditions)
        if len(col_list) < k:
            return []
        
        coord = [[0, 0] for _ in range(k)]
        for i in range(k):
            coord[row_list[i]][0] = i  
            coord[col_list[i]][1] = i  
        
        matrix = [[0 for _ in range(k)] for _ in range(k)]

        for i in range(k):
            matrix[coord[i][0]][coord[i][1]] = i + 1

        return matrix