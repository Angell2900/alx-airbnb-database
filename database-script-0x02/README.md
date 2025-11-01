# Database Seeding Documentation

## Sample Data Overview
The seed.sql file contains comprehensive sample data including:
- 8 users (mix of hosts, guests, and admin)
- 6 properties across different locations
- 4 bookings with various statuses
- 3 payments using different payment methods
- 3 property reviews
- 3 messages between users

## Usage
1. Ensure schema.sql has been executed first
2. Run seed.sql to populate the database
3. Verify data insertion with SELECT queries

## Data Relationships
- Properties are linked to host users
- Bookings connect guests to properties
- Payments are linked to bookings
- Reviews are tied to properties and users
- Messages maintain communication history
