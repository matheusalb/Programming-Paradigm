class Person:
    def __init__(self, bets):
        for i in range(len(bets)):
            bets[i] = int(bets[i])
        self.bets = bets
        self.hits = 0

    def updateHits(self, winning_numbs):
        for bet in self.bets: 
            if bet in winning_numbs:
                self.hits += 1
    def getHits(self):
        return self.hits
    def getName(self):
        return self.name

if __name__ == "__main__":

    persons = {}
    while True:
        line = input()
        if line == "FIM":
            break
        line = line.split()
        persons[line[0]] = Person(line[1:])
    
    nums = input().split('-')
    winning_numbs = {}
    for i in range(len(nums)):
        winning_numbs[int(nums[i])] = True

    for k, p in persons.items():
        p.updateHits(winning_numbs)
    
    persons = sorted(persons.items(), key = lambda item : (item[1].getHits(), item[0]))
    for p in persons:
        st = p[0] + " "
        for h in range(p[1].getHits()):
            st += "+"
        print(st)