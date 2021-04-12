class phrase:
    def __init__(self, text):
        self.text = text
        self.freq = {}
        self.freq_par = {}
        self.freqBigstPair = 0
        self.bigstPair = None

        self.__updateFreq()
        self.__updateFreqPair()
        self.__calculateBiggestPar()
    def __updateFreq(self):
        for c in self.text:
            if c.lower() in self.freq:
                self.freq[c.lower()] += 1
            else:
                self.freq[c.lower()] = 1

    def __updateFreqPair(self):
        prev_elem = None
        for c in self.text:
            if prev_elem and prev_elem >= 'a' and prev_elem <= 'z' and c.lower() >= 'a' and c.lower() <= 'z':
                cur_seq = (prev_elem + c).lower()
                if cur_seq in self.freq_par:
                    self.freq_par[cur_seq] += 1
                else: 
                    self.freq_par[cur_seq] = 1
            prev_elem = c.lower()
    
    def __calculateBiggestPar(self):
        for key, value in self.freq_par.items():
            if value > self.freqBigstPair:
                self.freqBigstPair = value
                self.bigstPair = key

    def getNumWhiteSpaces(self):
        if ' ' in self.freq:
            return self.freq[' ']
        else:
            return 0

    def getNumA(self):
        if 'a' in self.freq:
            return self.freq['a']
        else:
            return 0

    def getBiggestPair(self):
        return self.freqBigstPair, self.bigstPair


if __name__ == '__main__':

    text = input()
    while text != "NAO QUERO MAIS":
        line = phrase(text)
        print(line.getNumWhiteSpaces())
        print(line.getNumA())
        freqbseq, bseq = line.getBiggestPair()
        if freqbseq > 0:
            print(freqbseq)
            print(bseq)
        else:
            print ("NENHUM PAR")

        text = input()