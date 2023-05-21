;

WITH CTE AS(
	SELECT
		1 A
	UNION
	ALL
	SELECT
		A + 1
	FROM
		CTE
	WHERE
		A + 1 <= 10
)
SELECT
	*
FROM
	CTE;
