import pandas as pd
import csv as csv
print('Iniciando lectura')
df = pd.read_csv(r'/home/dcuasapaz/data/RAS_2015.csv',sep=';')
df = csv.reader(r'/home/dcuasapaz/data/RAS_2015.csv',sep=';')

import csv

with open('/home/dcuasapaz/data/RAS_2015.csv') as file:
    csv_reader = csv.reader(file, delimiter=',')
    for row in csv_reader:
        print(row)




import psycopg2

conn.autocommit = True
cursor = conn.cursor()
conn = psycopg2.connect(database="inec",user='inec', password='INECDBApp!5y5', host='localhost', port='5432')
cur = conn.cursor()
with open('/home/dcuasapaz/data/RAS_2017.csv', 'r') as f:
    next(f) # Skip the header row.
    cursor.copy_from(f, 'inec_tbl_ras_2017', sep=',')

df = pd.read_csv(r'/home/dcuasapaz/data/RAS_2017.csv',sep=';',header=None,names=['prov_ubi'])

import psycopg2
import pandas as pd
conn = psycopg2.connect(database="inec",user='inec', password='INECDBApp!5y5', host='localhost', port='5432')
conn.autocommit = True
cursor = conn.cursor()
vSQL = '''SELECT * FROM inec_tbl_eeh_2015;'''
df0= pd.read_sql(vSQL, conn);
df1=df0[(df0['prov_ubi']=='Manabí') & (df0['cod_pais']=='EC')]

