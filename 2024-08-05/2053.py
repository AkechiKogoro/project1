from collections import Counter
class Solution:
    def kthDistinct(self, arr: List[str], k: int) -> str:
        C = Counter(arr)
        n = 0
        for i in range(len(arr)):
            if C[arr[i]] == 1:
                n += 1
                if n == k:
                    return arr[i]
        
        return ""