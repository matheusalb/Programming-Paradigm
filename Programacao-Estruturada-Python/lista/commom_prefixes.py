class Word:
    def __init__(self, word):
        self.word = word
        self.pref = ""
        self.last_indx = -1
        self.max_length = len(word)
    
    def updatePref(self):
        self.last_indx += 1
        self.pref += self.word[self.last_indx]
        return self.getPref()
    
    def getPref(self):
        return self.pref

    def getWord(self):
        return self.word

    def isPossibleUpdate(self):
        return self.last_indx != self.max_length - 1

if __name__ == '__main__':
    n_k = input().split()
    n = int(n_k[0])
    k = int(n_k[1])

    words = []

    for i in range(n):
        words.append(Word(input()))
    
    limit_pref = 0
    qnt = 0
    valid_prefs = []
    while True:
        prefs = {}
        cur_qnt = 0
        for i in range(n):
            if words[i].isPossibleUpdate():
                if words[i].updatePref() in prefs:
                    if prefs[words[i].getPref()] != -1:
                        prefs[words[i].getPref()] += 1
                else:
                    prefs[words[i].getPref()] = 1
                
                if prefs[words[i].getPref()] >= k:
                    valid_prefs.append(words[i].getPref())
                    qnt += 1
                    cur_qnt +=1
                    prefs[words[i].getPref()] = -1
        if cur_qnt == 0:
            break
    
    valid_prefs.sort()
    print(qnt)
    for st in valid_prefs:
        print(st)