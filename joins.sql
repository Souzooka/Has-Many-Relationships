\c has_many_blogs

--Query 1
--Create a query to get all fields from the users table
SELECT *
FROM users;

--Query 2
--Create a query to get all fields from the posts table where the user_id is 100
SELECT *
FROM posts
WHERE users_id = 100;

--Query 3
--Create a query to get all posts fields, the user's first name, and the user's last name,
--  from the posts table where the user's id is 200
SELECT posts.*, users.first_name, users.last_name
FROM posts
INNER JOIN users ON posts.users_id = users.id
WHERE users.id = 200;

--Query 4
--Create a query to get all posts fields, and the user's username,
--  from the posts table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'
SELECT posts.*, users.username
FROM posts
INNER JOIN users ON users.id = posts.users_id
WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

--Query 5
--Create a query to get usernames from the users table where the user has created a post after January 1, 2015
SELECT DISTINCT username
FROM users
INNER JOIN posts ON users.id = posts.users_id
WHERE posts.created_at > '20150101';

--Query 6
--Create a query to get the post title, post content,
--  and user's username where the user who created the post joined before January 1, 2015
SELECT posts.title, posts.content, users.username
FROM users
INNER JOIN posts ON users.id = posts.users_id
WHERE users.created_at < '20150101';

--Query 7
--Create a query to get the all rows in the comments table, showing post title (aliased as 'Post Title'),
--  and the all the comment's fields
SELECT posts.title AS "Post Title", comments.*
FROM posts
INNER JOIN comments ON posts.id = comments.posts_id;

--Query 8
--Create a query to get the all rows in the comments table, showing post title (aliased as post_title),
--  post url (ailased as post_url), and the comment body (aliased as comment_body)
--  where the post was created before January 1, 2015
SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM posts
INNER JOIN comments ON posts.id = comments.posts_id
WHERE posts.created_at < '20150101';

--Query 9
--Create a query to get the all rows in the comments table, showing post title (aliased as post_title),
--  post url (ailased as post_url), and the comment body (aliased as comment_body)
--  where the post was created after January 1, 2015
SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM posts
INNER JOIN comments ON posts.id = comments.posts_id
WHERE posts.created_at > '20150101';

--Query 10
--Create a query to get the all rows in the comments table, showing post title (aliased as post_title),
--  post url (ailased as post_url), and the comment body (aliased as comment_body)
--  where the comment body contains the word 'USB'
SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM posts
INNER JOIN comments ON posts.id = comments.posts_id
WHERE comments.body LIKE '%USB%';

--Query 11
--Create a query to get the post title (aliased as post_title), first name of the author of the post,
--  last name of the author of the post, and comment body (aliased to comment_body),
--  where the comment body contains the word 'matrix' ( should have 855 results )
SELECT posts.title AS post_title, users.first_name, comments.body AS comment_body
FROM posts
INNER JOIN users ON posts.users_id = users.id
INNER JOIN comments ON comments.posts_id = posts.id
WHERE comments.body LIKE '%matrix%';

--Query 12
--Create a query to get the first name of the author of the comment, last name of the author of the comment,
--  and comment body (aliased to comment_body),
--  where the comment body contains the word 'SSL' and the post content contains the word 'dolorum' ( should have 102 results )
SELECT users.first_name, users.last_name, comments.body AS comment_body
FROM comments
INNER JOIN posts ON comments.posts_id = posts.id
INNER JOIN users ON comments.users_id = users.id
WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

--Query 13
--Create a query to get the first name of the author of the post (aliased to post_author_first_name),
--  last name of the author of the post (aliased to post_author_last_name), the post title (aliased to post_title),
--  username of the author of the comment (aliased to comment_author_username), and comment body (aliased to comment_body),
--  where the comment body contains the word 'SSL' or 'firewall'
--  and the post content contains the word 'nemo' ( should have 218 results )
SELECT users.first_name AS post_author_first_name, users.last_name AS post_author_last_name,
       users.username AS comment_author_username, comments.body AS comment_body
FROM comments
INNER JOIN posts ON comments.posts_id = posts.id
INNER JOIN users ON comments.users_id = users.id
WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AND posts.content LIKE '%nemo%';


--BONUS DUCKS
--Query 1
--Find the post id, post title, and user id of all posts
--  where the post author commented on his/her own post. ( should have 2 results )

--Query 2
--Count how many comments have been written on posts that have been created after July 14, 2015
--  ( should have one result, the value of the count should be 25)
SELECT count(*)
FROM comments
INNER JOIN posts ON comments.posts_id = posts.id
WHERE posts.created_at > '20150714';

--Query 3
--Find all users who comment about 'programming' ( should have 337 results)