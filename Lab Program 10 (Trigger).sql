CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE ProductAudit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    action_type VARCHAR(20),
    old_price DECIMAL(10,2),
    new_price DECIMAL(10,2),
    action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Products VALUES
(101, 'Laptop', 50000.00, 10),
(102, 'Mobile', 20000.00, 20),
(103, 'Headphones', 1500.00, 30);


DELIMITER //

CREATE TRIGGER Before_Product_Insert
BEFORE INSERT ON Products
FOR EACH ROW
BEGIN
    IF NEW.price <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Price must be greater than zero';
    END IF;

    IF NEW.stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock cannot be negative';
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER After_Product_Insert
AFTER INSERT ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductAudit
    (product_id, action_type, new_price)
    VALUES (NEW.product_id, 'INSERT', NEW.price);
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER Before_Product_Update
BEFORE UPDATE ON Products
FOR EACH ROW
BEGIN
    IF NEW.price <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Updated price must be greater than zero';
    END IF;

    IF NEW.stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Updated stock cannot be negative';
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER After_Product_Update
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductAudit
    (product_id, action_type, old_price, new_price)
    VALUES
    (NEW.product_id, 'UPDATE', OLD.price, NEW.price);
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER Before_Product_Delete
BEFORE DELETE ON Products
FOR EACH ROW
BEGIN
    IF OLD.stock > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a product while stock is available';
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER After_Product_Delete
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductAudit
    (product_id, action_type, old_price)
    VALUES (OLD.product_id, 'DELETE', OLD.price);
END //

DELIMITER ;

INSERT INTO Products VALUES
(104, 'Keyboard', 1200.00, 15);

UPDATE Products
SET price = 18000.00, stock = 25
WHERE product_id = 102;


UPDATE Products
SET stock = 0
WHERE product_id = 103;

DELETE FROM Products
WHERE product_id = 103;

SELECT * FROM Products;

SELECT * FROM ProductAudit;
