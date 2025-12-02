CREATE EXTENSION postgis;

CREATE TABLE obiekty (
    id SERIAL PRIMARY KEY,
    name TEXT,
    geom geometry
);

INSERT INTO obiekty(name, geom) VALUES
('obiekt1',
 ST_CurveToLine(
   ST_GeomFromText(
     'COMPOUNDCURVE(
        (0 1, 1 1),
        CIRCULARSTRING(1 1, 2 0, 3 1),
        CIRCULARSTRING(3 1, 4 2, 5 1),
        (5 1, 6 1)
     )'
   )
 )
);

INSERT INTO obiekty (name, geom) VALUES 
('obiekt2', 
    ST_CurveToLine(
        ST_GeomFromText(
            'CURVEPOLYGON(
                COMPOUNDCURVE(
                    (10 2, 10 6),
                    (10 6, 14 6),
                    CIRCULARSTRING(14 6, 16 4, 14 2),
                    CIRCULARSTRING(14 2, 12 0, 10 2)
                ),
                CIRCULARSTRING(11 2, 13 2, 11 2)
            )'
        )
    )
);

INSERT INTO obiekty(name, geom) VALUES
('obiekt3',
 ST_GeomFromText(
   'POLYGON((7 15, 10 17, 12 13, 7 15))'
 )
);

INSERT INTO obiekty(name, geom) VALUES
('obiekt4',
 ST_GeomFromText(
   'LINESTRING(
      20 20, 25 25, 27 24, 25 22, 26 21, 22 19, 20.5 19.5
   )'
 )
);

INSERT INTO obiekty(name, geom)
VALUES (
  'obiekt5',
  ST_Collect(
    ST_SetSRID(ST_MakePoint(30, 30, 59), 0),
    ST_SetSRID(ST_MakePoint(38, 32, 234), 0)
  )
);

INSERT INTO obiekty(name, geom) VALUES
('obiekt6',
 ST_Collect(
     ST_GeomFromText('LINESTRING(1 1, 3 2)'),
     ST_Point(4, 2)
 )
);
