-- Update a customer's contact information.

-- Taylor Jenkins, of 27170 6th Ave., Washington, DC,
-- has moved to 74 Pine St., New York, NY.

UPDATE Customers
SET Address = '74 Pine St.', City = 'New York', State = 'NY'
WHERE FirstName = 'Taylor' AND LastName = 'Jenkins'
AND Address LIKE '27170 6th Ave%';

SELECT * FROM Customers
ORDER BY LastName

-- Note to self: It would have been okay to use the SELECT statement to 
-- identify the ID (26 here) and then use that in the following queries.