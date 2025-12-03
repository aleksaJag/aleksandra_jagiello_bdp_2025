CREATE TABLE T2019_KAR_BRIDGES AS
SELECT 
    r.gid AS railway_gid,
    w.gid AS water_gid,
    ST_Intersection(r.geom, w.geom) AS geom
FROM T2019_KAR_RAILWAYS r
JOIN T2019_KAR_WATER_LINES w
    ON ST_Intersects(r.geom, w.geom)  -- tylko geometrie, które się przecinają
WHERE ST_Dimension(ST_Intersection(r.geom, w.geom)) = 0; -- upewniamy się, że wynik to punkt
