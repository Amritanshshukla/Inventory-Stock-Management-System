USE InventoryDB;

DROP TRIGGER IF EXISTS trg_purchase_item_after_insert;
DROP TRIGGER IF EXISTS trg_sale_item_before_insert;
DROP TRIGGER IF EXISTS trg_sale_item_after_insert;

DELIMITER $$

CREATE TRIGGER trg_purchase_item_after_insert
AFTER INSERT ON Purchase_Items
FOR EACH ROW
BEGIN
    UPDATE Products
    SET stock_quantity = stock_quantity + NEW.quantity
    WHERE product_id = NEW.product_id;

    UPDATE Purchases
    SET total_amount = total_amount + (NEW.quantity * NEW.unit_cost)
    WHERE purchase_id = NEW.purchase_id;
END$$

CREATE TRIGGER trg_sale_item_before_insert
BEFORE INSERT ON Sale_Items
FOR EACH ROW
BEGIN
    DECLARE current_stock INT DEFAULT NULL;

    SELECT stock_quantity INTO current_stock
    FROM Products
    WHERE product_id = NEW.product_id
    FOR UPDATE;

    IF current_stock IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Product does not exist.';
    ELSEIF current_stock < NEW.quantity THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insufficient stock for this sale.';
    END IF;
END$$

CREATE TRIGGER trg_sale_item_after_insert
AFTER INSERT ON Sale_Items
FOR EACH ROW
BEGIN
    UPDATE Products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;

    UPDATE Sales
    SET total_amount = total_amount + (NEW.quantity * NEW.unit_price)
    WHERE sale_id = NEW.sale_id;
END$$

DELIMITER ;
