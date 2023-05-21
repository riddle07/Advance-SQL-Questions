CREATE TABLE P4 (
	[CUSTOMER ID] INT,
	[ORDER ID] INT,
	[DELIVERY STATE] VARCHAR(250),
	AMOUNT MONEY
	)

INSERT INTO P4
VALUES (
	1001,
	1,
	'CA',
	$ 340
	),
	(
	1001,
	2,
	'TX',
	$ 950
	),
	(
	1001,
	3,
	'TX',
	$ 670
	),
	(
	1001,
	4,
	'TX',
	$ 860
	),
	(
	2002,
	5,
	'WA',
	$ 320
	),
	(
	3003,
	6,
	'CA',
	$ 650
	),
	(
	3003,
	7,
	'CA',
	$ 830
	),
	(
	4004,
	8,
	'TX',
	$ 120
	)

SELECT [CUSTOMER ID],
	[ORDER ID],
	[DELIVERY STATE],
	'$' + CAST(ROUND(AMOUNT, 0) AS VARCHAR(250)) AS AMOUNT
FROM P4
WHERE [DELIVERY STATE] = 'TX'
	AND [CUSTOMER ID] IN (
		SELECT [CUSTOMER ID]
		FROM P4
		WHERE [DELIVERY STATE] = 'CA'
		);
