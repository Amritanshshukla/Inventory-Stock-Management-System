USE InventoryDB;

INSERT INTO Suppliers (supplier_name, phone, email, address) VALUES
('TechSource Supplies', '9876543210', 'sales@techsource.example', 'Bareilly, Uttar Pradesh'),
('Office Essentials Co.', '9876501234', 'contact@officeessentials.example', 'Lucknow, Uttar Pradesh'),
('Digital World Traders', '9811122233', 'orders@digitalworld.example', 'Delhi, India');

INSERT INTO Products
(product_name, category, supplier_id, unit_price, stock_quantity, reorder_level)
VALUES
('Keyboard', 'Computer Accessories', 1, 650.00, 50, 10),
('Mouse', 'Computer Accessories', 1, 350.00, 80, 15),
('USB Drive 32GB', 'Storage', 3, 500.00, 40, 8),
('Monitor 22-inch', 'Computer Hardware', 3, 7200.00, 12, 5),
('Office Chair', 'Furniture', 2, 4500.00, 7, 10);
