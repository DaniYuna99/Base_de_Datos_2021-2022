--PRACTICA 3
--1.
SELECT AVG(DTO) 
FROM FACTURAS;

--2.
SELECT AVG(DTO) 
FROM FACTURAS;

--3.
SELECT AVG(NVL(DTO, 0)) 
FROM FACTURAS;

--4.
SELECT COUNT(CODFAC)
FROM FACTURAS;

--5.
SELECT COUNT(p2.CODPUE)
FROM PROVINCIAS p, PUEBLOS p2 
WHERE (p.NOMBRE LIKE 'ALICANTE'
OR p.NOMBRE LIKE'VALENCIA'
OR p.NOMBRE LIKE 'CASTELLON')
AND p.CODPRO = p2.CODPRO ; 


--6.
SELECT SUM(PRECIO *STOCK) 
FROM ARTICULOS a ;

--7.
SELECT COUNT(DISTINCT CODPUE) 
FROM CLIENTES c 
WHERE CODCLI LIKE '12%';

--8.
SELECT MAX(STOCK), MIN(STOCK), MAX(STOCK)-MIN(STOCK) 
FROM ARTICULOS a 
WHERE PRECIO BETWEEN 9 AND 12;



--9.
SELECT AVG(nvl(PRECIO, 0)) 
FROM ARTICULOS a 
WHERE STOCK >10;

--10. NO HAY CLIENTE 210
SELECT MAX(FECHA) AS ULTIMA_FACT, MIN(FECHA) AS PRIMERA_FACT
FROM FACTURAS f 
WHERE CODCLI = 210;

--11.
SELECT COUNT(CODART) 
FROM ARTICULOS a 
WHERE STOCK IS NULL;

--12.
SELECT COUNT(LINEA) 
FROM LINEAS_FAC lf 
WHERE DTO IS NULL;

--13.
SELECT DISTINCT CODCLI, COUNT(CODFAC) 
FROM FACTURAS f 
GROUP BY CODCLI ;

--14.
SELECT DISTINCT CODCLI, COUNT(CODFAC) 
FROM FACTURAS f
GROUP BY CODCLI
HAVING COUNT(CODFAC)>=2 ;

--15.
SELECT SUM(CANT*PRECIO) 
FROM LINEAS_FAC lf ;

--16.
SELECT SUM(CANT*PRECIO) 
FROM LINEAS_FAC lf 
WHERE UPPER(CODART) LIKE ('%A%');

--17.
SELECT DISTINCT FECHA , COUNT(CODFAC) 
FROM FACTURAS f 
GROUP BY FECHA ;

--18.
SELECT COUNT(CODCLI), p.NOMBRE 
FROM CLIENTES c , PUEBLOS p 
WHERE c.CODPUE = p.CODPUE 
GROUP BY p.NOMBRE 
ORDER BY COUNT(CODCLI) DESC ;

--19.
SELECT COUNT(CODCLI), p.NOMBRE 
FROM CLIENTES c , PUEBLOS p 
WHERE c.CODPUE = p.CODPUE 
GROUP BY p.NOMBRE 
HAVING COUNT(CODCLI)> 2 
ORDER BY COUNT(CODCLI) DESC ;

--20.
SELECT SUM(lf.CANT) , a.DESCRIP 
FROM LINEAS_FAC lf, ARTICULOS a 
WHERE lf.CODART = a.CODART 
AND a.CODART LIKE ('P%')
GROUP BY a.DESCRIP ;

--9**
SELECT MAX(PRECIO), MIN(PRECIO) , CODART 
FROM LINEAS_FAC lf 
WHERE CODART LIKE ('C%')
GROUP BY CODART ;

--21.
SELECT CODART , MAX(PRECIO), MIN(PRECIO) , MAX(PRECIO)- MIN(PRECIO)
FROM LINEAS_FAC lf 
WHERE CODART LIKE ('C%')
GROUP BY CODART ;

--22.
SELECT a.DESCRIP 
FROM LINEAS_FAC lf , ARTICULOS a 
WHERE lf.CODART = a.CODART 
GROUP BY a.DESCRIP 
HAVING SUM(lf.CANT*lf.PRECIO) > 10000;

--23.
SELECT NVL(IVA, 0), CODCLI, COUNT(CODFAC)
FROM FACTURAS 
WHERE CODCLI BETWEEN 150 AND 300
GROUP BY IVA, CODCLI ;

--24.
SELECT AVG(CANT*PRECIO) 
FROM LINEAS_FAC lf ;



