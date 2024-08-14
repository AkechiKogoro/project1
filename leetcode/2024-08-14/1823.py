class Solution:
    def findTheWinner(self, n: int, k: int) -> int:
        flag = [True for _ in range(n)]
        post = []

        total = n
        i = 0    
        while total > 1:
            c = 0
            while c < k:
                if flag[i]:
                    c += 1
                if c == k:
                    flag[i] = False  
                    total -= 1
                i = (i + 1) % n
            
        
        for i in range(n):
            if flag[i]:
                return i + 1