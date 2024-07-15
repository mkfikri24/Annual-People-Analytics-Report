SELECT
  ((SELECT
    COUNT(DISTINCT EmployeeID)
  FROM
    MKR.database.employees_2011
  WHERE
    STATUS = 'ACTIVE') - (
  SELECT
    COUNT(DISTINCT EmployeeID)
  FROM
    MKR.database.employees_2010
  WHERE
    STATUS = 'ACTIVE')) /
  (SELECT
    COUNT(DISTINCT EmployeeID)
  FROM
    MKR.database.employees_2010
  WHERE
    STATUS = 'ACTIVE') * 100 AS growth_rate
