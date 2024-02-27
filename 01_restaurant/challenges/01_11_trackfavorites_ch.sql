-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.

SELECT DishID FROM Dishes
WHERE Name = 'Quinoa Salmon Salad';
-- 9 = DishID

SELECT CustomerID FROM Customers
WHERE FirstName = 'Cleo' AND
LastName = 'Goldwater';
-- 42 = CustomerID

UPDATE Customers 
SET FavoriteDish = 9 
WHERE CustomerID = 42;

-- check that worked below:
SELECT * FROM Customers
WHERE CustomerID = 42;