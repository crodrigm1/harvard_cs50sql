CREATE TABLE 'passengers' (
    'id' integer PRIMARY KEY,
    'nombre' text not null unique,
    'apellido' text not null,
    'edad' integer
);

CREATE TABLE 'checkins' (
    'id' integer PRIMARY KEY,
    'idPassenger' integer,
    'idFligt' integer,
    'idAirline' integer,
    'dateCheckin' timestamp,
    FOREIGN KEY ('idPassenger') REFERENCES 'passengers'('id')
);

CREATE TABLE 'airlines' (
    'id' integer PRIMARY KEY,
    'nombre' text not null UNIQUE,
    'concurse' text not null
);

CREATE TABLE 'fligts' (
    'id' integer PRIMARY KEY,
    'numfligt' text not null UNIQUE,
    'idAirline' integer not null,
    'codigoAirport' text not null,
    'dateDeparture' timestamp not null,
    'dateArrival' timestamp not null,
    FOREIGN KEY('idAirline') REFERENCES 'airlines'('id')
);
