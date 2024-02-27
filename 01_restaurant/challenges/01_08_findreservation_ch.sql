-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant

-- There are four people in the party. Today is June 14th.

SELECT R.ReservationID, C.FirstName, C.LastName, C.CustomerID, R.Date, R.PartySize
FROM Reservations AS R
INNER JOIN Customers AS C on R.CustomerID = C.CustomerID
WHERE (C.LastName LIKE 'ste%' OR C.LastName LIKE '%sant')
AND R.Date LIKE '%06-14%' AND R.PartySize = 4

