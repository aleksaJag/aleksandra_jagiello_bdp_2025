CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE public.buildings (
  id SERIAL PRIMARY KEY,
  geom geometry(Polygon, 0),
  name TEXT
);

COMMENT ON TABLE public.buildings IS 'Poligony reprezentujące budynki. SRID=0 (undefined)';

CREATE TABLE public.roads (
  id SERIAL PRIMARY KEY,
  geom geometry(LineString, 0),
  name TEXT
);

COMMENT ON TABLE public.roads IS 'Linie reprezentujące drogi. SRID=0';

CREATE TABLE public.poi (
  id SERIAL PRIMARY KEY,
  geom geometry(Point, 0),
  name TEXT
);

COMMENT ON TABLE public.poi IS 'Punkty zainteresowania (poi). SRID=0';

-- Buildings
INSERT INTO public.buildings (geom, name) VALUES
  (ST_GeomFromText('POLYGON((8 4, 10.5 4, 10.5 1.5, 8 1.5, 8 4))', 0), 'BuildingA'),
  (ST_GeomFromText('POLYGON((9 9, 10 9, 10 8, 9 8, 9 9))', 0), 'BuildingD'),
  (ST_GeomFromText('POLYGON((3 8, 5 8, 5 6, 3 6, 3 8))', 0), 'BuildingC'),
  (ST_GeomFromText('POLYGON((4 7, 6 7, 6 5, 4 5, 4 7))', 0), 'BuildingB'),
  (ST_GeomFromText('POLYGON((1 2, 2 2, 2 1, 1 1, 1 2))', 0), 'BuildingF');

-- Roads
INSERT INTO public.roads (geom, name) VALUES
  (ST_GeomFromText('LINESTRING(0 4.5, 12 4.5)', 0), 'RoadX'),
  (ST_GeomFromText('LINESTRING(7.5 0, 7.5 10.5)', 0), 'RoadY');

-- POI points
INSERT INTO public.poi (geom, name) VALUES
  (ST_GeomFromText('POINT(6 9.5)', 0), 'K'),
  (ST_GeomFromText('POINT(6.5 6)', 0), 'J'),
  (ST_GeomFromText('POINT(9.5 6)', 0), 'I'),
  (ST_GeomFromText('POINT(1 3.5)', 0), 'G'),
  (ST_GeomFromText('POINT(5.5 1.5)', 0), 'H');

-- Polecenia

-- a)
SELECT SUM(ST_Length(geom)) AS total_road_length
FROM public.roads;

-- b)
SELECT
  ST_AsText(geom) AS wkt,
  ST_Area(geom)  AS area,
  ST_Perimeter(geom) AS perimeter
FROM public.buildings
WHERE name = 'BuildingA';

-- c)
SELECT name, ST_Area(geom) AS area
FROM public.buildings
ORDER BY name;

-- d)
SELECT name, ST_Area(geom) AS area, ST_Perimeter(geom) AS perimeter
FROM public.buildings
ORDER BY area DESC
LIMIT 2;

-- e)
SELECT ST_Distance(b.geom, p.geom) AS distance
FROM public.buildings b
JOIN public.poi p ON p.name = 'K'
WHERE b.name = 'BuildingC';

-- f)
WITH
  bc AS (SELECT geom FROM public.buildings WHERE name = 'BuildingC'),
  bb AS (SELECT geom FROM public.buildings WHERE name = 'BuildingB')
SELECT ST_Area(ST_Difference(bc.geom, ST_Buffer(bb.geom, 0.5))) AS area_outside_0_5
FROM bc, bb;

-- g)
SELECT name
FROM public.buildings
WHERE ST_Y(ST_Centroid(geom)) > 4.5;

-- h)
WITH
  bc AS (SELECT geom FROM public.buildings WHERE name = 'BuildingC'),
  poly AS (SELECT ST_GeomFromText('POLYGON((4 7, 6 7, 6 8, 4 8, 4 7))', 0) AS geom)
SELECT
  ST_Area(ST_SymDifference(bc.geom, poly.geom)) AS area_not_common -- pole części, które nie są wspólne
FROM bc, poly;
