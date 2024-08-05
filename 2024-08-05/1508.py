mod_int = int(1e9 + 7)
class Solution:
    def rangeSum(self, nums: List[int], n: int, left: int, right: int) -> int:
        L = []
        S = 0
        for i in range(n):
            S = 0
            for j in range(i, n):
                S += nums[j] 
                L.append(S)
            
            # print(L)

        L.sort()  
        # print(L)
        L = [x % mod_int for x in L]

        Q = 0
        for i in range(left-1, right):
            Q += L[i]
            Q %= mod_int 
        
        return Q