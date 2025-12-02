-- 2.
SELECT 
    ST_Area(
        ST_Buffer(
            ST_ShortestLine(
                (SELECT geom FROM obiekty WHERE name='obiekt3'),
                (SELECT geom FROM obiekty WHERE name='obiekt4')
            ),
        5)
    ) AS pole_bufora;
