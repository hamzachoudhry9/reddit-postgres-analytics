#!/bin/bash
set -e

# --- Basic configuration (change if needed) ---
DB_HOST="${DB_HOST:-localhost}"
DB_USER="${DB_USER:-postgres}"
DB_NAME="${DB_NAME:-postgres}"

# Directory where the CSV files are stored.
# By default, assumes they sit next to this script.
DATA_DIR="${DATA_DIR:-.}"

PSQL="psql -h $DB_HOST -U $DB_USER -d $DB_NAME"

echo "==> Creating tables..."
$PSQL -f create_tables.sql

echo "==> Loading authors..."
$PSQL -c "\copy authors FROM '${DATA_DIR}/authors.csv' WITH (FORMAT csv, HEADER true)"

echo "==> Loading subreddits..."
$PSQL -c "\copy subreddits FROM '${DATA_DIR}/subreddits.csv' WITH (FORMAT csv, HEADER true)"

echo "==> Loading submissions..."
$PSQL -c "\copy submissions FROM '${DATA_DIR}/submissions.csv' WITH (FORMAT csv, HEADER true)"

echo "==> Loading comments..."
$PSQL -c "\copy comments FROM '${DATA_DIR}/comments.csv' WITH (FORMAT csv, HEADER true)"

echo "==> Adding foreign key relationships..."
$PSQL -f create_relations.sql

echo "==> Running analytical queries..."
$PSQL -f queries.sql

echo "==> Done. Created tables: query1, query2, query3, query4, query5."
