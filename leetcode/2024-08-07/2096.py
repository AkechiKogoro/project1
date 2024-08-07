from collections import deque
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def getDirections(self, root: Optional[TreeNode], startValue: int, destValue: int) -> str:
        toSource = False
        toTarget = False
        sourceString = ""
        targetString = ""

        L = deque([root])
        i = 0
        parent_map = dict()
        parent_map[root] = None
        while len(L) > 0:
            node = L.popleft()
            if node is None:
                continue

            if node.val == startValue:
                toSource = True  
                sourceNode = node

            if node.val == destValue:
                toTarget = True  
                targetNode = node
            
            if toSource and toTarget:
                break
            
            if node.left is not None:
                parent_map[node.left] = node
                L.append(node.left)
            
            if node.right is not None:
                parent_map[node.right] = node
                L.append(node.right)
        

        tempNode = sourceNode
        while tempNode is not None:
            parentNode = parent_map[tempNode]
            if parentNode is not None:
                if parentNode.left == tempNode:
                    sourceString += 'L'
                else:
                    sourceString += 'R'
            tempNode = parentNode
        
        tempNode = targetNode
        while tempNode is not None:
            parentNode = parent_map[tempNode]
            if parentNode is not None:
                if parentNode.left == tempNode:
                    targetString += 'L'
                else:
                    targetString += 'R'
            tempNode = parentNode
        
        print(sourceString, targetString)
        sourceString = sourceString[::-1]
        targetString = targetString[::-1]
        k = 0
        while k < len(sourceString) and k < len(targetString) and sourceString[k] == targetString[k]:
            k += 1
        
        # print(L)
        # new_L = [(x.val, y) for (x, y) in L if x is not None]
        # print(new_L)
        # print(sourceString, targetString)
        final_string = "U" * (len(sourceString) - k) + targetString[k:]
        return final_string 