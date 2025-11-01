-- Airbnb Clone Database Seed Data
-- Version: 1.0
-- Description: Comprehensive sample data for Airbnb clone database
-- Created: 2024
-- Author: Angel Ihimbazwe

USE airbnb_clone;

-- USER TABLE
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
// ...existing first 5 users...
(UUID(), 'Frank', 'Maina', 'frank.maina@example.com', 'hashed_password_6', '0711222333', 'host'),
(UUID(), 'Grace', 'Ochieng', 'grace.ochieng@example.com', 'hashed_password_7', '0711444555', 'guest'),
(UUID(), 'Henry', 'Kibet', 'henry.kibet@example.com', 'hashed_password_8', '0711666777', 'guest');

-- PROPERTY TABLE
// ...existing 4 properties...
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
(UUID(), (SELECT user_id FROM User WHERE email='frank.maina@example.com'),
'Forest Retreat', 'Secluded cabin in Karura Forest', 'Nairobi, Kenya', 200.00),
(UUID(), (SELECT user_id FROM User WHERE email='frank.maina@example.com'),
'Beach Bungalow', 'Beachfront property with private access', 'Malindi, Kenya', 250.00);

-- Add more diverse bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
// ...existing 2 bookings...
(UUID(),
(SELECT property_id FROM Property WHERE name='Forest Retreat'),
(SELECT user_id FROM User WHERE email='grace.ochieng@example.com'),
'2025-12-24', '2025-12-26', 400.00, 'pending'),
(UUID(),
(SELECT property_id FROM Property WHERE name='Beach Bungalow'),
(SELECT user_id FROM User WHERE email='henry.kibet@example.com'),
'2026-01-01', '2026-01-05', 1000.00, 'confirmed');

-- Add corresponding payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
// ...existing 2 payments...
(UUID(),
(SELECT booking_id FROM Booking WHERE total_price=1000.00),
1000.00, 'credit_card');

-- Add more reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
// ...existing 2 reviews...
(UUID(),
(SELECT property_id FROM Property WHERE name='Beach Bungalow'),
(SELECT user_id FROM User WHERE email='henry.kibet@example.com'),
5, 'Perfect beachfront location, amazing sunrise views!');

-- Add more messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
// ...existing 2 messages...
(UUID(),
(SELECT user_id FROM User WHERE email='grace.ochieng@example.com'),
(SELECT user_id FROM User WHERE email='frank.maina@example.com'),
'Looking forward to our Christmas stay at the Forest Retreat!');
