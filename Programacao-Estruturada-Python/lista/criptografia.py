
if __name__ == "__main__":
    t = int(input())

    for case in range(t):
        
        text = input()

        # first
        text = list(text)
        for i in range(len(text)):
            if (text[i] >= "A" and text[i] <="Z") or (text[i] >= "a" and text[i] <= "z"):
                text[i] = chr(ord(text[i]) + 3)
        
        # second
        text = text[::-1]

        # third
        init = int(len(text)/2) 

        for i in range(init, len(text)):
            text[i] = chr(ord(text[i]) - 1)

        ans = ""
        print(ans.join(text))