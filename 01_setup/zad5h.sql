-- h)
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.godziny g ON p.id_pracownika = g.id_pracownika
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.premia pr ON w.id_premii = pr.id_premii
WHERE g.liczba_godzin > 160 AND pr.kwota = 0;
