CREATE TABLE LibraryBooks (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(50),
    author_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(8,2)
);

INSERT INTO LibraryBooks VALUES
(201, 'Wings of Fire', 'A.P.J. Abdul Kalam', 'Biography', 350.00),
(202, 'The Alchemist', 'Paulo Coelho', 'Fiction', 280.00),
(203, 'Clean Code', 'Robert Martin', 'Programming', 550.00);


DELIMITER //

CREATE PROCEDURE DisplayBooks()
BEGIN
    SELECT * FROM LibraryBooks;
END //

DELIMITER ;

CALL DisplayBooks();


DELIMITER //

CREATE PROCEDURE InsertBook(
    IN p_book_id INT,
    IN p_book_name VARCHAR(50),
    IN p_author_name VARCHAR(50),
    IN p_category VARCHAR(30),
    IN p_price DECIMAL(8,2)
)
BEGIN
    INSERT INTO LibraryBooks
    VALUES (p_book_id, p_book_name, p_author_name, p_category, p_price);
END //

DELIMITER ;

CALL InsertBook(204, 'Atomic Habits', 'James Clear', 'Self Help', 400.00);

CALL DisplayBooks();


DELIMITER //

CREATE PROCEDURE UpdateBookPrice(
    IN p_book_id INT,
    IN p_new_price DECIMAL(8,2)
)
BEGIN
    UPDATE LibraryBooks
    SET price = p_new_price
    WHERE book_id = p_book_id;
END //

DELIMITER ;

CALL UpdateBookPrice(202, 320.00);

CALL DisplayBooks();


DELIMITER //

CREATE PROCEDURE DeleteBook(
    IN p_book_id INT
)
BEGIN
    DELETE FROM LibraryBooks
    WHERE book_id = p_book_id;
END //

DELIMITER ;

CALL DeleteBook(203);

CALL DisplayBooks();