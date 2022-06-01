# CREATE DATABASE ig_clone;
# USE ig_clone;

# CREATE TABLE users (
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     username VARCHAR(255) UNIQUE NOT NULL,
#     created_at TIMESTAMP DEFAULT NOW()
# );

# CREATE TABLE photos (
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     image_url VARCHAR(255) NOT NULL,
#     user_id INT NOT NULL,
#     created_at TIMESTAMP DEFAULT NOW(),
#     FOREIGN KEY(user_id) REFERENCES users(id) 
# );

# CREATE TABLE comments (
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     user_id INT NOT NULL,
#     photo_id INT NOT NULL,
#     comment_text VARCHAR(255) NOT NULL,
#     created_at TIMESTAMP DEFAULT NOW(),
#     FOREIGN KEY(user_id) REFERENCES users(id),
#     FOREIGN KEY(photo_id) REFERENCES photos(id) 
# );

# CREATE TABLE likes (
#    /* no need to track likes, so no id. Instead use PRIMARY KEY
#     with user_id and photo_id combo. That way limit one like per user per photo
#     */
#     user_id INT NOT NULL,
#     photo_id INT NOT NULL,
#     created_at TIMESTAMP DEFAULT NOW(),
#     PRIMARY KEY(user_id, photo_id),
#     FOREIGN KEY(user_id) REFERENCES users(id),
#     FOREIGN KEY(photo_id) REFERENCES photos(id) 
# );


# CREATE TABLE follows (
#     follower_id INT NOT NULL,
#     followee_id INT NOT NULL,
#     created_at TIMESTAMP DEFAULT NOW(),
#     /* user can't follow themself. Order matters and one follow only possible. 
#     Just curious what happens behind the scene when unfollow occurs.
#     */
#     PRIMARY KEY(follower_id, followee_id),
#     FOREIGN KEY(follower_id) REFERENCES users(id),
#     FOREIGN KEY(followee_id) REFERENCES users(id) 
# );


# CREATE TABLE tags (
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     tag_name VARCHAR(255) UNIQUE,
#     created_at TIMESTAMP DEFAULT NOW()
# );

# CREATE TABLE photo_tags (
#     photo_id INT NOT NULL,
#     tag_id INT NOT NULL,
#     PRIMARY KEY(photo_id, tag_id),
#     FOREIGN KEY(photo_id) REFERENCES photos(id),
#     FOREIGN KEY(tag_id) REFERENCES tags(id)
# );

-- who got the most likes on a single photo post?
SELECT 
 /*      users.id,
       users.username, 
       likes.photo_id,
       count(likes.photo_id) as like_counts,
 */      
       CONCAT('The winner of most likes per single photo is ', users.username, ' (user id ', users.id,')',
                 ' for his photo ', photos.image_url, ', which managed ', count(likes.photo_id), ' likes. The photo id is ', photos.id) AS winner
FROM  photos
JOIN  users
    ON photos.user_id = users.id
JOIN likes
    ON likes.photo_id = photos.id
    GROUP BY likes.photo_id, photos.user_id 
    ORDER BY count(likes.photo_id) desc
    LIMIT 1;


/*
Q: Our Investors want to know...
How many times does the average user post?
Post what comment or photo?
*/

SELECT (SELECT COUNT(photos.id) FROM photos)/ (SELECT COUNT(users.id) FROM users) AS 'AVERAGE PHOTO PER USER';  



/*
A brand wants to know which hashtags to use in a post
What are the top 5 most commonly used hashtags?
*/
SELECT tags.tag_name, count(tags.id) AS tag_counts
FROM tags
JOIN photo_tags
    ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY 2
DESC
LIMIT 5
;


/* 
We have a small problem with bots on our site...
Find users who have liked every single photo on the site
*/

SELECT 
       users.id,
       users.username,
       count(users.id) as like_counts
FROM  users
    JOIN likes
        ON likes.user_id = users.id
GROUP BY likes.user_id 
HAVING like_counts = (SELECT COUNT(*) FROM photos)
;
    

    
