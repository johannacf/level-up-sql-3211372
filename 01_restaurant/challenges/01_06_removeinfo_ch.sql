-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.

SELECT CustomerID, FirstName from Customers
WHERE FirstName LIKE 'norby';
-- 64 is Norby's CustomerID

DELETE FROM Reservations
WHERE CustomerID = 64;
-- I MESSED UP! Should've used the ReservationID
-- instead of CustomerID

SELECT * FROM Reservations
ORDER By CustomerID