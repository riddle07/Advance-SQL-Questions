CREATE TABLE P23([PLAYER ID] INT, SCORE INT);

INSERT INTO
	P23
VALUES
	(1001, 2343),
	(2002, 9432),
	(3003, 6548),
	(4004, 1054),
	(5005, 6832)
SELECT
	QUARTILE,
	[PLAYER ID],
	SCORE
FROM
	(
		SELECT
			CASE
				WHEN RNK <= (
					SELECT
						(COUNT(*) + 1) / 2
					FROM
						P23
				) THEN 1
				ELSE 2
			END AS QUARTILE,
			[PLAYER ID],
			SCORE
		FROM
			(
				SELECT
					[PLAYER ID],
					SCORE,
					ROW_NUMBER() OVER (
						ORDER BY
							SCORE DESC
					) RNK
				FROM
					P23
			) T
	) K
ORDER BY
	QUARTILE,
	[PLAYER ID]