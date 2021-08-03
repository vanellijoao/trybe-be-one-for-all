DROP SCHEMA IF EXISTS SpotifyClone;
CREATE SCHEMA SpotifyClone;
USE SpotifyClone;

CREATE TABLE plans (
    plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    plan VARCHAR(100) NOT NULL,
    price DECIMAL(10 , 2 ) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id)
        REFERENCES plans (plan_id)
)  ENGINE=INNODB;

CREATE TABLE artists (
    artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    artist VARCHAR(100) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE albums (
    album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album VARCHAR(100) NOT NULL,
    artist_id INTEGER,
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
)  ENGINE=INNODB;

CREATE TABLE songs (
    song_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    song VARCHAR(100) NOT NULL,
    album_id INTEGER,
    FOREIGN KEY (album_id)
        REFERENCES albums (album_id)
)  ENGINE=INNODB;

CREATE TABLE followed_artists (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id),
    CONSTRAINT PRIMARY KEY (user_id , artist_id)
)  ENGINE=INNODB;

CREATE TABLE song_history (
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    FOREIGN KEY (song_id)
        REFERENCES songs (song_id),
    CONSTRAINT PRIMARY KEY (user_id , song_id)
)  ENGINE=INNODB;

INSERT INTO plans(plan, price)
VALUES
('gratuito', 0),
('universitário', 5.99),
('familiar', 7.99);

INSERT INTO users(user, age, plan_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO artists(artist)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO albums(album, artist_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO songs(song, album_id)
VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
("Sweetie, Let's Go Wild", 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
("Honey, Let's Be Silly", 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

INSERT INTO followed_artists(user_id, artist_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO song_history(user_id, song_id)
VALUES
(1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 13),
(2, 17),
(2, 2),
(2, 15),
(3, 4),
(3, 16),
(3, 6),
(4, 3),
(4, 18),
(4, 11);
