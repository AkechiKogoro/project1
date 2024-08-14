class Solution:
    def averageWaitingTime(self, customers: List[List[int]]) -> float:
        leave = []
        n = len(customers)
        t = 0
        for i in range(n):
            if customers[i][0] > t:
                t = customers[i][0]
            
            t += customers[i][1]
            leave.append(t)  
        
        wait = 0
        for i in range(n):
            wait += leave[i] - customers[i][0]
        
        return float(wait) / n
            