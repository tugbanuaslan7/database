SELECT CITY, DATE2, SUM(TOTALPRICE) AS TOTALPRICE

FROM SALES WHERE CITY = 'ANKARA'

GROUP BY CITY, DATE2

ORDER BY CITY, DATE2