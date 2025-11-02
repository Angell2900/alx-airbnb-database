-- Analyze performance of retrieving all bookings with user, property, and payment details

-- Step 1: Analyze query with EXPLAIN
EXPLAIN
SELECT b.id AS booking_id,
       u.name AS user_name,
       u.email AS user_email,
       p.name AS property_name,
       p.city AS property_city,
       pay.amount AS payment_amount,
       pay.payment_date
FROM Booking b
INNER JOIN User u ON b.user_id = u.id
INNER JOIN Property p ON b.property_id = p.id
INNER JOIN Payment pay ON b.id = pay.booking_id
WHERE b.start_date >= '2025-01-01' AND b.end_date <= '2025-12-31';

-- Step 2: Initial query with WHERE and AND (for filtering by date range)
SELECT b.id AS booking_id,
       u.name AS user_name,
       u.email AS user_email,
       p.name AS property_name,
       p.city AS property_city,
       pay.amount AS payment_amount,
       pay.payment_date
FROM Booking b
INNER JOIN User u ON b.user_id = u.id
INNER JOIN Property p ON b.property_id = p.id
INNER JOIN Payment pay ON b.id = pay.booking_id
WHERE b.start_date >= '2025-01-01' AND b.end_date <= '2025-12-31';
