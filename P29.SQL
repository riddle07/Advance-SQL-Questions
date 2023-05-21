CREATE TABLE P29([STEP NUMBER] INT, STATUS VARCHAR(255));

INSERT INTO
	P29
VALUES
	(1, 'P'),
	(2, 'P'),
	(3, 'P'),
	(4, 'P'),
	(5, 'F'),
	(6, 'F'),
	(7, 'F'),
	(8, 'F'),
	(9, 'F'),
	(10, 'P'),
	(11, 'P'),
	(12, 'P');

SELECT
	[MIN STEP NUMBER],
	[MAX STEP NUMBER],
	STATUS,
	[CONSECUTIVE COUNT]
FROM
	(
		SELECT
			DIFF,
			STATUS,
			COUNT(*) [CONSECUTIVE COUNT],
			MIN([STEP NUMBER]) [MIN STEP NUMBER],
			MAX([STEP NUMBER]) [MAX STEP NUMBER]
		FROM
			(
				SELECT
					[STEP NUMBER],
					STATUS,
					[STEP NUMBER] - RANK() OVER(
						PARTITION BY [STATUS]
						ORDER BY
							[STEP NUMBER]
					) DIFF
				FROM
					P29
			) T
		GROUP BY
			DIFF,
			STATUS
	) K
ORDER BY
	[MIN STEP NUMBER]
