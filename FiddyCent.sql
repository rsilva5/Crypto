--1 Let’s start by checking out the whole transactions table:
 SELECT *
 FROM transactions;
 -- The column names are id, user_id, date, currency, money_in, money_out

-- 2 The money_in column records the amount (in USD) the user bought.What is the total money_in in the table?
 SELECT SUM(money_in)
 FROM transactions;
-- The total money_in is 17,173

-- 3 The money_out column records the amount (in USD) the user sold. What is the total money_out in the table?
SELECT SUM(money_out)
FROM transactions; 
-- The total money_out is 33,417

-- 4 It was reported that Bitcoin dominates Fiddy Cent’s exchange. Let’s see if it is true within these dates by answering two questions:
-- How many money_in transactions are in this table?
-- How many money_in transactions are in this table where ‘BIT’ is the currency?

SELECT COUNT(money_in)
FROM transactions;
-- The total money_in transactions in this table are 43. 
SELECT currency, COUNT(money_in)
FROM transactions 
WHERE currency = 'BIT';
-- There are 21 money_in transactions in this table where 'BIT' is the currency. 

-- 5 What was the largest transaction in this whole table? Was it money_in or money_out?
SELECT MAX(money_in), MAX(money_out)
FROM transactions; 
-- The biggest transaction was money_out with 15,047. 

-- 6 What is the average money_in in the table for the currency Ethereum (‘ETH’)?
SELECT AVG(money_in), currency
FROM transactions
WHERE currency = 'ETH';
-- The AVG money_in for the currency ETH is 131.889

-- 7 Let’s build a ledger for the different dates.Select date, average money_in, and average money_out from the table.And group everything by date.
SELECT date, AVG(money_in), AVG(money_out)
FROM transactions
GROUP BY date;

-- 8 To make the previous query easier to read, round the averages to 2 decimal places.Give the column aliases using AS for readability.
SELECT date, 
  ROUND(AVG(money_in),2) AS 'Average Buy',  
  ROUND(AVG(money_out),2) AS 'Average Sell'
FROM transactions
GROUP BY date;
