-- Create a list of books to feature in an exhibit.

-- Make a pick list of books published from 1890-1899 
-- which are not currently checked out.

SELECT DISTINCT b.Title, b.Published, b.Author
FROM Books AS b
JOIN Loans AS l
ON b.BookID = l.BookID
WHERE Published BETWEEN 1890 AND 1899
AND l.ReturnedDate IS NOT NULL
-- This was my original, which I thought was pretty good!
-- Got a list of *distinct* books (i.e., no repeat titles).
-- However, prof pointed out we will likely need the barcode
-- to ensure the correct copy of the book is picked up,
-- so I will rewrite now:

SELECT DISTINCT b.Barcode, b.Title, b.Published, b.Author
FROM Books AS b
JOIN Loans AS l
ON b.BookID = l.BookID
WHERE Published BETWEEN 1890 AND 1899
ORDER BY b.Title

-- I got 44 titles, he got 41. Here's his query:
SELECT Title, Barcode
FROM Books
WHERE Published BETWEEN 1890 AND 1899
AND (BookID NOT IN 
  (SELECT BookID 
  FROM Loans 
  WHERE ReturnedDate IS NULL)) 
ORDER BY Title;