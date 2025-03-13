CREATE TABLES IF NO EXIST 'longlist'(
    'isbn' TEXT NOT NULL,
    'title' TEXT,
    'author' TEXT,
    'translator' TEXT,
    'format' TEXT,
    'pages' INTEGER,
    'publisher' TEXT,
    'published' TEXT,
    'year' TEXT,
    'votes' TEXT,
    'rating' TEXT
);

INSERT INTO longlist ('isbn', 'title', 'author', 'translator', 'format', 'pages', 'publisher', 'published', 'year', 'votes', 'rating')
SELECT 'isbn', 'title', 'author', 'translator', 'format', 'pages', 'publisher', 'published', 'year', 'votes', 'rating'
FROM temp;


DROP TABLE 'temp';
