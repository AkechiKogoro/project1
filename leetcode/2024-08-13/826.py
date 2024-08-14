class Solution:
    def maxProfitAssignment(self, difficulty: List[int], profit: List[int], worker: List[int]) -> int:
        c = [(profit[i], difficulty[i]) for i in range(len(difficulty))]
        c.sort(reverse=True)

        worker.sort()

        i = 0 
        j = len(worker) - 1

        profit = 0
        # print(c)
        # print(worker)
        while i < len(difficulty) and j >= 0: 
            while j >= 0 and worker[j] >= c[i][1]:
                profit += c[i][0]
                j -= 1
            
            i += 1
        
        return profit