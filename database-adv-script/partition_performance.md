# Partitioning Performance Report

Partitioned Booking table by start_date into 2025 and 2026 partitions.

Query performance:
- Fetching bookings by date range is faster
- Partitioning reduces scan on irrelevant dates
