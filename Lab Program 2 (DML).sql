CREATE TABLE GroceryProduct (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(30),
    price DECIMAL(10,2),
    quantity INT
);

INSERT INTO GroceryProduct
(product_id, product_name, category, price, quantity)
VALUES
(101, 'Basmati Rice', 'Grains', 120.00, 50),
(102, 'Olive Oil', 'Cooking Oil', 450.00, 25),
(103, 'Almonds', 'Dry Fruits', 600.00, 30),
(104, 'Organic Honey', 'Sweeteners', 350.00, 20),
(105, 'Green Tea', 'Beverages', 180.00, 40);

SELECT * FROM GroceryProduct;



UPDATE GroceryProduct
SET price = 425.00
WHERE product_id = 102;

UPDATE GroceryProduct
SET quantity = 45
WHERE product_id = 103;

SELECT * FROM GroceryProduct;


DELETE FROM GroceryProduct
WHERE product_id = 105;

SELECT * FROM GroceryProduct;

SELECT * FROM GroceryProduct;

SELECT * FROM GroceryProduct
WHERE price > 300;

SELECT * FROM GroceryProduct
WHERE category = 'Dry Fruits';

SELECT * FROM GroceryProduct
WHERE quantity > 25;

SELECT * FROM GroceryProduct
ORDER BY price ASC;

SELECT product_name, price
FROM GroceryProduct;
