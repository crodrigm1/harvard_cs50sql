/****
Seleccionar el id del libro de unautor especifico
*/
SELECT 'book_id' FROM 'authored'
WHERE 'author_id' = (
    SELECT 'id' FROM 'authors'
    WHERE 'name' = 'Fernanda Melchor'
);

/*
Busca el titulo en libros donde el id del libro en la tabla autores
donde el id del author sea el mismo de id del autor especifico
*/
SELECT 'title' FROM 'books'
WHERE 'id' IN (
    SELECT 'book_id' FROM 'authored'
    WHERE 'author_id' = (
        SELECT 'id' FROM 'authors'
        WHERE 'name' = 'Fernanda Melchor'
    )
);

/*
busca el nombre del libro y autores cruzando 2 tablas
*/
SELECT 'name', 'title' FROM 'authors'
    JOIN 'authored' ON 'authors'.'id' = 'authored'.'author_id',
    JOIN 'books' ON 'books'.'id' = 'authored'.'book_id';

/*
Crear una vista
*/
CREATE VIEW 'longlist' AS
    SELECT 'name', 'title' FROM 'authors'
    JOIN 'authored' ON 'authors'.'id' = 'authored'.'author_id',
    JOIN 'books' ON 'books'.'id' = 'authored'.'book_id';

