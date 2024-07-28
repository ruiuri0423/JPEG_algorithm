import pandas as pd

def CreateACCodeTable():
    f = open('ACCodeTable.txt', 'r')
    df = pd.DataFrame(columns = ['Length', 'Size', 'Bits', 'Code'])
    for n, l in enumerate(f):
        ls, bits, code = l.split(' ')
        length, size = ls.split('/')
        code = code.split('\n')
        df.loc[n] = [length, size, bits, code[0]]

    df.to_excel('./ACCodeTable.xlsx', 'w')
    return df