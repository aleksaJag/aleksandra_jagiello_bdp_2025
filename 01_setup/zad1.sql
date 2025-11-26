CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy (
    id_pracownika SERIAL PRIMARY KEY,
    imie VARCHAR(30) NOT NULL,
    nazwisko VARCHAR(40) NOT NULL,
    adres VARCHAR(100),
    telefon VARCHAR(15)
);

COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tabela przechowuje dane pracowników firmy.';

CREATE TABLE ksiegowosc.godziny (
    id_godziny SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    liczba_godzin NUMERIC(5,2) NOT NULL,
    id_pracownika INT REFERENCES ksiegowosc.pracownicy(id_pracownika)
);

COMMENT ON TABLE ksiegowosc.godziny IS 'Ewidencja liczby przepracowanych godzin.';

CREATE TABLE ksiegowosc.pensja (
    id_pensji SERIAL PRIMARY KEY,
    stanowisko VARCHAR(40) NOT NULL,
    kwota NUMERIC(10,2) NOT NULL
);

COMMENT ON TABLE ksiegowosc.pensja IS 'Lista stanowisk oraz przypisanych im wynagrodzeń zasadniczych.';

CREATE TABLE ksiegowosc.premia (
    id_premii SERIAL PRIMARY KEY,
    rodzaj VARCHAR(40) NOT NULL,
    kwota NUMERIC(10,2) NOT NULL
);

COMMENT ON TABLE ksiegowosc.premia IS 'Lista rodzajów premii oraz ich kwot.';

CREATE TABLE ksiegowosc.wynagrodzenie (
    id_wynagrodzenia SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    id_pracownika INT REFERENCES ksiegowosc.pracownicy(id_pracownika),
    id_godziny INT REFERENCES ksiegowosc.godziny(id_godziny),
    id_pensji INT REFERENCES ksiegowosc.pensja(id_pensji),
    id_premii INT REFERENCES ksiegowosc.premia(id_premii)
);

COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Łączne informacje o wypłatach pracowników.';

INSERT INTO ksiegowosc.pracownicy (imie, nazwisko, adres, telefon) VALUES
('Jan', 'Nowak', 'Kraków, ul. Długa 12', '500100200'),
('Anna', 'Kowalska', 'Warszawa, ul. Brzozowa 4', '500100201'),
('Piotr', 'Zieliński', 'Gdańsk, ul. Morska 7', '500100202'),
('Julia', 'Mazur', 'Kraków, ul. Lea 45', '500100203'),
('Jakub', 'Wiśniewski', 'Poznań, ul. Dobra 9', '500100204'),
('Joanna', 'Bąk', 'Wrocław, ul. Słoneczna 11', '500100205'),
('Marek', 'Konieczny', 'Łódź, ul. Zielona 17', '500100206'),
('Karolina', 'Adamska', 'Kraków, ul. Krótka 2', '500100207'),
('Jacek', 'Urban', 'Gdynia, ul. Portowa 6', '500100208'),
('Natalia', 'Nowicka', 'Katowice, ul. Piękna 14', '500100209');

INSERT INTO ksiegowosc.godziny (data, liczba_godzin, id_pracownika) VALUES
('2025-01-01', 168, 1),
('2025-01-01', 150, 2),
('2025-01-01', 172, 3),
('2025-01-01', 160, 4),
('2025-01-01', 165, 5),
('2025-01-01', 158, 6),
('2025-01-01', 170, 7),
('2025-01-01', 162, 8),
('2025-01-01', 151, 9),
('2025-01-01', 180, 10);

INSERT INTO ksiegowosc.pensja (stanowisko, kwota) VALUES
('kierownik', 4000),
('specjalista', 2800),
('asystent', 2000),
('analityk', 3500),
('programista', 4500),
('księgowy', 3200),
('magazynier', 2400),
('pracownik biurowy', 2200),
('technik', 2600),
('sprzedawca', 1800);

INSERT INTO ksiegowosc.premia (rodzaj, kwota) VALUES
('brak', 0),
('uznaniowa', 300),
('świąteczna', 500),
('motywacyjna', 200),
('projektowa', 400),
('brak2', 0),
('zadaniowa', 350),
('lojalnościowa', 250),
('brak3', 0),
('okolicznościowa', 150);

INSERT INTO ksiegowosc.wynagrodzenie (data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES
('2025-01-31', 1, 1, 2, 2),
('2025-01-31', 2, 2, 3, 1),
('2025-01-31', 3, 3, 4, 3),
('2025-01-31', 4, 4, 1, 1),
('2025-01-31', 5, 5, 5, 4),
('2025-01-31', 6, 6, 6, 6),
('2025-01-31', 7, 7, 7, 1),
('2025-01-31', 8, 8, 8, 9),
('2025-01-31', 9, 9, 9, 1),
('2025-01-31', 10, 10, 10, 1);


-- 5. Wykonanie zapytań
-- a) id i nazwisko pracownika
SELECT id_pracownika, nazwisko
FROM ksiegowosc.pracownicy;

-- b)
SELECT p.id_pracownika
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
WHERE s.kwota > 1000;

-- c)
SELECT p.id_pracownika
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
JOIN ksiegowosc.premia pr ON w.id_premii = pr.id_premii
WHERE pr.kwota = 0 AND s.kwota > 2000;

-- d)
SELECT *
FROM ksiegowosc.pracownicy
WHERE imie LIKE 'J%';

-- e)
SELECT *
FROM ksiegowosc.pracownicy
WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';

-- f)
SELECT p.imie, p.nazwisko, (g.liczba_godzin - 160) AS nadgodziny
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.godziny g ON p.id_pracownika = g.id_pracownika;

-- g)
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
WHERE s.kwota BETWEEN 1500 AND 3000;

-- h)
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.godziny g ON p.id_pracownika = g.id_pracownika
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.premia pr ON w.id_premii = pr.id_premii
WHERE g.liczba_godzin > 160 AND pr.kwota = 0;

-- i)
SELECT p.imie, p.nazwisko, s.kwota
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
ORDER BY s.kwota;

-- j)
SELECT p.imie, p.nazwisko, s.kwota, pr.kwota
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
JOIN ksiegowosc.premia pr ON w.id_premii = pr.id_premii
ORDER BY s.kwota DESC, pr.kwota DESC;

-- k)
SELECT s.stanowisko, COUNT(*)
FROM ksiegowosc.pensja s
JOIN ksiegowosc.wynagrodzenie w ON s.id_pensji = w.id_pensji
GROUP BY s.stanowisko;

-- l)
SELECT 
    AVG(kwota), MIN(kwota), MAX(kwota)
FROM ksiegowosc.pensja
WHERE stanowisko = 'kierownik';

-- m)
SELECT SUM(s.kwota + pr.kwota)
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
JOIN ksiegowosc.premia pr ON w.id_premii = pr.id_premii;

-- n)
SELECT s.stanowisko, SUM(s.kwota + pr.kwota)
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
JOIN ksiegowosc.premia pr ON w.id_premii = pr.id_premii
GROUP BY s.stanowisko;

-- o)
SELECT s.stanowisko, COUNT(pr.id_premii)
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
JOIN ksiegowosc.premia pr ON w.id_premii = pr.id_premii
WHERE pr.kwota > 0
GROUP BY s.stanowisko;

-- p)
DELETE FROM ksiegowosc.pracownicy
WHERE id_pracownika IN (
    SELECT p.id_pracownika
    FROM ksiegowosc.pracownicy p
    JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
    JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
    WHERE s.kwota < 1200
);
 

