CREATE TABLE IF NOT EXISTS ListGenres(
	id_genre SERIAL PRIMARY KEY, 
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS ListPerformers(
	id_performer SERIAL PRIMARY KEY,
	nickname VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenresPerformers(
	genre_id INTEGER NOT NULL REFERENCES ListGenres(id_genre),
	performer_id INTEGER NOT NULL REFERENCES ListPerformers(id_performer),
	CONSTRAINT id_genre_performer PRIMARY KEY (genre_id, performer_id)
);

CREATE TABLE IF NOT EXISTS ListAlbum(
	id_album SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	year_release INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS PerformersAlbum(
	performer_id integer NOT NULL REFERENCES ListPerformers(id_performer),
	album_id integer NOT NULL REFERENCES ListAlbum(id_album),
	CONSTRAINT id_performer_album PRIMARY KEY (performer_id, album_id)
);

CREATE TABLE IF NOT EXISTS ListTrack(
	id_track SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES ListAlbum(id_album),
	name VARCHAR(60) NOT NULL,
	duration INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS collection(
	id_collection SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	year_release INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS TrackCollection(
	track_id INTEGER NOT NULL REFERENCES ListTrack(id_track),
	collection_id INTEGER NOT NULL REFERENCES collection(id_collection),
	CONSTRAINT id_track_collection PRIMARY KEY (track_id, collection_id)
);