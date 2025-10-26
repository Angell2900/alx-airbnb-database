# Database Implementation Documentation

## Schema Overview
The database schema implements a fully normalized (3NF) structure for an Airbnb-like application with the following main entities:
- Users (hosts and guests)
- Properties
- Bookings
- Payments
- Reviews
- Messages

## Implementation Details
1. All tables use UUID for primary keys
2. Appropriate foreign key constraints are implemented
3. Timestamps are automatically managed
4. Indexes are created for frequently queried columns

## Usage
1. Run schema.sql to create the database structure
2. Run seed.sql to populate with sample data
