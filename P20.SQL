CREATE TABLE P20(
	[PRODUCT ID] INT,
	[EFFECTIVE DATE] DATE,
	[UNIT PRICE] MONEY
);



INSERT INTO
	P20
VALUES
(1001, '1/1/2018', $ 1.99),
(1001, '4/5/2018', $ 2.99),
(1001, '6/8/2015', $ 3.99),
	(2002, '4/17/2018', $ 1.99),
(2002, '5/19/2018', $ 2.99)
SELECT
	DISTINCT [PRODUCT ID],
	FIRST_VALUE([EFFECTIVE DATE]) OVER(
		PARTITION BY [PRODUCT ID]
		ORDER BY
			[EFFECTIVE DATE]
	) [EFFECTIVE DATE],
	FIRST_VALUE([UNIT PRICE]) OVER(
		PARTITION BY [PRODUCT ID]
		ORDER BY
			[EFFECTIVE DATE]
	) [ORDER DATE]
FROM
	P20;