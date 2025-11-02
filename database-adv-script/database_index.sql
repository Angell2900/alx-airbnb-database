-- Step 1: Measure performance before adding indexes
EXPLAIN ANALYZE
SELECT b.id AS booking_id,
       u.name AS user_name,
       p.name AS property_name
FROM Booking b
INNER JOIN User u ON b.user_id = u.id
INNER JOIN Property p ON b.property_id = p.id
WHERE b.start_date >= '2025-01-01' AND b.end_date <= '2025-12-31';

-- Step 2: Create indexes to optimize query performance
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_property_city ON Property(city);

-- Step 3: Measure performance after adding indexes
EXPLAIN ANALYZE
SELECT b.id AS booking_id,
       u.name AS user_name,
       p.name AS property_name
FROM Booking b
INNER JOIN User u ON b.user_id = u.id
INNER JOIN Property p ON b.property_id = p.id
WHERE b.start_date >= '2025-01-01' AND b.end_date <= '2025-12-31';
