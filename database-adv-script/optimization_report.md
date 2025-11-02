# Query Optimization Report

Initial query retrieved all bookings with users, properties, and payments. Using EXPLAIN ANALYZE, we noticed high cost due to multiple joins.

Optimizations applied:
- Added indexes on user_id, property_id, and email
- Removed redundant joins
- Query execution time reduced significantly
