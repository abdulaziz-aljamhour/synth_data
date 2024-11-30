import sqlite3 as lite
# Connect to the SQLite database (creates the database file if it doesn't exist)
conn = lite.connect("./data/database/ecommerce.db")

# Enable foreign key constraints
conn.execute("PRAGMA foreign_keys = ON;")
c = conn.cursor()

# Create tables
with open('./src/queries/fill_lookups.sql') as f:
    q = f.read()

c.executescript(q)
conn.commit()
conn.close()