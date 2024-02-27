-- Create reports that will be used to make three menus.

-- Create a report with all the items sorted by price (lowest to highest).
-- Create a report showing appetizers and beverages.
-- Create a report with all items except beverages.
SELECT Name, Type, Price, Description from Dishes
ORDER BY Price ASC;

SELECT Name, Type, Price, Description from Dishes
WHERE Type LIKE 'appetizer' 
OR Type LIKE 'beverage'
ORDER BY Type;

SELECT Name, Type, Price, Description from Dishes
WHERE Type NOT LIKE 'beverage'
ORDER BY Type;