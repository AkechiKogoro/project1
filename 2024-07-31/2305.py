from collections import deque
class Solution:

    
    def secondMinimum(self, n: int, edges: List[List[int]], time: int, change: int) -> int:
        
        # given time and change, and number of edges to cover
        # calculate the amount of time it takes
        def time_compute(t: int, c: int, m: int) -> int:
            k = t // (2 * c)
            s = t % (2 * c)

            if s == 0:
                return m * t
            elif s < c:
                j = (c // s) + int((c % s) > 0)
                p = m // j
                r = m % j
                wait = c - ((j * s) % c) 
                v = p * (j * s) + (p - 1) * wait + r * s + int(r > 0) * wait + m * 2 * k * c
               
                return v
            else:
                v = 2 * k * c * m + m * s + (m - 1) * (2 * c - s)
                
                return v

        # BFS  
        m = len(edges)
        adj = [[] for _ in range(n)]
        rec = [1e+10 for _ in range(n)]
        flag1 = [True for _ in range(n)]
        flag2 = [True for _ in range(n)]
        rec[0] = 0
        
        for i in range(m):
            adj[edges[i][0]-1].append(edges[i][1]-1)
            adj[edges[i][1]-1].append(edges[i][0]-1)
        
        dis = [] 
        L = deque([(0, 0)])

        while len(L) > 0 and len(dis) < 2:
            d, k = L.popleft() 
            if d > rec[k] + 2:
                continue

            if d == rec[k] + 1:
                if flag1[k] == False:
                    continue 
                else:
                    flag1[k] = False
            
            if d == rec[k] + 2:
                if flag1[k] == False or flag2[k] == False:
                    continue 
                else:
                    flag2[k] = False
            # print(d, k)
            if d < rec[k]:
                rec[k] = d   

            if k == n-1 and (len(dis) == 0 or dis[-1] < d):
                dis.append(d) 

            if len(dis) == 2:
                break  
            
            for i in adj[k]:
                L.append([d+1, i])
        
        # print(dis[-1])
        # print(dis)
        # print(rec)
        return time_compute(time, change, dis[-1])

        
        