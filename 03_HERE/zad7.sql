WITH parks AS (
    SELECT geom
    FROM T2019_KAR_LAND_USE_A
    WHERE type = 'Park'
)

SELECT COUNT(*) AS sporting_goods_near_parks
FROM T2019_KAR_POI_TABLE poi
JOIN parks p
    ON ST_DWithin(poi.geom, p.geom, 300)
WHERE poi.type = 'Sporting Goods Store';
