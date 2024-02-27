-- Prepare a report of books due to be returned
-- to the library on July 13, 2022.
-- Provide the due date, the book title, and
-- the borrower's first name and email address.

-- due date: Loans
-- book title: Books
-- first name/email: Patrons

SELECT L.DueDate, B.Title, P.FirstName, P.Email FROM Loans AS L
JOIN Books AS B 
  ON L.BookID = B.BookID
JOIN Patrons AS P
  ON L.PatronID = P.PatronID
WHERE L.DueDate = '2022-07-13' AND L.ReturnedDate IS NULL
-- note to self: I got tripped up by the syntax for a moment.
-- WHERE statements must come *after* JOIN statements