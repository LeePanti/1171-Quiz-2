-- Intro to database quiz 2
-- Lee Panti

DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS tracks CASCADE;
DROP TABLE IF EXISTS albums_tracks;

CREATE TABLE albums (
    album_id serial PRIMARY KEY,
    title text NOT NULL,
    release_year int NOT NULL, 
    created_on timestamp(0) with time zone NOT NULL DEFAULT NOW()
);

CREATE TABLE tracks (
    track_id serial PRIMARY KEY, 
    title text NOT NULL,
    length int NOT NULL,
    genre text NOT NULL, 
    created_on timestamp(0) with time zone NOT NULL DEFAULT NOW()
);

CREATE TABLE albums_tracks (
    albums_tracks_id serial PRIMARY KEY, 
    album_id int REFERENCES albums(album_id),
    track_id int REFERENCES tracks(track_id)
);

INSERT INTO albums(title, release_year)
VALUES ('Various Positions', 1984),
('The Essential Leonard Cohen', 2002),
('Help!', 1965), 
('Hotel California', 1976),
('Hell Freezes Over', 1994),
('The Very Best of the Eagles', 1994),
('Appetite for Destruction', 1987),
('Use Your Illusion 11', 1991), 
('We Are Not Alone', 2004), 
('Dreaming Out Loud', 2007),
('Native', 2013);

INSERT INTO tracks(title, length, genre)
VALUES ('Hallelujah', 4, 'pop rock'),
('Yesterday', 2, 'soft rock'),
('Hotel California', 6, 'soft rock'),
('Sweet Child O Mine', 6, 'heavy metal'),
('So Cold', 4, 'alternative metal'),
('Sooner or Later', 3, 'alternative metal'),
('Apologize', 3, 'pop rock'),
('Stop and Stare', 3, 'alternative rock'),
('Counting Stars', 4, 'pop rock'),
('Love Runs Out', 3, 'funck rock'),
('Coming Back to You', 3, 'pop rock'),
('New Kid in Town', 5, 'soft rock');

INSERT INTO albums_tracks(album_id, track_id)
VALUES (1, 1), 
(1, 11),
(2, 1),
(3, 2),
(4, 3), 
(4, 12),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(9, 6),
(10, 7),
(10, 8),
(11, 9), 
(11, 10);

SELECT A.title AS "Album Name", T.title AS "Track Name"
FROM albums AS A 
INNER JOIN albums_tracks AS ALT 
ON A.album_id = ALT.album_id
INNER JOIN tracks AS T 
ON ALT.track_id = T.track_id
ORDER BY A.title ASC;

SELECT T.title AS "Track Name", A.title AS "Album Name"
FROM tracks AS T 
INNER JOIN albums_tracks AS ALT 
ON T.track_id = ALT.track_id
INNER JOIN albums AS A 
ON ALT.album_id = A.album_id
ORDER BY T.title ASC;

SELECT A.title AS "Album Name", COUNT(T.title) AS "Track count"
FROM albums AS A 
INNER JOIN albums_tracks AS ALT 
ON A.album_id = ALT.album_id
INNER JOIN tracks AS T 
ON ALT.track_id = T.track_id
GROUP BY A.title
ORDER BY A.title ASC;

SELECT T.title AS "Track Name", COUNT(A.title) AS "Album Count"
FROM tracks AS T 
INNER JOIN albums_tracks AS ALT 
ON T.track_id = ALT.track_id
INNER JOIN albums AS A 
ON ALT.album_id = A.album_id
GROUP BY T.title
ORDER BY T.title ASC;