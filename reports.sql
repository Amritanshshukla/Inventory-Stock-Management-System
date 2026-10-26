USE InventoryDB;

-- 1. Number of products in each category.
SELECT category, COUNT(*) AS total_products
FROM Products
GROUP BY category
ORDER BY total_products DESC;

-- 2. Product count by supplier.
SELECT s.supplier_name, COUNT(p.product_id) AS total_products
FROM Suppliers AS s
LEFT JOIN Products AS p ON p.supplier_id = s.supplier_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY total_products DESC;

-- 3. Purchase history with supplier details.
SELECT pu.purchase_id, pu.purchase_date, s.supplier_name, pu.total_amount
FROM Purchases AS pu
LEFT JOIN Suppliers AS s ON s.supplier_id = pu.supplier_id
ORDER BY pu.purchase_date DESC;

-- 4. Sales history.
SELECT sale_id, sale_date, customer_name, total_amount
FROM Sales
ORDER BY sale_date DESC;

-- 5. Total purchase expenditure.
SELECT COALESCE(SUM(total_amount), 0) AS total_purchase_expenditure
FROM Purchases;

-- 6. Total sales revenue.
SELECT COALESCE(SUM(total_amount), 0) AS total_sales_revenue
FROM Sales;

-- 7. Most expensive product.
SELECT product_name, unit_price
FROM Products
ORDER BY unit_price DESC
LIMIT 1;

-- 8. Restock report.
SELECT product_name, stock_quantity, reorder_level,
       (reorder_level - stock_quantity) AS suggested_restock_quantity
FROM Products
WHERE stock_quantity <= reorder_level
ORDER BY suggested_restock_quantity DESC;

-- 9. Units sold by product.
SELECT p.product_name, COALESCE(SUM(si.quantity), 0) AS units_sold
FROM Products AS p
LEFT JOIN Sale_Items AS si ON si.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC;

-- 10. Complete inventory report.
SELECT p.product_id, p.product_name, p.category,
       s.supplier_name, p.unit_price, p.stock_quantity,
       p.reorder_level, (p.unit_price * p.stock_quantity) AS stock_value
FROM Products AS p
LEFT JOIN Suppliers AS s ON s.supplier_id = p.supplier_id
ORDER BY p.category, p.product_name;
