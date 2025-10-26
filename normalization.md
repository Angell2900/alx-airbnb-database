# Database Normalization – Airbnb Database

## Step 1: First Normal Form (1NF)
Each table has a **primary key**, and every field has only **one piece of data** (atomic value).  
Example: The Property table has columns like `name`, `pricepernight`, and `location` — no repeating groups or lists.

## Step 2: Second Normal Form (2NF)
All **non-key columns** depend on the **whole primary key** (not just part of it).  
 Example: In the Booking table, `total_price` depends on both `property_id` and `user_id` together — not just one of them.

## Step 3: Third Normal Form (3NF)
There are **no transitive dependencies** — meaning non-key fields don’t depend on other non-key fields.  
 Example: In the Property table, `host_id` (foreign key) connects to the User table. The host’s email or name is stored in the User table — not repeated in Property.

---

### 🎯 Final Note
After normalization up to 3NF:
- Data redundancy is removed.
- Tables are linked through **foreign keys**.
- Updates, inserts, and deletions happen smoothly without data loss.
