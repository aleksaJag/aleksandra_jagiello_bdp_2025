-- 3.
-- Żeby LINESTRING można było zmienić na POLYGON, musi być zamknięty 
-- (pierwszy i ostatni punkt takie same).
UPDATE obiekty
SET geom = ST_AddPoint(geom, ST_StartPoint(geom))
WHERE name='obiekt4';

UPDATE obiekty
SET geom = ST_MakePolygon(geom)
WHERE name='obiekt4';
