CREATE TABLE public.buildings (
  id SERIAL PRIMARY KEY,
  geom geometry(Polygon, 0),
  name TEXT
);

COMMENT ON TABLE public.buildings IS 'Poligony reprezentujące budynki. SRID=0 (undefined)';

CREATE TABLE public.roads (
  id SERIAL PRIMARY KEY,
  geom geometry(LineString, 0),
  name TEXT
);

COMMENT ON TABLE public.roads IS 'Linie reprezentujące drogi. SRID=0';

CREATE TABLE public.poi (
  id SERIAL PRIMARY KEY,
  geom geometry(Point, 0),
  name TEXT
);

COMMENT ON TABLE public.poi IS 'Punkty zainteresowania (poi). SRID=0';
