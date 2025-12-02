-- g)
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
WHERE s.kwota BETWEEN 1500 AND 3000;
