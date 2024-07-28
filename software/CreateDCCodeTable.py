import pandas as pd

def CreateDCCodeTable():
    f = open('DCCodeTable.txt', 'r')
    df = pd.DataFrame(columns = ['Size', 'Bits', 'Code'])
    for n, l in enumerate(f):
        size, bits, code = l.split(' ')
        code = code.split('\n')
        df.loc[n] = [size, bits, code[0]]

    df.to_excel('./DCCodeTable.xlsx', 'w')
    return df