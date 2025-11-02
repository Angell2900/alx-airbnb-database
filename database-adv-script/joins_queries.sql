-- INNER JOIN: Retrieve all bookings and respective users
SELECT b.id AS booking_id,
       u.id AS user_id,
       u.name AS user_name,
       b.property_id,
       b.start_date,
       b.end_date
FROM Booking b
INNER JOIN User u ON b.user_id = u.id;

-- LEFT JOIN: Retrieve all properties and their reviews (even if no reviews)
SELECT p.id AS property_id,
       p.name AS property_name,
       r.id AS review_id,
       r.rating
FROM Property p
LEFT JOIN Review r ON p.id = r.property_id;

-- FULL OUTER JOIN: Retrieve all users and all bookings
SELECT u.id AS user_id,
       u.name AS user_name,
       b.id AS booking_id,
       b.property_id
FROM User u
FULL OUTER JOIN Booking b ON u.id = b.user_id;
