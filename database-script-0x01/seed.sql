-- Airbnb Clone Database Seeding
-- Created by Angel Ihimbazwe

USE airbnb_clone;

-- USER TABLE
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(UUID(), 'Alice', 'Kamau', 'alice.kamau@example.com', 'hashed_password_1', '0700111222', 'guest'),
(UUID(), 'Brian', 'Otieno', 'brian.otieno@example.com', 'hashed_password_2', '0700333444', 'host'),
(UUID(), 'Carla', 'Njeri', 'carla.njeri@example.com', 'hashed_password_3', '0700555666', 'admin');

-- PROPERTY TABLE
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
(UUID(), (SELECT user_id FROM User WHERE email='brian.otieno@example.com'),
'Seaside Villa', 'Beautiful 3-bedroom villa near the beach.', 'Mombasa, Kenya', 150.00),
(UUID(), (SELECT user_id FROM User WHERE email='brian.otieno@example.com'),
'Mountain Cabin', 'Cozy cabin with great views of Mount Kenya.', 'Nanyuki, Kenya', 120.00);

-- BOOKING TABLE
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(UUID(),
(SELECT property_id FROM Property WHERE name='Seaside Villa'),
(SELECT user_id FROM User WHERE email='alice.kamau@example.com'),
'2025-11-01', '2025-11-05', 600.00, 'confirmed');

-- PAYMENT TABLE
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
(UUID(),
(SELECT booking_id FROM Booking WHERE total_price=600.00),
600.00, 'paypal');

-- REVIEW TABLE
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
(UUID(),
(SELECT property_id FROM Property WHERE name='Seaside Villa'),
(SELECT user_id FROM User WHERE email='alice.kamau@example.com'),
5, 'Amazing stay! The host was super friendly.');

-- MESSAGE TABLE
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
(UUID(),
(SELECT user_id FROM User WHERE email='alice.kamau@example.com'),
(SELECT user_id FROM User WHERE email='brian.otieno@example.com'),
'Hello Brian, I just wanted to say thanks for the great stay!');
