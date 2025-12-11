psql -h localhost -U postgres -d postgres -f create_tables.sql
psql -h localhost -U postgres -d postgres -c "\copy authors FROM 'C:/ASU/1st Semester/database assignment/Dataset/authors.csv' WITH CSV HEADER;"
psql -h localhost -U postgres -d postgres -c "\copy subreddits FROM 'C:/ASU/1st Semester/database assignment/Dataset/subreddits.csv' WITH CSV HEADER;"
psql -h localhost -U postgres -d postgres -c "\copy submissions FROM 'C:/ASU/1st Semester/database assignment/Dataset/submissions.csv' WITH CSV HEADER;"
psql -h localhost -U postgres -d postgres -c "\copy comments FROM 'C:/ASU/1st Semester/database assignment/Dataset/comments.csv' WITH CSV HEADER;"
psql -h localhost -U postgres -d postgres -f create_relations.sql
psql -h localhost -U postgres -d postgres -f queries.sql