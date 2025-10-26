-- Airbnb Clone Database Seed Data
-- Version: 1.0
-- Description: Initial data population for the Airbnb clone database
-- Created: 2024
-- Author: Angel Ihimbazwe

USE airbnb_clone;

-- USER TABLE
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(UUID(), 'Alice', 'Kamau', 'alice.kamau@example.com', 'hashed_password_1', '0700111222', 'guest'),
(UUID(), 'Brian', 'Otieno', 'brian.otieno@example.com', 'hashed_password_2', '0700333444', 'host'),
(UUID(), 'Carla', 'Njeri', 'carla.njeri@example.com', 'hashed_password_3', '0700555666', 'admin'),
(UUID(), 'David', 'Mugo', 'david.mugo@example.com', 'hashed_password_4', '0700777888', 'host'),
(UUID(), 'Eva', 'Wanjiku', 'eva.wanjiku@example.com', 'hashed_password_5', '0700999000', 'guest');

-- PROPERTY TABLE
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
(UUID(), (SELECT user_id FROM User WHERE email='brian.otieno@example.com'),
'Seaside Villa', 'Beautiful 3-bedroom villa near the beach.', 'Mombasa, Kenya', 150.00),
(UUID(), (SELECT user_id FROM User WHERE email='brian.otieno@example.com'),
'Mountain Cabin', 'Cozy cabin with great views of Mount Kenya.', 'Nanyuki, Kenya', 120.00),
(UUID(), (SELECT user_id FROM User WHERE email='david.mugo@example.com'),
'City Apartment', 'Modern 2-bedroom apartment in the heart of the city', 'Nairobi, Kenya', 100.00),
(UUID(), (SELECT user_id FROM User WHERE email='david.mugo@example.com'),
'Lake House', 'Peaceful retreat by Lake Victoria', 'Kisumu, Kenya', 180.00);

-- BOOKING TABLE
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(UUID(),
(SELECT property_id FROM Property WHERE name='Seaside Villa'),
(SELECT user_id FROM User WHERE email='alice.kamau@example.com'),
'2025-11-01', '2025-11-05', 600.00, 'confirmed'),
(UUID(),
(SELECT property_id FROM Property WHERE name='City Apartment'),
(SELECT user_id FROM User WHERE email='eva.wanjiku@example.com'),
'2025-12-01', '2025-12-03', 200.00, 'confirmed');

-- PAYMENT TABLE
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
(UUID(),
(SELECT booking_id FROM Booking WHERE total_price=600.00),
600.00, 'paypal'),
(UUID(),
(SELECT booking_id FROM Booking WHERE total_price=200.00),
200.00, 'mpesa');

-- REVIEW TABLE
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
(UUID(),
(SELECT property_id FROM Property WHERE name='Seaside Villa'),
(SELECT user_id FROM User WHERE email='alice.kamau@example.com'),
5, 'Amazing stay! The host was super friendly.'),
(UUID(),
(SELECT property_id FROM Property WHERE name='City Apartment'),
(SELECT user_id FROM User WHERE email='eva.wanjiku@example.com'),
4, 'Great location and clean apartment!');

-- MESSAGE TABLE
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
(UUID(),
(SELECT user_id FROM User WHERE email='alice.kamau@example.com'),
(SELECT user_id FROM User WHERE email='brian.otieno@example.com'),
'Hello Brian, I just wanted to say thanks for the great stay!'),
(UUID(),
(SELECT user_id FROM User WHERE email='eva.wanjiku@example.com'),
(SELECT user_id FROM User WHERE email='david.mugo@example.com'),
'Hi David, is the apartment available next month?');
