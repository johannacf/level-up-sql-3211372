-- Create two reports about book statistics.

-- Report 1: Show how many titles were published 
-- in each year.

SELECT Published, COUNT(DISTINCT Title) AS TitleCount
FROM BOOKS
GROUP BY Published
ORDER BY TitleCount DESC;

-- Report 2: Show the five books that have been
-- checked out the most.

SELECT b.Title, COUNT(l.LoanID) AS CheckOutCount 
FROM Loans AS l
JOIN Books AS b 
ON l.BookID = b.BookID
GROUP BY b.Title
ORDER BY CheckOutCount DESC
LIMIT 5;
