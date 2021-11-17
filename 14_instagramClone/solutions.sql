-- Challenge 1
-- Finding 5 oldest users
SELECT * FROM users
ORDER BY created_at
LIMIT 5;

-- Challenge 2
-- Most popular registration date
-- My solution
SELECT
DAYNAME(created_at) AS Day,
COUNT(DAYNAME(created_at)) AS Count 
FROM users
GROUP BY Day
ORDER BY Count DESC;
--
SELECT 
DAYNAME(created_at) AS Day,
COUNT(*) AS total
FROM users
GROUP BY Day
ORDER BY total DESC
LIMIT 2;

-- Challenge 3
-- Identify Inactive Users (users with no photos)
-- My solution
SELECT username, image_url
FROM users
LEFT JOIN photos
ON users.id = photos.user_id
WHERE image_url IS NULL
ORDER BY username ASC;
--
SELECT username, image_url 
FROM users
LEFT JOIN photos
ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- Challenge 4
-- Identify most popular photo (and user who created it)
-- My solution is not good XD
SELECT username, image_url, count(likes.user_id) AS Count
FROM users
INNER JOIN photos
ON users.id = photos.user_id
INNER JOIN likes
GROUP BY username
ORDER BY Count DESC
LIMIT 5;
--
SELECT username, photos.id, photos.image_url, likes.user_id, COUNT(*) AS total
FROM photos
INNER JOIN likes
ON likes.photo_id = photos.id
INNER JOIN users
ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- Challenge 5
-- Calculate avg number of photos per user
-- total number of photos / total number of users
SELECT 
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg;

-- Challenge 6
-- Five Most popular hashtags
SELECT tags.tag_name, COUNT(*) AS total
FROM photo_tags
INNER JOIN tags
ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

-- Challenge 7
-- Finding Boots, users who have liked every single photo
SELECT username, user_id, COUNT(*) as num_likes
FROM users
INNER JOIN likes
ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);
