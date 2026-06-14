import csv
import random
import os
import sys

NUM_ROWS = 50

COLUMNS = ["student_name", "score", "attendance", "grade"]

def generate_row():
    names = ["Alice", "Bob", "Charlie", "Diana"]
    grades = ["A", "B", "C", "D", "F"]
    return {
        "student_name": random.choice(names),
        "score": random.randint(0, 100),
        "attendance": random.randint(0, 30),
        "grade": random.choice(grades),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)