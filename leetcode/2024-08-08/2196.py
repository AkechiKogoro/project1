# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def createBinaryTree(self, descriptions: List[List[int]]) -> Optional[TreeNode]:
        nodes = dict()
        roots = set()  
        not_roots = set()
        m = len(descriptions)
        
        for i in range(m):
            if descriptions[i][0] not in nodes.keys():
                nodes[descriptions[i][0]] = TreeNode(descriptions[i][0])
            if descriptions[i][1] not in nodes.keys():
                nodes[descriptions[i][1]] = TreeNode(descriptions[i][1])

            if descriptions[i][2] == 1:
                nodes[descriptions[i][0]].left = nodes[descriptions[i][1]]
            else:
                nodes[descriptions[i][0]].right = nodes[descriptions[i][1]]

            not_roots.add(descriptions[i][1])
                
        roots = set(nodes.keys()).difference(not_roots)
        root_list = [nodes[x] for x in roots]
        root = root_list[0]
        print(len(root_list))
        temp = root
        for i in range(1, len(root_list)):
            while temp.left is not None:
                temp = temp.left 
            
            temp.left = root_list[i]
        
        return root_list[0]