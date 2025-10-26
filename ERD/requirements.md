# Entity-Relationship Diagram Requirements

## Core Entities

1. User
   - Attributes: user_id (PK), first_name, last_name, email, password_hash, phone_number, role
   - Relationships: One-to-Many with Property (as host), One-to-Many with Booking (as guest)

2. Property
   - Attributes: property_id (PK), host_id (FK), name, description, location, pricepernight
   - Relationships: Many-to-One with User, One-to-Many with Booking

3. Booking
   - Attributes: booking_id (PK), property_id (FK), user_id (FK), start_date, end_date, total_price, status
   - Relationships: Many-to-One with Property, Many-to-One with User

4. Payment
   - Attributes: payment_id (PK), booking_id (FK), amount, payment_method
   - Relationships: One-to-One with Booking

5. Review
   - Attributes: review_id (PK), property_id (FK), user_id (FK), rating, comment
   - Relationships: Many-to-One with Property, Many-to-One with User

6. Message
   - Attributes: message_id (PK), sender_id (FK), recipient_id (FK), message_body
   - Relationships: Many-to-One with User (sender), Many-to-One with User (recipient)
