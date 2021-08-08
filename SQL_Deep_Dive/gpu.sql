SELECT	*
FROM gpu;

INSERT INTO gpu VALUES (7, 'TUF Gaming GeForce RTX 3070 TI 8GB', 'Asus', '2021-07-01', 1149);

INSERT INTO gpu VALUES(8, 'TUF Gaming GeForce RTX 3070 TI 8GB GDDR6X OC Edition', 'Asus', '2021-07-01', 1099);

INSERT INTO gpu VALUES(9, 'ROG STRIX GeForce RTX 3080 Gaming 10GB OC Edition', 'Asus', '2021-07-01', 1699);
INSERT INTO gpu VALUES(10, 'TUF Gaming GeForce RTX 3070 8GB GDDR6 OC Edition', 'Asus', '2021-07-01', 1049);
INSERT INTO gpu VALUES(11, 'TUF Gaming GeForce RTX 3080 OC Edition 10GB', 'Asus', '2021-07-01', 1499);
INSERT INTO gpu VALUES(12, 'ROG Strix GeForce RTX 3070 TI 8GB GDDR6X OC Edition', 'Asus', '2021-07-01', 1199);

INSERT INTO gpu VALUES (13, 'TUF Gaming GeForce RTX 3070 TI 8GB', 'Asus', '2021-07-01', 949);

INSERT INTO gpu VALUES(14, 'TUF Gaming GeForce RTX 3070 TI 8GB GDDR6X OC Edition', 'Asus', '2021-07-01', 969);

INSERT INTO gpu VALUES(15, 'ROG STRIX GeForce RTX 3080 Gaming 10GB OC Edition', 'Asus', '2021-07-01', 1599);
INSERT INTO gpu VALUES(16, 'TUF Gaming GeForce RTX 3070 8GB GDDR6 OC Edition', 'Asus', '2021-07-01', 1049);
INSERT INTO gpu VALUES(17, 'TUF Gaming GeForce RTX 3080 OC Edition 10GB', 'Asus', '2021-07-01', 1499);
INSERT INTO gpu VALUES(18, 'ROG Strix GeForce RTX 3070 TI 8GB GDDR6X OC Edition', 'Asus', '2021-07-01', 999);

SELECT *
FROM gpu
WHERE card_name = 'ROG Strix GeForce RTX 3070 TI 8GB GDDR6X OC Edition'
ORDER BY date;


UPDATE gpu
SET date = '2021-08-01' 
WHERE id IN (13, 14, 15, 16, 17, 18);



UPDATE gpu
SET price = 1099
WHERE id = 8;


-- Price diff
SELECT 	*,
		LAG(price) OVER price_diff AS lag,
		LEAD(price) OVER price_diff AS lead
FROM gpu
WHERE card_name = 'TUF Gaming GeForce RTX 3070 TI 8GB GDDR6X OC Edition'
WINDOW price_diff AS (ORDER BY date);
