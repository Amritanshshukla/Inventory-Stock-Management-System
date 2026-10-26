USE InventoryDB;

-- 1. Display all products.
SELECT * FROM Products;

-- 2. Search for a product by name.
SELECT *
FROM Products
WHERE product_name LIKE '%Mouse%';

-- 3. Show products in a particular category.
SELECT product_name, category, unit_price, stock_quantity
FROM Products
WHERE category = 'Computer Accessories';

-- 4. Find products that need restocking.
SELECT product_id, product_name, stock_quantity, reorder_level
FROM Products
WHERE stock_quantity <= reorder_level;

-- 5. Join products with supplier names.
SELECT p.product_id, p.product_name, s.supplier_name, p.unit_price, p.stock_quantity
FROM Products AS p
LEFT JOIN Suppliers AS s ON p.supplier_id = s.supplier_id
ORDER BY p.product_name;

-- 6. Update a product price (example).
-- Uncomment the next line to change the Mouse price.
-- UPDATE Products SET unit_price = 375.00 WHERE product_name = 'Mouse';

-- 7. Count products by category.
SELECT category, COUNT(*) AS product_count
FROM Products
GROUP BY category
ORDER BY product_count DESC;

-- 8. Calculate total inventory value at selling price.
SELECT SUM(unit_price * stock_quantity) AS inventory_value
FROM Products;

-- 9. Estimate potential sales value of current stock.
SELECT product_name, stock_quantity, unit_price,
       (stock_quantity * unit_price) AS potential_sales_value
FROM Products
ORDER BY potential_sales_value DESC;
