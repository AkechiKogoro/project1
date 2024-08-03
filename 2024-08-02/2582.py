class Solution:
    def passThePillow(self, n: int, time: int) -> int:
        flag = 1
        r = time % (2 * (n-1))
        if r <= n-1:
            return 1 + r  
        else:
            return n - (r - (n-1))