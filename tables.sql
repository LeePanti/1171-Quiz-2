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
