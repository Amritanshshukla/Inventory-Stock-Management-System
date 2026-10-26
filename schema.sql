CREATE DATABASE IF NOT EXISTS InventoryDB;
USE InventoryDB;

CREATE TABLE IF NOT EXISTS Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(120),
    address VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(120) NOT NULL,
    category VARCHAR(60) NOT NULL,
    supplier_id INT,
    unit_price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    reorder_level INT NOT NULL DEFAULT 10,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_products_supplier
        FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT chk_product_price CHECK (unit_price >= 0),
    CONSTRAINT chk_product_stock CHECK (stock_quantity >= 0),
    CONSTRAINT chk_product_reorder CHECK (reorder_level >= 0)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Purchases (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    purchase_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
    notes VARCHAR(255),
    CONSTRAINT fk_purchases_supplier
        FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT chk_purchase_total CHECK (total_amount >= 0)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Purchase_Items (
    purchase_item_id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_cost DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_purchase_items_purchase
        FOREIGN KEY (purchase_id) REFERENCES Purchases(purchase_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_purchase_items_product
        FOREIGN KEY (product_id) REFERENCES Products(product_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_purchase_item_quantity CHECK (quantity > 0),
    CONSTRAINT chk_purchase_item_cost CHECK (unit_cost >= 0)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_name VARCHAR(100) DEFAULT 'Walk-in Customer',
    total_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
    notes VARCHAR(255),
    CONSTRAINT chk_sale_total CHECK (total_amount >= 0)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Sale_Items (
    sale_item_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_sale_items_sale
        FOREIGN KEY (sale_id) REFERENCES Sales(sale_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_sale_items_product
        FOREIGN KEY (product_id) REFERENCES Products(product_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_sale_item_quantity CHECK (quantity > 0),
    CONSTRAINT chk_sale_item_price CHECK (unit_price >= 0)
) ENGINE=InnoDB;
