from bisect import bisect_left
from math import comb
class Solution:
    def numTeams(self, rating: List[int]) -> int:
        n = len(rating)
        bigger = [0 for _ in range(n)]
        smaller = [0 for _ in range(n)]
        for i in range(n):
            for j in range(i):
                if rating[i] > rating[j]:
                    smaller[i] += 1
                elif rating[i] < rating[j]:
                    bigger[i] += 1 
        
        C = 0
        for i in range(n):
            for j in range(i):
                if rating[i] > rating[j]:
                    C += smaller[j]
                elif rating[i] < rating[j]:
                    C += bigger[j]
        
        return C