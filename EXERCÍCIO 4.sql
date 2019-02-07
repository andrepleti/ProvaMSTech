select
*
from 
(select
ROW_NUMBER() OVER(ORDER BY Sum([Order Details].Quantity) Desc) AS Classificacao, 
Concat(Employees.FirstName, ' ', Employees.LastName) Vendedor,
Sum([Order Details].Quantity) Quantidade
from Employees
left join Orders on Orders.EmployeeID = Employees.EmployeeID
left join [Order Details] on Orders.OrderID = [Order Details].OrderID
left join Products on Products.ProductID = [Order Details].ProductID
group by 
Employees.FirstName, 
Employees.LastName
) vendas
where Classificacao <= 3 or Quantidade is null
order by
Quantidade desc