-- Prepare a report of the library patrons
-- who have checked out the fewest books.

SELECT PatronID, COUNT(LoanID) AS NumberOfCheckOuts
FROM Loans
GROUP BY PatronID
-- I ran this query and determined <15 as limit
HAVING NumberOfCheckOuts < 15
ORDER BY NumberOfCheckOuts ASC;

-- now I join to get names/emails
SELECT p.FirstName, p.LastName, p.Email, COUNT(l.LoanID) AS NumberOfCheckOuts
FROM Loans AS l
JOIN Patrons AS p 
ON l.PatronID = p.PatronID
GROUP BY l.PatronID
HAVING NumberOfCheckOuts < 15
ORDER BY NumberOfCheckOuts ASC
