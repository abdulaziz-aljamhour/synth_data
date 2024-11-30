# Import sqlite3 to create database
import sqlite3 as lite

# Connect to the SQLite database (creates the database file if it doesn't exist)
conn = lite.connect("./data/database/ecommerce.db")

# Enable foreign key constraints
conn.execute("PRAGMA foreign_keys = ON;")
c = conn.cursor()

# Create tables
with open('./src/queries/create_schema.sql') as f:
    q = f.read()
    # print(q)

# Execute many statements in one script
c.executescript(q)

# Commit changes and close connection.
conn.commit()
conn.close()