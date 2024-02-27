-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

SELECT * FROM Customers 
WHERE FirstName = 'Loretta' AND LastName = 'Hundey'

-- customerid = 70

SELECT * FROM Orders
SELECT * FROM OrdersDishes
SELECT * FROM Dishes

INSERT INTO Orders (CustomerID, OrderDate)
VALUES (70, '2022-09-20 14:00:00');

SELECT * FROM Orders
WHERE CustomerID = 70
ORDER BY OrderDate DESC;

-- orderID = 1001

INSERT INTO OrdersDishes (OrderID, DishID)
VALUES (1001, (SELECT DishID FROM Dishes WHERE Name = 'House Salad')),
(1001, (SELECT DishID FROM Dishes WHERE Name = 'Mini Cheeseburgers')),
(1001, (SELECT DishID FROM Dishes WHERE Name = 'Tropical Blue Smoothie'));

SELECT SUM(D.Price) AS OrderTotal
FROM Dishes AS D
INNER JOIN OrdersDishes AS OD ON OD.DishID = D.DishID
WHERE OD.OrderID = 1001;
