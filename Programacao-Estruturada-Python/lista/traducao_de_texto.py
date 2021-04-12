
if __name__ == '__main__':
    
    n = int(input())
    dic = {}
    for i in range(n):
        trad = input().split()
        dic[trad[0]] = trad[2]
    else:
        text = input()
        while text != "*":
            text = text.split()
            translated = ""

            for i in range(len(text)):
                translated += dic[text[i]]
                if i != len(text) - 1:
                    translated += " "
            
            print(translated)
            text = input()


# 5
# the => a
# beach => praia
# was => estava
# great => otima
# sunny => ensolarada
# the beach was great
# the beach was sunny
# *
