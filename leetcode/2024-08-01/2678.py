class Solution:
    def countSeniors(self, details: List[str]) -> int:
        ages = [int(x[11:13]) for x in details]
        over60 = [age for age in ages if age > 60]
        return len(over60)