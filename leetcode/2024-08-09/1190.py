class Solution:
    def reverseParentheses(self, s: str) -> str:
        L = []
        lparen = []

        m = len(s) 
        for i in range(m):
            print(L)
            if s[i] == '(':
                lparen.append(len(L))  

            if s[i] != ')':
                L.append(s[i])
            else:
                # print("with ) : ")
                p = "".join(L[lparen[-1]+1:])
                # print(p)
                p = p[::-1]
                L = L[:lparen[-1]]
                L.append(p)
                lparen.pop()

        # print(L)
        return "".join(L)