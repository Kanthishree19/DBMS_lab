CREATE TABLE HotelGuests (
    guest_id INT PRIMARY KEY,
    guest_name VARCHAR(50),
    room_type VARCHAR(30),
    room_charge DECIMAL(10,2),
    city VARCHAR(30)
);

CREATE TABLE HotelMembers (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(50),
    membership_type VARCHAR(30),
    city VARCHAR(30)
);

INSERT INTO HotelGuests VALUES
(101, 'Ananya', 'Deluxe', 3500, 'Bengaluru'),
(102, 'Rahul', 'Standard', 2000, 'Mysuru'),
(103, 'Meera', 'Suite', 6000, 'Chennai'),
(104, 'Kiran', 'Deluxe', 3500, 'Bengaluru'),
(105, 'Sneha', 'Standard', 2000, 'Hyderabad');

INSERT INTO HotelMembers VALUES
(201, 'Arjun', 'Gold', 'Bengaluru'),
(202, 'Priya', 'Silver', 'Mysuru'),
(203, 'Rahul', 'Gold', 'Chennai'),
(204, 'Divya', 'Platinum', 'Hyderabad');

SELECT * FROM HotelGuests
WHERE room_charge BETWEEN 2000 AND 4000;

SELECT * FROM HotelGuests
WHERE room_type IN ('Deluxe', 'Suite');

SELECT * FROM HotelGuests
WHERE room_type NOT IN ('Standard', 'Suite');

SELECT * FROM HotelGuests
WHERE guest_name LIKE 'A%';

SELECT * FROM HotelGuests
WHERE city IS NULL;

SELECT *
FROM HotelGuests AS G
WHERE EXISTS (
    SELECT 1
    FROM HotelMembers AS M
    WHERE M.member_name = G.guest_name
);


SELECT *
FROM HotelGuests
WHERE room_charge > ANY (
    SELECT room_charge
    FROM HotelGuests
    WHERE city = 'Bengaluru'
);


SELECT *
FROM HotelGuests
WHERE room_charge > ALL (
    SELECT room_charge
    FROM HotelGuests
    WHERE city = 'Mysuru'
);


SELECT guest_name AS Person_Name
FROM HotelGuests

UNION

SELECT member_name AS Person_Name
FROM HotelMembers;

SELECT guest_name AS Person_Name
FROM HotelGuests

UNION ALL

SELECT member_name AS Person_Name
FROM HotelMembers;

SELECT city
FROM HotelGuests

UNION

SELECT city
FROM HotelMembers;

SELECT * FROM HotelGuests;

SELECT * FROM HotelMembers;
