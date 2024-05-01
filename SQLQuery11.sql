SELECT CITY, 

COUNT(DISTINCT CUSTOMERNAME) AS UNIQUCUSTOMER,

COUNT(DISTINCT FICHENO) AS CUSTOMERCOUNT, 

COUNT(*) ITEMCOUNT

FROM SALES WHERE MONTHNAME_ = '01.OCAK'

GROUP BY CITY

ORDER BY CITY