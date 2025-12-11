-- Query 1: Count comments by user 'xymemez'
CREATE TABLE query1 AS
SELECT COUNT(*) AS "count of comments"
FROM comments
WHERE author = 'xymemez';

-- Query 2: Count subreddits per subreddit type
CREATE TABLE query2 AS
SELECT subreddit_type AS "subreddit type", COUNT(*) AS "subreddit count"
FROM subreddits
GROUP BY subreddit_type;

-- Query 3: Top 10 subreddits by comments count with average score.
CREATE TABLE query3 AS
SELECT
    c.subreddit AS "name",
    COUNT(c.id) AS "comments count",
    ROUND(AVG(c.score), 2) AS "average score"
FROM comments c
GROUP BY c.subreddit
ORDER BY COUNT(c.id) DESC
LIMIT 10;

-- Query 4: Users with >1,000,000 average karma
CREATE TABLE query4 AS
SELECT
    name AS "name",
    link_karma AS "link karma",
    comment_karma AS "comment karma",
    CASE 
        WHEN link_karma >= comment_karma THEN 1 
        ELSE 0 
    END AS "label"
FROM authors
WHERE (link_karma + comment_karma) > 2000000
ORDER BY (link_karma + comment_karma) DESC;


-- Query 5: Count comments per subreddit type for user '[deleted_user]'
CREATE TABLE query5 AS
SELECT
    s.subreddit_type AS "sr type",
    COUNT(c.id) AS "comments num"
FROM comments c
JOIN subreddits s ON c.subreddit_id = s.id
WHERE c.author = '[deleted_user]'
GROUP BY s.subreddit_type;