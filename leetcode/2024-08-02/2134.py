class Solution:
    def minSwaps(self, nums: List[int]) -> int:
        k = len(nums)
        m = sum(nums) # number of 1's
        n = k - m     # number of 0's

        cur1 = sum(nums[:n])
        cur0 = m - sum(nums[:m])
        min0, min1 = cur0, cur1

        for i in range(1, k - m + 1):
            cur0 = cur0 - (1 - nums[i-1]) + (1 - nums[i+m-1])
            if cur0 < min0:
                min0 = cur0
        

        for j in range(1, k - n + 1):
            cur1 = cur1 - nums[j-1] + nums[j+n-1]
            if cur1 < min1:
                min1 = cur1
        

        return min(min0, min1)