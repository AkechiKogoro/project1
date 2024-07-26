from heapq import heapify, heappush, heappop
MAX_DIST = int(1e+7)
class Solution:
    def findTheCity(self, n: int, edges: List[List[int]], distanceThreshold: int) -> int:
        dist = [[MAX_DIST for _ in range(n)] for _ in range(n)]
        m = len(edges)
        for i in range(n):
            dist[i][i] = 0

        queue = [(edges[i][2], edges[i][0], edges[i][1]) for i in range(m)]
        for i in range(m):
            dist[edges[i][0]][edges[i][1]] = edges[i][2]
            dist[edges[i][1]][edges[i][0]] = edges[i][2]

        heapify(queue)
        
        while len(queue) > 0:
            d, i, j = heappop(queue)
            if d > distanceThreshold:
                continue

            for k in range(n):
                if dist[k][i] + dist[i][j] < dist[k][j]:
                    dist[k][j] = dist[k][i] + dist[i][j]
                    dist[j][k] = dist[k][i] + dist[i][j]
                    heappush(queue, (dist[k][j], k, j))

            for k in range(n):
                if dist[k][j] + dist[i][j] < dist[k][i]:
                    dist[k][i] = dist[k][j] + dist[i][j]
                    dist[i][k] = dist[k][j] + dist[i][j]
                    heappush(queue, (dist[k][i], i, k))
            
        L = [0 for _ in range(n)]
        for i in range(n):
            for j in range(n):
                if dist[i][j] <= distanceThreshold:
                    L[i] += 1
        
        p = min(L) 
        print(p)
        print(dist)
        for k in range(n-1, -1, -1):
            if L[k] == p:
                return k
            
