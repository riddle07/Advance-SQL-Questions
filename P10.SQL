CREATE TABLE P10 (IntegerValue INT);

INSERT INTO
	P10
VALUES
(5),
(6),
(10),
(10),
(13),
	(14),
(17),
(20),
(81),
(90),
(76);

SELECT
	'MEAN' [CENTRAL TENDENCY],
	AVG(INTEGERVALUE) VALUE
FROM
	P10
UNION
SELECT
	'MEDIAN',
	NUM
FROM
	(
		SELECT
			INTEGERVALUE NUM,
			ROW_NUMBER() OVER(
				ORDER BY
					INTEGERVALUE
			) RNO
		FROM
			P10
	) T
WHERE
	T.RNO = (
		(
			SELECT
				(COUNT(*) + 1) / 2
			FROM
				P10
		)
	)
UNION
SELECT
	'MODE',
	NUM
FROM
	(
		SELECT
			INTEGERVALUE NUM,
			COUNT(*) [COUNT]
		FROM
			P10
		GROUP BY
			IntegerValue
	) K
WHERE
	K.COUNT = (
		SELECT
			DISTINCT TOP 1 [COUNT]
		FROM
(
				SELECT
					INTEGERVALUE NUM,
					COUNT(*) [COUNT]
				FROM
					P10
				GROUP BY
					IntegerValue
			) Z
		ORDER BY
			[COUNT] DESC
	)
UNION
SELECT
	'RANGE',
	NUM
FROM
	(
		SELECT
			MAX(INTEGERVALUE) - MIN(INTEGERVALUE) NUM
		FROM
			P10
	) K