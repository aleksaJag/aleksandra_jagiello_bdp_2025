-- 2
SELECT 
    p19.type AS poi_category,
    COUNT(*) AS poi_count
FROM T2019_KAR_POI_TABLE p19
LEFT JOIN T2018_KAR_POI_TABLE p18
    ON p19.poi_id = p18.poi_id        -- POI nowe w 2019
JOIN buildings_changed b
    ON ST_DWithin(p19.geom, b.geom, 500)  -- w odległości 500 m
WHERE p18.poi_id IS NULL 
GROUP BY p19.type
ORDER BY poi_count DESC;
