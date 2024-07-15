SELECT
  (
  SELECT
    COUNT(EmployeeID)
  FROM
    MKR.database.employees_2011
  WHERE
    STATUS = 'ACTIVE') / (
  SELECT
    COUNT(EmployeeID)
  FROM
    MKR.database.employees_2010
  WHERE
    STATUS = 'ACTIVE') * 100 AS retention_rate
