SELECT
  city_name,
  COUNT(EmployeeID) AS employees
FROM
  MKR.database.employees_2011
WHERE (
      SELECT
        EXTRACT (YEAR
        FROM
          orighiredate_key) = 2011) AND STATUS = 'ACTIVE'
GROUP BY
  1
ORDER BY
  2 DESC
LIMIT
  3
