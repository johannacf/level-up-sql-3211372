-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.

SELECT BookID from Books
WHERE Title = 'Dracula';
-- this got copies of Dracula

SELECT COUNT(BookID) from Books
WHERE Title = 'Dracula';
-- this counts how many copies there are

SELECT COUNT(BookID) FROM Loans
WHERE ReturnedDate IS NULL;
-- this shows all books that are on loan

-- now... we join to find # of Dracula on loan
SELECT COUNT(Books.Title) FROM Loans
INNER JOIN Books ON Loans.BookID = Books.BookID
WHERE Books.Title = 'Dracula' 
AND Loans.ReturnedDate IS NULL;

-- now subtract loaned out books from number of total copies 
-- to get the number of available copies:
SELECT 
  (SELECT COUNT(Books.BookID) from Books
  WHERE Books.Title = 'Dracula')
  -
  (SELECT COUNT(Books.Title) FROM Loans
  INNER JOIN Books ON Loans.BookID = Books.BookID
  WHERE Books.Title = 'Dracula' 
  AND Loans.ReturnedDate IS NULL)
AS AvailableCopies;
