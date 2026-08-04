import sqlite3
import pandas as pd
from pathlib import Path

# Cleaned CSV turns into a small SQL database

project_root = Path(__file__).resolve().parent.parent
csv_path = project_root / "data" / "bangla_music_enriched.csv"
database_path = project_root / "sql" / "sur.db"

df = pd.read_csv(csv_path)

# This loads the CSV into a pandas table called df.
connection = sqlite3.connect(database_path)

# This copies all 1,742 rows into a SQL table named songs.
df.to_sql(
    "songs",
    connection,
    if_exists="replace",
    index=False
)

connection.close()

print("Database created successfully!")
print(f"Rows loaded: {len(df)}")