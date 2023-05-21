CREATE TABLE P27 (I INT);

INSERT INTO
	P27
VALUES
	(1),
(1),
(2),
(3),
(3),
(4);

SELECT
	I
FROM
	(
		SELECT
			*,
			ROW_NUMBER() OVER (
				ORDER BY
					I
			) RNK
		FROM
			P27
	) T
WHERE
	T.RNK > 1