# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def delNodes(self, root: Optional[TreeNode], to_delete: List[int]) -> List[TreeNode]:
        total = []
        delete_set = set(to_delete)
        def recursion(node: Optional[TreeNode]):
            nonlocal total, delete_set
            if node is None:
                return 
            recursion(node.left)
            recursion(node.right)

            if node.left is not None and node.left.val in delete_set:
                node.left = None  
            
            if node.right is not None and node.right.val in delete_set:
                node.right = None

            if node.val in delete_set:
                if node.left is not None:
                    total.append(node.left)
                if node.right is not None:
                    total.append(node.right)
            
            
        

        recursion(root)
        if root.val not in delete_set:
            total.append(root)

        return total