from collections import Counter
class Solution:
    def frequencySort(self, nums: List[int]) -> List[int]:
        freq = Counter(nums)  

        L = list(freq.items())

        L.sort(key = lambda x: (x[1], -x[0]))

        S = []
        for i in range(len(L)):
            S += [L[i][0]] * L[i][1]
        
        return S