SELECT	card_name,
		date,
		EXTRACT(month FROM date) AS month,
		price,
		COALESCE(LEAD(price) OVER  date_fil, price) AS price_after,
		COALESCE(price - LEAD(price) OVER date_fil, 0) AS price_diff
FROM gpu
WHERE card_name = 'TUF Gaming GeForce RTX 3070 TI 8GB'
WINDOW date_fil AS (ORDER BY date);



/* 
date filters:
 		DATE_TRUNC('month', date) AS month_filter,
		date + INTERVAL '15 days' AS "half month",
*/