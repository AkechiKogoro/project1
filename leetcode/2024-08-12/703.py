from heapq import heapify, heappush, heappop 
class KthLargest:

    def __init__(self, k: int, nums: List[int]):
        self.k = k 
        if k < len(nums):
            self.nums = sorted(nums)[-k:]
        else:
            self.nums = nums.copy()
        heapify(self.nums)

    def add(self, val: int) -> int:
        if self.k > len(self.nums):
            heappush(self.nums, val)
        elif val > self.nums[0]:
            heappush(self.nums, val)
            heappop(self.nums) 
        # print(self.nums)
        return self.nums[0]


# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest(k, nums)
# param_1 = obj.add(val)