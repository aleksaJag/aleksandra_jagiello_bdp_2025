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

