import pandas as pd
import mysql.connector

# Configuração da conexão com o MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="myuser",
    password="mypassword",
    database="sales"
)

cursor = conn.cursor()

# Carregar o CSV sem cabeçalho
df = pd.read_csv("data\oltpdata.csv", header=None, names=["product_id", "customer_id", "price", "quantity", "timestamp"])

# Percorrer as linhas do DataFrame e inserir no MySQL
for _, row in df.iterrows():
    sql = """
    INSERT INTO sales_data (product_id, customer_id, price, quantity, timestamp)
    VALUES (%s, %s, %s, %s, %s)
    """
    values = (row["product_id"], row["customer_id"], row["price"], row["quantity"], row["timestamp"])
    
    cursor.execute(sql, values)

# Confirmar as inserções
conn.commit()

# Fechar a conexão
cursor.close()
conn.close()

print("Dados inseridos com sucesso!")
