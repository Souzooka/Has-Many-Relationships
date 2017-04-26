--Create user
DROP USER IF EXISTS has_many_user;
CREATE USER has_many_user;

--Create db
DROP DATABASE IF EXISTS has_many_blogs;
CREATE DATABASE has_many_blogs;

--change owner
ALTER DATABASE has_many_blogs OWNER TO has_many_user;