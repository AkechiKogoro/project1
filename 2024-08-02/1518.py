class Solution:
    def numWaterBottles(self, numBottles: int, numExchange: int) -> int:
        empty = 0
        full = numBottles
        total = 0
        while full > 0 or empty >= numExchange:
            total += full 
            empty += full 
            full = empty // numExchange 
            empty -= full * numExchange
        
        return total