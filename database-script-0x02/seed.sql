-- Seed data for users, properties, and bookings
INSERT INTO users (user_id, name, email)
VALUES
(1, 'Alice Njeri', 'alice@example.com'),
(2, 'Brian Otieno', 'brian@example.com'),
(3, 'Clara Wanjiku', 'clara@example.com');

INSERT INTO properties (property_id, user_id, name, location, price_per_night)
VALUES
(1, 1, 'Nairobi Cottage', 'Nairobi, Kenya', 80.00),
(2, 2, 'Mombasa Apartment', 'Mombasa, Kenya', 120.00);

INSERT INTO bookings (booking_id, user_id, property_id, check_in_date, check_out_date, total_price)
VALUES
(1, 3, 1, '2025-11-10', '2025-11-15', 400.00),
(2, 1, 2, '2025-12-01', '2025-12-05', 480.00);
