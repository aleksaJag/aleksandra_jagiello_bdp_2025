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
