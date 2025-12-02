-- 4.
INSERT INTO obiekty(name, geom)
SELECT
    'obiekt7',
    ST_Union(
        (SELECT geom FROM obiekty WHERE name='obiekt3'),
        (SELECT geom FROM obiekty WHERE name='obiekt4')
    );
