from collections import Counter
key_num = 8
class Solution:
    def minimumPushes(self, word: str) -> int:
        D = Counter(word)
        count = dict()
        p = 0
        remain = key_num
        L = list(D.items())
        L = [(y, x) for (x, y) in L]
        L.sort(reverse=True)
        print(L)
        for i in range(len(L)):
        
            remain -= 1
            count[L[i][1]] = p + 1
            
            if remain == 0:
                remain = key_num
                p += 1
            
        total = 0
        for c in count.keys():
            total += count[c] * D[c]
        
        return total
