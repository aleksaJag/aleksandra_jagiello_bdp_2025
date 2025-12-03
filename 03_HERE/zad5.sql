ALTER TABLE input_points
ALTER COLUMN geom TYPE geometry(Point, 3068)
USING ST_SetSRID(geom, 3068);

UPDATE input_points
SET geom = ST_Transform(ST_SetSRID(geom, 4326), 3068);
