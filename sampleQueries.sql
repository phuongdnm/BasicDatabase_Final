USE Bookstore;

-- question 1:
SELECT title, stock_quantity
FROM Books
    WHERE stock_quantity < 50;

-- question 2:
SELECT
    DATE_FORMAT(date, '%W') AS "Day Of The Week",
    total_amount
FROM order_history
GROUP BY DATE_FORMAT(date, '%W')
ORDER BY total_amount DESC;

-- question 3:
SELECT DAYOFMONTH(date) AS "Date Of The Month",
    total_amount
FROM order_history
GROUP BY DAYOFMONTH(date)
ORDER BY total_amount DESC;

-- question 4:
SELECT title, rating
FROM Books
JOIN Ratings
    ON Books.id = Ratings.book_id
ORDER BY Ratings.rating DESC LIMIT 7;

-- question 5:
SELECT 
	CONCAT(first_name, ' ' , last_name) AS "Author Name",
	COUNT(title) as amt
FROM Books
JOIN Authors
 	ON Books.author_id = Authors.id
GROUP BY Authors.id
ORDER BY amt DESC LIMIT 1;

SELECT 
    CONCAT(first_name,' ', last_name) AS "Author Name",
    rating,
    title
FROM Books
JOIN Ratings
    ON Books.id = Ratings.book_id
JOIN Authors
    ON Authors.id = Books.author_id
ORDER BY Ratings.rating DESC LIMIT 4;

-- question 6:
SELECT 
    full_name,
    SUM(total_amount) AS "Total amount spent"
FROM order_history
GROUP BY full_name
ORDER BY SUM(total_amount) DESC LIMIT 5;

