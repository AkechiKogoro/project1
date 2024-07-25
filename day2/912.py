import random
class Solution:
    def sortArray(self, nums: List[int]) -> List[int]:
        
        def recursion(left: int, right: int) -> None:
            nonlocal nums
            if left >= right or left < 0 or right >= len(nums):
                return
            
            k = random.randint(left, right)
            temp = nums[left]
            nums[left] = nums[k]
            nums[k] = temp

            p = nums[left]
            
            i, j = left, right
            while i < j:
                while j > i and nums[j] >= p:
                    j -= 1 

                if j > i:
                    nums[i] = nums[j]
                    i += 1
                

                while i < j and nums[i] <= p:
                    i += 1
                
                if j > i:
                    nums[j] = nums[i]
                    j -= 1
            
            nums[i] = p
            
            while i >= 0 and nums[i] == p:
                i -= 1
            while j < len(nums) and nums[j] == p:
                j += 1
                
            recursion(left, i)
            recursion(j, right)
            pass 
        
        recursion(0, len(nums)-1)
        return nums