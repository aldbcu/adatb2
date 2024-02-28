--Első
SELECT *,
       IIF(MONTH(METTOL) = 6 OR MONTH(METTOL) = 7 OR MONTH(METTOL) = 8, 'Igen', 'Nem')
FROM FOGLALAS

WHERE UGYFEL_FK = 'laszlo2' AND GYERMEK_SZAM = 0

--Második
SELECT szh.TIPUS, 
       YEAR(f.METTOL) AS 'Év', 
       MONTH(f.METTOL) AS 'Hónap',
       COUNT(*)

FROM Foglalas f JOIN Szoba sz ON f.SZOBA_FK = sz.SZOBA_ID 
                JOIN Szallashely szh ON sz.SZALLAS_FK = szh.SZALLAS_ID
 
WHERE DATEDIFF(day, f.METTOL, f.MEDDIG)>=5
GROUP BY szh.TIPUS, YEAR(f.METTOL), MONTH(f.METTOL)