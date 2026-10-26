USE InventoryDB;

-- Demo purchase: add 20 keyboards to stock.
START TRANSACTION;

INSERT INTO Purchases (supplier_id, notes)
VALUES (1, 'Demo purchase - 20 keyboards');

SET @purchase_id = LAST_INSERT_ID();

INSERT INTO Purchase_Items (purchase_id, product_id, quantity, unit_cost)
VALUES (@purchase_id, 1, 20, 600.00);

COMMIT;

-- Demo sale: sell 5 keyboards.
START TRANSACTION;

INSERT INTO Sales (customer_name, notes)
VALUES ('Demo Customer', 'Demo sale - 5 keyboards');

SET @sale_id = LAST_INSERT_ID();

INSERT INTO Sale_Items (sale_id, product_id, quantity, unit_price)
VALUES (@sale_id, 1, 5, 650.00);

COMMIT;

-- Check the updated stock and invoice totals.
SELECT product_id, product_name, stock_quantity
FROM Products
WHERE product_id = 1;

SELECT * FROM Purchases WHERE purchase_id = @purchase_id;
SELECT * FROM Sales WHERE sale_id = @sale_id;
