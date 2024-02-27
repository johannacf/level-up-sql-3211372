-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

-- Need the Customers and Orders table
-- Generate a list of number of orders, first and last name, and email address

SELECT CustomerID, COUNT(OrderID) AS NumberOfOrders FROM Orders
GROUP BY CustomerID
ORDER BY NumberOfOrders DESC;
-- Note to self: I needed a refresher on GROUP BY to solve this
-- Also: HAVING instead of WHERE when using agg functions like COUNT

-- Take the above query to join with Customers table
SELECT C.FirstName, C.LastName, C.Email, 
  O.CustomerID, COUNT(O.OrderID) AS NumberOfOrders 
  FROM Orders AS O
INNER JOIN Customers AS C ON O.CustomerID = C.CustomerID
GROUP BY O.CustomerID
ORDER BY NumberOfOrders DESC;

-- prof's solution included LIMIT (to define criteria for "most often" orders):
-- I will update my above answer to include a limit:
SELECT C.FirstName, C.LastName, C.Email, 
  O.CustomerID, COUNT(O.OrderID) AS NumberOfOrders 
  FROM Orders AS O
INNER JOIN Customers AS C ON O.CustomerID = C.CustomerID
GROUP BY O.CustomerID
ORDER BY NumberOfOrders DESC
LIMIT 7;
 -- He runs through the queries with different set limits
 -- to see where a natural delineation lies;
 -- for example, both rank #11 and #12 ordered a total of 14 orders,
 -- so it doesn't seem fair for 11 to be the limit.
 -- He decides on LIMIT 6, since the difference between rank #6 and #7
 -- is 15 and 14 orders, respectively.

 -- In my opinion, it makes more sense from a business perspective to decide
 -- the number of orders a customer has to make in order to qualify
 -- for promotional perks. Therefore, I believe it makes more sense
 -- to structure the query where the number of orders placed is the criteria,
 -- i.e., using HAVING instead of LIMIT.
 -- I will update my query as such below (with 15 orders as criteria):
 SELECT C.FirstName, C.LastName, C.Email, 
  O.CustomerID, COUNT(O.OrderID) AS NumberOfOrders 
  FROM Orders AS O
INNER JOIN Customers AS C ON O.CustomerID = C.CustomerID
GROUP BY O.CustomerID
HAVING NumberOfOrders >= 15
ORDER BY NumberOfOrders DESC;