# select author_lname,title, released_year,
#      CASE
#        WHEN released_year >= 2000  THEN 'Contemporary Literature'
#        ELSE 'Classic Litrature'
#      END AS GENRE
#      FROM books;

# I don't care about the format for now     
# select author_lname, pages, 
# CASE 
#     WHEN pages BETWEEN 180 AND 300 THEN concat_ws(' ',author_lname, 'wrote a middium length book.') 
#     WHEN pages>300 THEN concat_ws(' ',author_lname, 'wrote a long book.')
#     ELSE concat_ws(' ', author_lname, 'wrote a short novel.') 
#     END AS 'author last name vs book length' 
#     FROM books;     
    
#     SELECT title, author_lname,
#             CASE
#                 WHEN title like '%stories%' OR title like '%story%' THEN 'Short stories'
#                 WHEN title like '%Just kids%' OR title like '%Heartbreaking%' THEN 'Memoir'
#                 ELSE 'Novel'
#             END AS TYPE
#             from books;
     
    SELECT  first_name,
            last_name, 
            SUM(amount) as 'tot. amnt spent',
            COUNT(*) as 'number of orders' 
    FROM customers 
    JOIN orders 
            ON customers.id = orders.customer_id
    GROUP BY customer_id
    ORDER BY 4 DESC;
    
# Now things getting a bit more complicated I need to start caring about formatting the queries.    
# SELECT CONCAT_WS(' ',first_name,last_name,'is the top spending customer with', SUM(amount),'dollars spent on' , COUNT( *),'orders')
# FROM customers 
#     JOIN orders 
#         ON customers.id = orders.customer_id 
# GROUP BY customer_id 
# ORDER BY SUM(amount) 
# DESC 
# LIMIT 1;



SELECT customers.first_name,customers.last_name, customers.email, orders.amount,
     CASE
         WHEN orders.amount IS NOT NULL THEN CONCAT_WS(' ', 'Dear', first_name, last_name, ', thank you for your last order on', order_date,'.')
         ELSE CONCAT_WS(' ', 'Dear', first_name, last_name, ', you have yet to make an order. What the hell are you waiting for?') 
     END AS 'customer appreciation day email draft'
FROM customers
    RIGHT JOIN orders
          ON customers.id = orders.customer_id;

# MAKE ABOVE ONE FANCIER BY SELECTING ONLY THE LAST ORDER DATES
# SELECT customers.first_name,customers.last_name, customers.email, orders.amount,MAX(orders.order_date),
#      CASE
#          WHEN orders.amount IS NOT NULL THEN CONCAT_WS(' ', 'Dear', first_name, last_name, ', thank you for your last order on', MAX(orders.order_date),'.')
#          ELSE CONCAT_WS(' ', 'Dear', first_name, last_name, ', you have yet to make an order. What the hell are you waiting for?') 
#      END AS 'customer appreciation day email draft'
# FROM customers
#     RIGHT JOIN orders
#           ON customers.id = orders.customer_id
#           GROUP BY customer_id
#           ORDER BY MAX(orders.order_date);






# SELECT customers.first_name,customers.last_name, customers.email, IFNULL(orders.amount,0) AS tot_spent,
#      CASE
#          WHEN orders.amount  IS NOT NULL THEN CONCAT_WS(' ','From: ShirtRUs Ltd., Marketing Dept.\n', 'To:',customers.email,'\n',  'Dear', first_name, last_name, ', thank you for your last order on', order_date,'.')
#          ELSE CONCAT_WS(' ','From: ShirtRUs Ltd., Marketing Dept.\n', 'To:',customers.email,'\n', 'Dear', first_name, last_name, ', We have a hot offering for the boxing week. Use the coupon code BOXINGWEEK.') 
#      END AS 'customer appreciation day email draft'
# FROM customers
#     LEFT JOIN orders
#           ON customers.id = orders.customer_id
          
# LIMIT 1;          
     
     
     
     
# SELECT 
#      CASE
#          WHEN orders.amount  IS NOT NULL THEN CONCAT_WS(' ', 'To:',customers.email,'\n',  'Dear', first_name, last_name, ', thank you for your last order on', order_date,'. Customer services, ShirtsRUs Ltd.')
#          ELSE CONCAT_WS(' ', 'To:',customers.email,'\n', 'Dear', first_name, last_name, ', We have a hot offering for the boxing week. Use the coupon code BOXINGWEEK. Customer services, ShirtsRUs Ltd.') 
#      END AS 'customer appreciation day email draft'
# FROM customers
#     LEFT JOIN orders
#           ON customers.id = orders.customer_id;
         
         
# CREATE TABLE  students( 
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     first_name VARCHAR(255)
# );

# CREATE TABLE papers(
#         title VARCHAR(255),
#         grade DECIMAL(5,2),
#         student_id INT,
#         FOREIGN KEY(student_id) 
#             REFERENCES students(id)
#         ON DELETE CASCADE
# );
 
# SELECT students.first_name, papers.title, papers.grade
# FROM students
# JOIN papers
#      ON papers.student_id = students.id
# ORDER BY grade 
# DESC;


# SELECT students.first_name, papers.title,  papers.grade
# FROM students
#    LEFT JOIN papers
#      ON papers.student_id = students.id;
   
 
# SELECT  students.first_name, papers.title,  IFNULL(papers.grade,0)
# FROM students
#    LEFT JOIN papers
#      ON papers.student_id = students.id;
 
 
# SELECT  students.first_name, AVG(IFNULL(papers.grade,0)) AS 'AVERAGE MARK'
# FROM students
#    LEFT JOIN papers
#          ON papers.student_id = students.id
# GROUP BY  id ORDER BY 2 DESC;         
 
 
 
# SELECT  students.first_name, AVG(IFNULL(papers.grade,0)) AS AVG_MARK,
# CASE 
#     WHEN AVG(IFNULL(papers.grade,0)) > 67.5 THEN 'PASSING'
#     ELSE 'FAILING'
# END AS passing_status
# FROM students
#    LEFT JOIN papers
#          ON papers.student_id = students.id

# GROUP BY  id ORDER BY 2 DESC;   


# SELECT customers.first_name,customers.last_name, customers.email, IFNULL(orders.amount,0) AS tot_spent,
#      CASE
#          WHEN orders.amount  IS NOT NULL THEN CONCAT_WS(' ','From: ShirtRUs Ltd., Marketing Dept.\n', 'To:',customers.email,'\n',  'Dear', first_name, last_name, ', thank you for your last order on', order_date,'.')
#          ELSE CONCAT_WS(' ','From: ShirtRUs Ltd., Marketing Dept.\n', 'To:',customers.email,'\n', 'Dear', first_name, last_name, ', We have a hot offering for the boxing week. Use the coupon code BOXINGWEEK.') 
#      END AS 'customer appreciation day email draft'
# FROM customers
#     LEFT JOIN orders
#           ON customers.id = orders.customer_id
          
# LIMIT 1;         
 
          
          
## create tables for database tv_reviews_app
-- the schema will have reviewers, series and review tables

# CREATE TABLE reviewers (
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     first_name VARCHAR(100),
#     last_name VARCHAR(100)
# );

# CREATE TABLE series (
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     title VARCHAR(100),
#     released_year YEAR(4),
#     genre VARCHAR(100)
# );

# CREATE TABLE reviews(
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     rating DECIMAL(2,1),
#     series_id INT,
#     reviewer_id INT,
#     FOREIGN KEY(series_id) REFERENCES series(id) ON DELETE CASCADE,
#     FOREIGN KEY(reviewer_id) REFERENCES reviewers(id) ON DELETE CASCADE
# );


# SELECT * FROM series
# JOIN reviews
#     ON reviews.series_id = series.id
# LIMIT 10;

# -- Expect NULL in this table since there must be series without rviews
# SELECT * FROM series
# LEFT JOIN reviews
#    ON reviews.series_id = series.id;


# -- Expect NO NULL in this table since ALL reviews HAVE series
# SELECT * FROM series
# RIGHT JOIN reviews
#    ON reviews.series_id = series.id;


# -- Avg ratings of series
SELECT series.title, AVG(reviews.rating) AS avg_rating FROM series
RIGHT JOIN reviews
   ON reviews.series_id = series.id
GROUP BY series.id
ORDER BY 2 ; 

-- Did he just ORDER BY an aliase? Ok. He did and it works. It's just functions like AVG 
-- that don't work with aliases
SELECT series.title, AVG(reviews.rating) AS avg_rating FROM series
RIGHT JOIN reviews
   ON reviews.series_id = series.id
GROUP BY series.id
ORDER BY  avg_rating ; 

-- first time using the reviewers table
SELECT reviewers.first_name, reviewers.last_name, reviews.rating FROM reviewers
JOIN reviews
ON reviewers.id = reviews.reviewer_id
ORDER BY  reviewers.last_name DESC, reviewers.first_name DESC;

-- Expect NULL since a reviewer may not have actually reviewed anything yet
SELECT reviewers.first_name, reviewers.last_name, reviews.rating FROM reviewers
LEFT JOIN reviews
    ON reviewers.id = reviews.reviewer_id
ORDER BY  reviewers.last_name desc, reviewers.first_name;

# Challenge: Identify series not rated yet
-- SOLN. EXPECT NULL if above is the case
SELECT series.title as  'Series with no reviews', reviews.rating FROM series
LEFT JOIN reviews
    ON reviews.series_id = series.id
WHERE reviews.rating IS NULL;    

-- Challenge: get a table of genre and avg ratings
-- For this we need reviews and series  tables
SELECT series.genre, ROUND(AVG(reviews.rating), 2) as avg_rating FROM series
JOIN reviews
    ON series.id = reviews.series_id
GROUP BY 1;

/*
Challenge: Analytics of reviewers. Show first and last name, 
number of reviews, min, max and avg ratings, and status of reviewer
For this we will need: reviews table for sure,
and reviewers table too. At least.
-- Status is determined based on at least 1 review given is active. Else inactive.
*/
SELECT reviewers.first_name, 
       reviewers.last_name,
       COUNT(reviews.rating) AS COUNT,
       ROUND(MIN(IFNULL(reviews.rating,0)),2) AS MIN,
       ROUND(MAX(IFNULL(reviews.rating,0)),2) AS MAX,
       ROUND(AVG(IFNULL(reviews.rating,0)),2) AS AVG,
CASE
    WHEN COUNT(reviews.rating) = 0 THEN 'INACTIVE' 
    ELSE 'ACTIVE' 
END AS 'STATUS'  
FROM reviewers       
LEFT JOIN reviews
    ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;



# MAKE IT MORE COMPLEX
SELECT reviewers.first_name, 
       reviewers.last_name,
       COUNT(reviews.rating) AS COUNT,
       ROUND(MIN(IFNULL(reviews.rating,0)),2) AS MIN,
       ROUND(MAX(IFNULL(reviews.rating,0)),2) AS MAX,
       ROUND(AVG(IFNULL(reviews.rating,0)),2) AS AVG,
CASE
    WHEN COUNT(reviews.rating) = 0 THEN 'INACTIVE' 
    ELSE 'ACTIVE' 
END AS 'STATUS',
CASE
    WHEN AVG(IFNULL(reviews.rating,0))>8 THEN 'FAIR CRITIQUE' 
    WHEN AVG(IFNULL(reviews.rating,0))<8 AND COUNT(reviews.rating) != 0  THEN 'HARSH CRITIQUE'
    ELSE  'NOT A CRITIQUE'
    END AS 'Rviewer Class'
FROM reviewers       
LEFT JOIN reviews
    ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;




# MAKE IT MORE COMPLEX use IF instead of CASE
SELECT reviewers.first_name, 
       reviewers.last_name,
       COUNT(reviews.rating) AS COUNT,
       ROUND(MIN(IFNULL(reviews.rating,0)),2) AS MIN,
       ROUND(MAX(IFNULL(reviews.rating,0)),2) AS MAX,
       ROUND(AVG(IFNULL(reviews.rating,0)),2) AS AVG,
       IF (COUNT(reviews.rating) = 0 , 'INACTIVE','ACTIVE') AS 'STATUS'
FROM reviewers       
LEFT JOIN reviews
    ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;


# MAKE IT MORE COMPLEX use IF instead of CASE + ADD CRITIQUE TYPES
SELECT reviewers.first_name, 
       reviewers.last_name,
       COUNT(reviews.rating) AS COUNT,
       ROUND(MIN(IFNULL(reviews.rating,0)),2) AS MIN,
       ROUND(MAX(IFNULL(reviews.rating,0)),2) AS MAX,
       ROUND(AVG(IFNULL(reviews.rating,0)),2) AS AVG,
       IF (COUNT(reviews.rating) = 0 , 'INACTIVE','ACTIVE') AS STATUS,
       IF (IFNULL(AVG(reviews.rating),0) >8 , 'FAIR CRITIQUE','HARSH CRITIQUE') AS 'Rviewer Class'
FROM reviewers       
LEFT JOIN reviews
    ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;


-- Challenge: Get a table with series title, rating and reviewers first and last last_name
-- Appears we need all the three tables
-- Start simple
SELECT series.title, reviews.rating, 
    CONCAT_WS(' ', reviewers.first_name, reviewers.last_name) as reviewer
FROM series
JOIN reviews
    ON series.id = reviews.series_id
JOIN reviewers
    ON reviews.reviewer_id = reviewers.id
ORDER BY series.title;


