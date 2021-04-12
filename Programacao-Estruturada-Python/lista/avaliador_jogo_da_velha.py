
def isValid(xWon, oWon, quant):
    if xWon and oWon:
        return False
    
    if xWon:
        return quant['O'] == quant['X'] - 1
    elif oWon:
        return quant['O'] == quant['X']
    else:
        return quant['O'] == quant['X'] or quant['O'] == quant['X'] - 1

if __name__ == "__main__":

    t = int(input())
    for c in range(t):
        game = []
        game.append(input().split())
        game.append(input().split())
        game.append(input().split())
        quant = {'X': 0, 'O': 0, '_': 0}
        xWon = False
        oWon = False
        for i in range(3):
            for j in range (3):
                quant[game[i][j]] += 1

        for i in range(3):
            if game[i][0] == 'X' and game[i][1] == 'X' and game[i][2] == 'X':
                xWon = True 
            if game[i][0] == 'O' and game[i][1] == 'O' and game[i][2] == 'O':
                oWon = True
            if game[0][i] == 'X' and game[1][i] == 'X' and game[2][i] == 'X':
                xWon = True 
            if game[0][i] == 'O' and game[1][i] == 'O' and game[2][i] == 'O':
                oWon = True 

        if game[0][0] == 'X' and game[1][1] == 'X' and game[2][2] == 'X':
            xWon = True
        if game[0][0] == 'O' and game[1][1] == 'O' and game[2][2] == 'O':
            oWon = True
        
        if game[2][0] == 'X' and game[1][1] == 'X' and game[0][2] == 'X':
            xWon = True
        if game[2][0] == 'O' and game[1][1] == 'O' and game[0][2] == 'O':
            oWon = True

        if isValid(xWon, oWon, quant):
            if xWon:
                print("X_VENCEU")
            elif oWon:
                print("O_VENCEU")
            else:
                print("EM_ANDAMENTO")
        else:
            print("ILEGAL")
            
