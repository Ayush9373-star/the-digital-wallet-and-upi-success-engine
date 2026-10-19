import pandas as pd
from sqlalchemy import create_engine

# Link to my local MySQL database and setup the connection.
engine = create_engine("mysql+mysqlconnector://root:ayush@localhost/upi_payment_db")

# Read the entire file into my computer memory.
data = pd.read_csv("upi_transactions_2024.csv")

# Fill any empty cells with zero numbers.
data.fillna(0, inplace=True)

# Upload the whole file to my database table in one single shot.
data.to_sql(name="historical_payment_records", con=engine, if_exists="append", index=False)

print("All payment data is loaded into the table successfully.")
