class Solution:
    def sortJumbled(self, mapping: List[int], nums: List[int]) -> List[int]:
        def mapsto(n: int) -> int:
            nonlocal D
            s = str(n)  
            l1 = list(s)
          
            l2 = [D[x] for x in l1]
            t = "".join(l2)
            return int(t)
        
        D = dict()
        for i in range(10):
            D[str(i)] = str(mapping[i])
        
        new_nums = [(mapsto(nums[i]), i, nums[i]) for i in range(len(nums))]

        new_nums.sort()

        return [new_nums[i][2] for i in range(len(nums))]