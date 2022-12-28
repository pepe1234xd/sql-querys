--CREATE THE QUERIES

--Money from orders expended per month where money is less than 1000
select month(o.OrderDate) as mes,
 case 
 	when sum(od.Quantity*p.Price) < 50000 then sum(od.Quantity*p.Price)
 end as Total
from Orders o
inner join OrderDetails od on od.OrderID = o.OrderID
inner join Products p on p.ProductID = od.ProductID
group by month(o.OrderDate)

--Total of money expended in orders per Employee
select EmployeeID, LastName, FirstName, sum(Money) as TotalMoney, ProductName from
(SELECT e.EmployeeID, e.LastName, e.FirstName, (p.Price * od.Quantity)as Money, p.ProductName FROM Employees e
inner join Orders o on o.EmployeeID = e.EmployeeID
inner join OrderDetails od on od.OrderID = o.OrderID
inner join Products p on p.ProductID = od.ProductID)
group by EmployeeID

--Average price of products in bags
select AVG(Price) as Average from Products
where Unit like '%bags%'

--Most ordered product by country
SELECT Country,MAX(orderedProducts), ProductID
FROM
(SELECT ProductID, count(productID) as orderedProducts, c.Country FROM OrderDetails od
inner join Orders ord on od.OrderID = o.OrderID
inner join Customers c on o.CustomerID = c.CustomerID
group by c.Country)
group by Country;

--Total of orders made by customer country
SELECT c.Country, count(o.CustomerID) as mades
  FROM Orders o
  INNER JOIN Customers c ON o.CustomerID = c.CustomerID
  GROUP BY c.Country

--Get last order placed by customer
select * from Orders
order by OrderDate desc limit 1
  
--Products that contains Queso in name but showing Queso as Cheese
SELECT ProductID, 
       replace(ProductName,'Queso','Cheese') as ProducName,
       SupplierID,
       CategoryID,Unit,
       Price 
from Products where ProductName like '%Queso%';

--Top 10 most ordered products 
SELECT o.ProductID, Count(o.ProductID) as counts FROM OrderDetails o
  inner join Products p on o.ProductID = p.ProductID
  GROUP BY o.ProductID 
  ORDER by counts desc limit 10

--Average price of products per category
Select c.CategoryName, AVG(p.Price) AS Average From  Products p 
join Categories c on c.CategoryID = p.CategoryID
GROUP BY c.CategoryID
  
--Customer that have ordered the most
Select c.CustomerName, Count(o.CustomerID) orders From Customers c 
  inner join Orders o on o.CustomerID = c.CustomerID
  group BY c.CustomerName
  order by orders desc limit 1




 
--Session SQLs
--average price of product category
Select 
CategoryName, 
AVG(P.Price) as Average
FROM Products P
INNER JOIN Categories C ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryID

--average price of product category
Select 
CategoryName, 
	CASE 
    	WHEN AVG(P.Price) > 50 THEN "Really High"
        WHEN AVG(P.Price) < 25 THEN "Really Low"
        ELSE AVG(P.Price)
    END AS "Average"
FROM Products P
INNER JOIN Categories C ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryID