select 
Vendedor,
Produto,
Quantidade,
(((ValorUnitario * Quantidade) - Desconto) / Quantidade) [Valor Médio]
from 
(select 
Concat(Employees.FirstName, ' ', Employees.LastName) Vendedor,
Products.ProductName Produto,  
Sum([Order Details].Quantity) Quantidade, 
Sum([Order Details].UnitPrice) ValorUnitario,
Sum([Order Details].Discount) Desconto
from [Order Details]
inner join Orders on Orders.OrderID = [Order Details].OrderID
inner join Products on Products.ProductID = [Order Details].ProductID
inner join Employees on Employees.EmployeeID = Orders.EmployeeID
group by
Products.ProductName, 
Employees.FirstName, 
Employees.LastName
) vendas
where Quantidade > 200
order by
Vendedor,
Produto,
Quantidade