WITH reprojected_nodes AS (
    SELECT 
        gid,
        node_id,
        link_id,
        point_num,
        z_level,
        "intersect",
        ST_Transform(ST_SetSRID(geom, 4326), 3068) AS geom
    FROM T2019_kar_street_node
),
input_line AS (
    SELECT 
        ST_MakeLine(geom ORDER BY id) AS geom
    FROM input_points
)

SELECT 
    n.*
FROM reprojected_nodes n,
     input_line l
WHERE ST_DWithin(n.geom, l.geom, 200);
