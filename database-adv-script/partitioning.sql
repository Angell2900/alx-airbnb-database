-- Partition Booking table by start_date (range partitioning)
CREATE TABLE Booking_Partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
) PARTITION BY RANGE (start_date);

-- Example partitions
CREATE TABLE Booking_2025 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2025-12-31');

CREATE TABLE Booking_2026 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2026-01-01') TO ('2026-12-31');
