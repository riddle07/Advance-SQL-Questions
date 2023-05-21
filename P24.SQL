CREATE TABLE P24(
	[ORDER ID] VARCHAR(255),
	[CUSTOMER ID] INT,
	[ORDER DATE] DATE,
	AMOUNT MONEY,
	[STATE] VARCHAR(255)
)
INSERT INTO
	P24
VALUES
	('AAA', 1001, '1/1/2018', $ 100, 'TX'),
	('BBB', 3003, '1/1/2018', $ 100, 'IA'),
	('CCC', 1001, '3/1/2018', $ 100, 'TX'),
	('EEE', 1001, '2/1/2018', $ 100, 'TX'),
	('EEE', 1001, '2/1/2018', $ 100, 'TX'),
	('EEE', 1001, '2/1/2018', $ 100, 'TX'),
	('EEE', 1001, '2/1/2018', $ 100, 'TX'),
	('EEE', 1001, '2/1/2018', $ 100, 'TX'),
	('EEE', 1001, '2/1/2018', $ 100, 'TX'),
	('EEE', 1001, '2/1/2018', $ 100, 'TX'),
	('EEE', 1001, '2/1/2018', $ 100, 'TX')
SELECT
	[ORDER ID],
	[CUSTOMER ID],
	[ORDER DATE],
	AMOUNT,
	[STATE]
FROM
	(
		SELECT
			*,
			ROW_NUMBER() OVER(
				ORDER BY
					[ORDER ID]
			) RNK
		FROM
			P24
	) T
WHERE
	T.RNK >= 5
	AND T.RNK <= 10