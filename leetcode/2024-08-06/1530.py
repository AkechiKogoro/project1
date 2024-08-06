# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def countPairs(self, root: TreeNode, distance: int) -> int:
        
        total = 0
        def recursion(node: TreeNode) -> List[int]:
            nonlocal total, distance 
            if node is None:
                return [0 for _ in range(distance+1)]
            elif node.left is None and node.right is None:
                t = [0 for _ in range(distance+1)]
                t[0] = 1
                return t 
            
            left = recursion(node.left)
            right = recursion(node.right)
            # print(left, right)
            for i in range(distance):
                for j in range(distance):
                    if i + j <= distance-2:
                        total += left[i] * right[j]
                
            cur = [0 for _ in range(distance+1)]
            for k in range(1, distance+1):
                cur[k] = left[k-1] + right[k-1]

            return cur
        
        recursion(root)
        return total