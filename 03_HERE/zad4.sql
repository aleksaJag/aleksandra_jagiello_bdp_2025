-- 1. Tworzenie tabeli
CREATE TABLE input_points (
    id SERIAL PRIMARY KEY,
    geom geometry(Point, 4326)
);

-- 2. Dodanie dwóch punktów
INSERT INTO input_points (geom)
VALUES
    (ST_SetSRID(ST_Point(8.36093, 49.03174), 4326)),
    (ST_SetSRID(ST_Point(8.39876, 49.00644), 4326));
