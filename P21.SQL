CREATE TABLE P21(
	[ORDER ID] INT,
	[CUSTOMER ID] INT,
	[ORDER DATE] DATE,
	[AMOUNT] MONEY,
	[STATE] VARCHAR(255)
);

INSERT INTO
	P21
VALUES
(1, 1001, '1/1/2018', $ 5100, 'TX'),
	(2, 1001, '1/1/2018', $ 150, 'TX'),
	(3, 1001, '1/1/2018', $ 75, 'TX'),
	(4, 1001, '2/1/2018', $ 100, 'TX'),
	(5, 1001, '3/1/2018', $ 100, 'TX'),
	(6, 2002, '2/1/2018', $ 75, 'TX'),
	(7, 2002, '2/1/2018', $ 150, 'TX');

SELECT
	DISTINCT [STATE]
FROM
	P21
WHERE
	[STATE] NOT IN (
		SELECT
			[STATE]
		FROM
			(
				SELECT
					[STATE],
					[CUSTOMER ID],
					AVG(AMOUNT) [AVG]
				FROM
					P21
				GROUP BY
					[STATE],
					[CUSTOMER ID]
				HAVING
					AVG(AMOUNT) < 100
			) T
	)