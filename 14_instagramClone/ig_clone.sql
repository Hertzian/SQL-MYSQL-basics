DROP DATABASE ig_clone;
CREATE DATABASE ig_clone;
USE ig_clone;

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW() 
); 

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (username) VALUES
('BleTheCat'),
('CharlieBrown'),
('MaromaTheGolondrina'),
('ClaritaThePitBull'),
('LaloTuPapa');

INSERT INTO photos (image_url, user_id) VALUES
('/asdñflkjasd', 1),
('/asdñflkasdfjasd', 2),
('/asdñflkjasfdsd', 3),
('/sdflasdñflkjasfdsd', 3),
('/asdñflkjafdsd', 4),
('/asdñflkjdfssd', 5);



SELECT photos.image_url, users.username FROM users
LEFT JOIN photos
ON users.id = photos.user_id;
