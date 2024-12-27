-- *********************************
-- W11 STUDENT SQL WORKBOOK
-- Chapter 8 questions
-- *********************************

/*
  ORDER OF OPERATION (The way we write our queries):
     SELECT     column_name AS 'Alias1'
     ,          Function(column_name_2) AS 'Alias2'
     FROM       table1 t1   -- t1 and t2 are table aliases
       JOIN       table2 t2   -- join types: INNER, LEFT, RIGHT
       ON         t1.table1_id = t2.table1_id -- PK and FK might not always be the same name
     WHERE      column_name = condition (Cannot contain an aggregate function)
     GROUP BY   column_name (Must be a column in the SELECT clause that is NOT in an aggregate function)
     HAVING     aggregate_function(column_name) = group condition
     ORDER BY   column_name (DESC)
     LIMIT      # of rows;
     To remember this: Stay Firm (JOINED) With God, Honoring Our Lord
*/

/*
  ORDER OF EXECUTION (The way the code actually runs):
    FROM       table1 t1   
      JOIN       table2 t2  
      ON         t1.table1_id = t2.table1_id
    WHERE      column_name = condition
    GROUP BY   column_name 
    HAVING     aggregate_function(column_name) = group condition
    SELECT     column_name AS 'Alias1'
    ,          Function(column_name_2) AS 'Alias2'
    ORDER BY   column_name (DESC)
    LIMIT      # of rows;
    To remember this: For with God, He sends out love
*/

/*
  Common Aggregate Functions:
  COUNT()
  SUM()
  AVG()
  MAX()
  MIN()
*/


USE sakila;

-- --------------------------------------------------------------------------
-- 1. Construct a query that counts the number of rows in the payment table.
-- +----------------+
-- | Number of Rows |
-- +----------------+
-- |          16044 |
-- +----------------+
-- 1 row in set (0.00 sec)
-- --------------------------------------------------------------------------


-- --------------------------------------------------------------------------
-- 2. Modify your query from Exercise 11-1 
-- to count the number of payments made by each customer. 
-- Show the customer_id and the total amount paid for each customer.
-- Assign Aliases to them.
-- +-------------+----------+-------------+
-- | customer_id | COUNT(*) | SUM(amount) |
-- +-------------+----------+-------------+
-- |           1 |       32 |      118.68 |
-- |           2 |       27 |      128.73 |
-- |           3 |       26 |      135.74 |
-- |           4 |       22 |       81.78 |
-- |           5 |       38 |      144.62 |
-- |           6 |       28 |       93.72 |
-- ...
-- |         594 |       27 |      130.73 |
-- |         595 |       30 |      117.70 |
-- |         596 |       28 |       96.72 |
-- |         597 |       25 |       99.75 |
-- |         598 |       22 |       83.78 |
-- |         599 |       19 |       83.81 |
-- +-------------+----------+-------------+
-- 599 rows in set (0.02 sec)
-- --------------------------------------------------------------------------


-- --------------------------------------------------------------------------
-- 3. Modify your query from Exercise 11-2 to include 
-- only those customers who have at least 40 payments.
-- +-------------+----------+-------------+
-- | customer_id | COUNT(*) | SUM(amount) |
-- +-------------+----------+-------------+
-- |          75 |       41 |      155.59 |
-- |         144 |       42 |      195.58 |
-- |         148 |       46 |      216.54 |
-- |         197 |       40 |      154.60 |
-- |         236 |       42 |      175.58 |
-- |         469 |       40 |      177.60 |
-- |         526 |       45 |      221.55 |
-- +-------------+----------+-------------+
-- 7 rows in set (0.04 sec)
-- --------------------------------------------------------------------------


-- --------------------------------------------------------------------------
-- 4. Construct a query that displays the following results 
-- from a query against the film, film_actor, and actor tables 
-- where the film's rating is either 'G', 'PG', or 'PG-13' 
-- with a row count between 9 and 12 rows.
-- Order the results by ascending order of title.
-- +------------------------+--------+----------+
-- | title                  | rating | COUNT(*) |
-- +------------------------+--------+----------+
-- | ACADEMY DINOSAUR       | PG     |       10 |
-- | ALABAMA DEVIL          | PG-13  |        9 |
-- | ANGELS LIFE            | G      |        9 |
-- | ATLANTIS CAUSE         | G      |        9 |
-- | BERETS AGENT           | PG-13  |       10 |
-- | BONNIE HOLOCAUST       | G      |        9 |
-- | BORN SPINAL            | PG     |        9 |
-- | CHINATOWN GLADIATOR    | PG     |       10 |
-- ...
-- | TELEMARK HEARTBREAKERS | PG-13  |       11 |
-- | TOMATOES HELLFIGHTERS  | PG     |        9 |
-- | WAIT CIDER             | PG-13  |        9 |
-- | WAR NOTTING            | G      |        9 |
-- | WEDDING APOLLO         | PG     |       10 |
-- | WEST LION              | G      |        9 |
-- | WIZARD COLDBLOODED     | PG     |        9 |
-- | WRONG BEHAVIOR         | PG-13  |        9 |
-- +------------------------+--------+----------+
-- 61 rows in set (0.03 sec)
-- --------------------------------------------------------------------------


-- --------------------------------------------------------------------------
-- 5. Construct a query that displays the following results 
-- from a query against the film, inventory, rental, and customer tables 
-- where the film's title starts with 'C' and 
-- the film has been rented at least twice. 
-- Order the results by ascending order of title.
-- +------------------------+--------+----------+
-- | title                  | rating | COUNT(*) |
-- +------------------------+--------+----------+
-- | CABIN FLASH            | NC-17  |       15 |
-- | CADDYSHACK JEDI        | NC-17  |       16 |
-- | CALENDAR GUNFIGHT      | NC-17  |       21 |
-- | CALIFORNIA BIRDS       | NC-17  |       12 |
-- ...
-- | CRUSADE HONEY          | R      |        8 |
-- | CUPBOARD SINNERS       | R      |       23 |
-- | CURTAIN VIDEOTAPE      | PG-13  |       27 |
-- | CYCLONE FAMILY         | PG     |       15 |
-- +------------------------+--------+----------+
-- 85 rows in set (0.04 sec)
-- --------------------------------------------------------------------------
