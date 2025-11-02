-- Initial query: retrieve bookings with user, property, and payment details
SELECT b.id AS booking_id,
       u.name AS user_name,
       p.name AS property_name,
       pay.amount,
       pay.payment_date
FROM Booking b
INNER JOIN User u ON b.user_id = u.id
INNER JOIN Property p ON b.property_id = p.id
INNER JOIN Payment pay ON b.id = pay.booking_id;

-- Refactored query: optimized using indexes
-- (Indexes applied from database_index.sql)
