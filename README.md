# Reddit Analytics Database in PostgreSQL

This project builds a relational PostgreSQL database for a large Reddit dataset and runs analytical SQL queries on top of it. It covers schema design, referential integrity, bulk data loading, and query development for user and subreddit level analytics.

## Overview

The dataset contains four core entities: authors, subreddits, submissions, and comments.  
This repository defines the database schema, loads the data, and computes summary tables such as:

- Comment activity per user
- Subreddit counts by type
- Top subreddits by comment volume
- High-karma users and their profile
- Comment distribution across subreddit types

The goal is to demonstrate practical data engineering and SQL skills on a moderately large text and interaction dataset.

## Features

- Normalized relational schema for Reddit data (authors, subreddits, submissions, comments)  
- Primary keys, unique constraints, and foreign keys to enforce consistency
- Separation of table creation, relationship definitions, and analytical queries into dedicated SQL files  
- Reproducible execution via a single shell script (`assignment1.sh`)  
- Output materialized as result tables (`query1`–`query5`) for easy inspection

## Tech Stack

- PostgreSQL 14
- SQL (DDL and DML)
- Bash (`assignment1.sh`)
- Optional: `pg_bulkload` or similar tools for optimized loading

## Data Model

The schema is defined in `create_tables.sql`. 

**Tables:**

- `authors`  
  Stores user-level information such as `name`, `link_karma`, `comment_karma`, profile attributes, and timestamps.

- `subreddits`  
  Stores subreddit metadata including `id`, human-readable `display_name`, `subreddit_type`, subscriber counts, and description fields.

- `submissions`  
  Represents posts made to subreddits, including author, subreddit identifier, title, URL, and engagement statistics such as `ups` and `num_comments`.

- `comments`  
  Contains comment-level data, including author, subreddit, parent relationships, body text, scores, and other attributes.

**Constraints and relationships** are defined in `create_relations.sql`

- `submissions.author` → `authors.name`  
- `submissions.subreddit_id` → `subreddits.name`  
- `comments.author` → `authors.name`  
- `comments.subreddit_id` → `subreddits.name`  
- `comments.subreddit` → `subreddits.display_name`

This design ensures that every comment and submission links back to a valid author and subreddit.

## Repository Structure

```text
├── create_tables.sql       # Table definitions (DDL)
├── create_relations.sql    # Foreign keys and constraints
├── queries.sql             # Analytical queries -> query1..query5
└── README.md               # Project documentation
