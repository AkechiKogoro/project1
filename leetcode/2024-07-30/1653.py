class Solution:
    def minimumDeletions(self, s: str) -> int:
        m = len(s)  
        whb = [m for _ in range(m)]

        
        bct = int(s[0] == 'b')
        whb[0] = 0

        
        for i in range(1, m):
            if s[i] == 'a':
                whb[i] = min(whb[i-1] + 1, bct)
            else: 
                bct += 1
                whb[i] = whb[i-1]
        
        return min(bct, whb[-1])