-- Non-correlated subquery: Properties with avg rating > 4.0
SELECT *
FROM Property
WHERE id IN (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- Correlated subquery: Users with more than 3 bookings
SELECT u.id, u.name
FROM User u
WHERE 3 < (
    SELECT COUNT(*)
    FROM Booking b
    WHERE b.user_id = u.id
);
