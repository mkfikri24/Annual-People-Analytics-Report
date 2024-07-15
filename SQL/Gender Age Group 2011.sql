SELECT
  age,
  SUM(IF(gender_full = 'Male', 1,0)) AS `Male`,
  SUM(IF(gender_full = 'Female', 1,0)) AS `Female`
FROM (
  SELECT
    *,
    CASE
      WHEN STATUS_YEAR - EXTRACT(year FROM birthdate_key) <= 30 THEN '30 Years and Below'
      WHEN STATUS_YEAR - EXTRACT(year FROM birthdate_key) BETWEEN 31 AND 40 THEN '31-40 Years'
      WHEN STATUS_YEAR - EXTRACT(year FROM birthdate_key) BETWEEN 41 AND 50 THEN '41-50 Years'
      WHEN STATUS_YEAR - EXTRACT(year FROM birthdate_key) BETWEEN 51 AND 60 THEN '51-60 Years'
      WHEN STATUS_YEAR - EXTRACT(year FROM birthdate_key) >= 60 THEN '60 Years and Above'
  END
    AS age
  FROM MKR.database.employees_2011
  WHERE STATUS = 'ACTIVE')
GROUP BY 1
ORDER BY 1
