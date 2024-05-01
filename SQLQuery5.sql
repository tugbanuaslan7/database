
SELECT 

CITY, SUM(TOTALPRICE) AS TOTALPRICE

MIN(TOTALPRICE) AS MINPRICE, MAX(TOTALPRICE) AS MAXPRICE, COUNT(FICHENO) AS ROWCOUNT_, SUM(TOTALPRICE) AS TOTALPRICE, AVG(TOTALPRICE) AS AVGPRICE

FROM SALES

GROUP BY CITY
ORDER BY SUM(TOTALPRICE)