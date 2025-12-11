-- submissions → authors
ALTER TABLE submissions 
ADD CONSTRAINT fk_submissions_author FOREIGN KEY (author)
REFERENCES authors (name) ON DELETE CASCADE;

-- submissions → subreddits
ALTER TABLE submissions
ADD CONSTRAINT fk_submissions_subreddit FOREIGN KEY (subreddit_id)
REFERENCES subreddits (name) ON DELETE CASCADE;

-- comments → authors
ALTER TABLE comments
ADD CONSTRAINT fk_comments_author FOREIGN KEY (author)
REFERENCES authors (name) ON DELETE CASCADE;

-- comments → subreddits (subreddit_id)
ALTER TABLE comments
ADD CONSTRAINT fk_comments_subreddit FOREIGN KEY (subreddit_id)
REFERENCES subreddits (name) ON DELETE CASCADE;

-- comments → subreddits (display_name)
ALTER TABLE comments
ADD CONSTRAINT fk_comments_subreddit_display FOREIGN KEY (subreddit)
REFERENCES subreddits (display_name) ON DELETE CASCADE;