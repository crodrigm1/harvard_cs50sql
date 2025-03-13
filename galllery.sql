CREATE TABLE IF NOT EXISTS 'collections' (
    'id' INTEGER,
    'title' TEXT NOT NULL,
    'accession_number' TEXT NOT NULL UNIQUE,
    'acquired' NUMERIC,
	PRIMARY KEY('id')
);

INSERT INTO 'collections' ('id', 'title', 'accession_number', 'acquired')
VALUES (1, 'Profusion of flowers', '56.257', '1956-04-12');
INSERT INTO 'collections' ('id', 'title', 'accession_number', 'acquired')
VALUES (2, 'Farmersworking at dawn', '11.6152', '1911-08-03');
INSERT INTO 'collections' ('title', 'accession_number', 'acquired')
VALUES
('Spring outing', '14.76', '1914-01-08'), /* sin id*/
('Imaginative landscape', '56.496', NULL),
('Peonie and butterfly', '06.1899', '1906-01-15');

CREATE TABLE IF NOT EXISTS 'artists'(
    'id' INTEGER,
    'name' TEXT,
    PRIMARY KEY('id')
);

INSERT INTO 'artists' ('id', 'name')
VALUES (1, 'Li Yin');
INSERT INTO 'artists' ('id', 'name')
VALUES (2, 'Qian Weicheng');
INSERT INTO 'artists' ('id', 'name')
VALUES (3, 'Unidentified artist');
INSERT INTO 'artists' ('id', 'name')
VALUES (4, 'Zhou Chen');

CREATE TABLE IF NOT EXISTS 'created'(
    'artist_id' INTEGER,
    'collection_id' INTEGER,
    PRIMARY KEY('artist_id', 'collection_id'),
    FOREIGN KEY('artist_id') REFERENCES 'artists'('id') ON DELETE CASCADE,
    FOREIGN KEY('collection_id') REFERENCES 'collections'('id') ON DELETE CASCADE
);

INSERT INTO 'created' ('artist_id', 'collection_id')
VALUES (1, 1);
INSERT INTO 'created' ('artist_id', 'collection_id')
VALUES (2, 3);
INSERT INTO 'created' ('artist_id', 'collection_id')
VALUES (3, 4);
INSERT INTO 'created' ('artist_id', 'collection_id')
VALUES (4, 2);

CREATE TABLE 'transactions'(
	'id' INTEGER,
	'title' TEXT,
	'action' TEXT,
	PRIMARY KEY('id')
);

CREATE TRIGGER 'sell'
BEFORE DELETE ON 'collections'
FOR EACH ROW
BEGIN
	INSERT INTO 'transactions' ('title', 'action')
	VALUES (OLD.'title', 'sold');
END;

CREATE TRIGGER 'sell'
BEFORE DELETE ON 'collections'
FOR EACH ROW
BEGIN
    INSERT INTO 'transactions' ('title', 'action')
	VALUES (NEW.'title', 'bought');
END;
