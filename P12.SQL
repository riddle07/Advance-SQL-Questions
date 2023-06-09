CREATE TABLE P12 (
	WORKFLOW VARCHAR(255),
	[EXECUTION DATE] DATE
)
INSERT INTO
	P12
VALUES
	('ALPHA', '6/1/2018'),
	('ALPHA', '6/14/2018'),
	('ALPHA', '6/15/2018'),
	('BRAVO', '6/1/2018'),
('BRAVO', '6/2/2018'),
('BRAVO', '6/19/2018'),
('CHARLIE', '6/1/2018'),
	('CHARLIE', '6/15/2018'),
	('CHARLIE', '6/30/2018')

SELECT WORKFLOW, -1*DATEDIFF(DAY, MAX([EXECUTION DATE]),MIN([EXECUTION DATE]))/(COUNT(*)-1) [AVERAGE DAYS] FROM P12 GROUP BY WORKFLOW
