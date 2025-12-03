UPDATE T2019_KAR_STREETS
SET geom = ST_SetSRID(geom, 4326)
WHERE ST_SRID(geom) = 0;

CREATE TABLE streets_reprojected AS
SELECT
    gid,
    link_id,
    st_name,
    ref_in_id,
    nref_in_id,
    func_class,
    speed_cat,
    fr_speed_l,
    to_speed_l,
    dir_travel,
    ST_Transform(geom, 3068) AS geom
FROM T2019_KAR_STREETS;
