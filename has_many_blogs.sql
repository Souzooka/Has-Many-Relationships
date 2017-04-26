--Create db
DROP DATABASE IF EXISTS has_many_blogs;
CREATE DATABASE has_many_blogs;

--Create user
DROP USER IF EXISTS has_many_user;
CREATE USER has_many_user;

--change owner
ALTER DATABASE has_many_blogs OWNER TO has_many_user;

\c has_many_blogs

--create tables
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(90) NOT NULL,
  first_name VARCHAR(90) DEFAULT NULL,
  last_name VARCHAR(90) DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title VARCHAR(180) DEFAULT NULL,
  url VARCHAR(510) DEFAULT NULL,
  contect TEXT DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
  users_id INT REFERENCES users
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  body VARCHAR(510) DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
  users_id INT REFERENCES users,
  posts_id INT REFERENCES posts
);

\i scripts/blog_data.sql

