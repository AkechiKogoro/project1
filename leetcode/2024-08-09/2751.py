class Solution:
    def survivedRobotsHealths(self, positions: List[int], healths: List[int], directions: str) -> List[int]:
        m = len(directions)
        line = [[healths[i], i] for i in range(m)]
        line.sort(key = lambda x: positions[x[1]])
        # print(line)
        L = []

        for i in range(m):
            L.append(line[i])
            while len(L) >= 2 and directions[L[-1][1]] == 'L' and directions[L[-2][1]] == 'R':
                if L[-1][0] == L[-2][0]:
                    L.pop()
                    L.pop()
                elif L[-1][0] > L[-2][0]:
                    L[-2][0] = L[-1][0] - 1
                    L[-2][1] = L[-1][1]
                    L.pop()
                else:
                    L.pop()
                    L[-1][0] -= 1
        
        L.sort(key=lambda x: x[1])
        ans = [L[i][0] for i in range(len(L))]
        return ans