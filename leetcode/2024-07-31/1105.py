from heapq import heapify, heappush, heappop
class Solution:
    def minHeightShelves(self, books: List[List[int]], shelfWidth: int) -> int:
        m = len(books)
        
        L = [1e+10 for _ in range(m+1)]
        partial_width = [0 for _ in range(m+1)]
        L[0] = 0
        for i in range(1, m+1):
            partial_width[i] = partial_width[i-1] + books[i-1][0]
        
        for i in range(1, m+1):
            max_height = L[i-1]
            for j in range(i, m+1):
                if partial_width[j] - partial_width[i-1] > shelfWidth:
                    break 
                else:
                    max_height = max(max_height, L[i-1] + books[j-1][1])
                    L[j] = min(L[j], max_height)
                    
        return L[-1]