create extension postgis


-- 1
CREATE TABLE buildings_changed AS
SELECT b19.*
FROM T2019_KAR_BUILDINGS b19
LEFT JOIN T2018_KAR_BUILDINGS b18
    ON b19.polygon_id = b18.polygon_id
WHERE b18.polygon_id IS NULL        -- nowe budynki
   OR NOT ST_Equals(b19.geom, b18.geom);   -- zmieniona geometria (remont/rozbudowa)
