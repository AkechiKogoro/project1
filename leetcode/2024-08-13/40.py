from collections import Counter
from copy import deepcopy
class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        C = Counter(candidates)
        nums = list(C.keys())
        nums.sort()
        m = len(candidates)
        n = len(nums)
        print(nums, n, m, C)
        
        counts = []
        def rec(count: List[int], idx: int, target: int, remain: int) -> bool:
            nonlocal C, nums, counts, m, n
            print(count, idx, target, remain)
            k = idx
            if target == 0:
                counts.append(deepcopy(count))
                return False
            if idx == n:
                return False
            if nums[k] > target:
                return False

            for i in range(C[nums[k]] + 1):
                new_target = target - i * nums[k]
                if new_target == 0 or new_target > nums[k]:
                    count[k] = i   
                    rec(count, idx+1, new_target, remain - C[nums[k]])  
                    count[k] = 0
                if new_target < 0:
                    return False

        
        count = [0 for _ in range(n)]

        rec(count, 0, target, m)

        ans = []
        for x in counts:
            l = []
            for i in range(n):
                l = l + [nums[i]] * x[i] 
            ans.append(l)
        return ans