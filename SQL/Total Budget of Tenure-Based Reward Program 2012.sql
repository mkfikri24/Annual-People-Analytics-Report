SELECT
  SUM(reward) as total_budget
FROM (
  SELECT
    *,
    CASE
      WHEN tenure >= 0 AND tenure <= 5 THEN 100
      WHEN tenure >= 6 AND tenure <= 10 THEN 200
      WHEN tenure >= 11 AND tenure < 15 THEN 300
      WHEN tenure >= 15 THEN 500
  END
    AS reward
  FROM (
    SELECT
      STATUS_YEAR - (
      SELECT
        EXTRACT (YEAR
        FROM
          orighiredate_key)) AS tenure
    FROM
      MKR.database.employees_2011
    WHERE
      STATUS = 'ACTIVE'))
