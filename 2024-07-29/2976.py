from heapq import heapify, heappush, heappop
class Solution:
    def minimumCost(self, source: str, target: str, original: List[str], changed: List[str], cost: List[int]) -> int:
        dis = dict()
        adj = dict()

        m, n = len(source), len(original)
        print(m, n)
        for i in range(n):
            if original[i] not in adj.keys():
                adj[original[i]] = [] 
            
            adj[original[i]].append((cost[i], changed[i]))

        C = 0
        for i in range(m):
            # print(i)
            if source[i] == target[i]:
                continue
            elif (source[i], target[i]) in dis.keys():
                C += dis[(source[i], target[i])]
            else: 
                s = source[i]
                Q = [(0, source[i])]
                temp_d = dict()
                temp_d[s] = 0
                heapify(Q) 
                while len(Q) > 0:
                    d, c = heappop(Q) 
                    if c in adj:
                        for j in range(len(adj[c])):
                            k, f = adj[c][j]
                      
                            if f not in temp_d.keys() or k + d < temp_d[f]:
                                # print(k, d)
                                temp_d[f] = k + d 
                                heappush(Q, (k+d, f))

                for f in temp_d:
                    dis[(s, f)] = temp_d[f]

                if (source[i], target[i]) not in dis.keys():
                    return -1
                else:
                    C += dis[(source[i], target[i])]
        # print(dis)
        # print(adj['a'])
        return C