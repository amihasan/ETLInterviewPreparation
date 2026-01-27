# Data Warehouse Interview Questions

## Table of Contents
1. [Data Warehouse Fundamentals](#data-warehouse-fundamentals)
2. [Dimensional Modeling](#dimensional-modeling)
3. [ETL/ELT Processes](#etlelt-processes)
4. [Slowly Changing Dimensions (SCD)](#slowly-changing-dimensions-scd)
5. [Star Schema vs Snowflake Schema](#star-schema-vs-snowflake-schema)
6. [Fact Tables & Dimension Tables](#fact-tables--dimension-tables)
7. [Data Warehouse Architecture](#data-warehouse-architecture)
8. [Performance & Optimization](#performance--optimization)
9. [Advanced Topics](#advanced-topics)
10. [Scenario-Based Questions](#scenario-based-questions)

---

## Data Warehouse Fundamentals

### Q1: What is a Data Warehouse? How is it different from a Database?
**Answer:**

**Data Warehouse:**
- Subject-oriented, integrated, time-variant, and non-volatile collection of data
- Designed for analytical processing (OLAP)
- Optimized for read-heavy operations
- Contains historical data from multiple sources
- Uses denormalized schemas (Star/Snowflake)
- Query response time may be slower but handles complex queries

**Database (OLTP):**
- Application-oriented
- Designed for transactional processing
- Optimized for write operations
- Contains current operational data
- Uses normalized schemas (3NF)
- Fast query response for simple transactions

**Key Differences:**
| Aspect | Data Warehouse (OLAP) | Database (OLTP) |
|--------|----------------------|-----------------|
| Purpose | Analysis & Reporting | Daily Operations |
| Data | Historical, Aggregated | Current, Detailed |
| Schema | Denormalized | Normalized |
| Queries | Complex, Read-heavy | Simple, Write-heavy |
| Users | Analysts, Managers | Applications, End-users |
| Updates | Batch/Scheduled | Real-time |

### Q2: What are the key characteristics of a Data Warehouse?
**Answer:**

1. **Subject-Oriented**: Organized around major subjects (customers, products, sales)
2. **Integrated**: Data from various sources in consistent format
3. **Time-Variant**: Historical data with time dimension
4. **Non-Volatile**: Data is stable, read-only (rarely updated)

**Example:**
```sql
-- Subject-oriented: Sales data warehouse
-- Fact table focused on sales transactions
CREATE TABLE fact_sales (
    sale_id INT,
    date_key INT,
    customer_key INT,
    product_key INT,
    store_key INT,
    quantity INT,
    amount DECIMAL(10,2),
    -- Time-variant: transaction date
    transaction_date DATE,
    -- Non-volatile: historical record preserved
    created_timestamp TIMESTAMP
);
```

### Q3: Explain the difference between OLAP and OLTP.
**Answer:**

**OLTP (Online Transaction Processing):**
- Handles day-to-day transactions
- INSERT, UPDATE, DELETE operations
- Highly normalized (3NF)
- Fast response time (milliseconds)
- Current data
- Example: E-commerce order processing

**OLAP (Online Analytical Processing):**
- Handles complex analytical queries
- SELECT operations with aggregations
- Denormalized (Star/Snowflake schema)
- Response time varies (seconds to minutes)
- Historical data
- Example: Sales trend analysis over 5 years

```sql
-- OLTP Query (Simple, fast)
INSERT INTO orders (customer_id, product_id, quantity, price)
VALUES (123, 456, 2, 99.99);

-- OLAP Query (Complex, analytical)
SELECT 
    d.year,
    d.quarter,
    p.category,
    SUM(f.quantity) as total_quantity,
    SUM(f.amount) as total_revenue,
    AVG(f.amount) as avg_order_value
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
JOIN dim_product p ON f.product_key = p.product_key
WHERE d.year IN (2020, 2021, 2022)
GROUP BY d.year, d.quarter, p.category
ORDER BY d.year, d.quarter;
```

### Q4: What is Data Mart? How is it different from Data Warehouse?
**Answer:**

**Data Mart:**
- Subset of data warehouse
- Focused on specific business area or department
- Smaller in size
- Serves specific user group
- Faster to implement
- Example: Sales Data Mart, Finance Data Mart

**Data Warehouse:**
- Enterprise-wide
- Contains all organizational data
- Larger in size
- Serves entire organization
- Takes longer to implement

**Types of Data Marts:**
1. **Dependent**: Created from existing data warehouse
2. **Independent**: Created directly from operational sources
3. **Hybrid**: Combination of both

```sql
-- Data Warehouse (Enterprise-wide)
CREATE TABLE fact_enterprise_sales (
    sale_id INT,
    date_key INT,
    customer_key INT,
    product_key INT,
    store_key INT,
    region_key INT,
    channel_key INT,
    quantity INT,
    amount DECIMAL(10,2)
);

-- Data Mart (Department-specific: Online Sales)
CREATE TABLE fact_online_sales (
    sale_id INT,
    date_key INT,
    customer_key INT,
    product_key INT,
    quantity INT,
    amount DECIMAL(10,2),
    website_session_key INT  -- Online-specific
);
```

---

## Dimensional Modeling

### Q5: What is Dimensional Modeling? What are its advantages?
**Answer:**

Dimensional modeling is a design technique optimized for data warehouses using:
- **Fact Tables**: Contain measurements/metrics
- **Dimension Tables**: Contain descriptive attributes

**Advantages:**
1. Easy to understand and navigate
2. Optimized for query performance
3. Flexible for business changes
4. Supports ad-hoc queries
5. Consistent with business terminology
6. Better query performance due to fewer joins

**Example:**
```sql
-- Fact Table (Measures/Metrics)
CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_key INT,
    customer_key INT,
    product_key INT,
    store_key INT,
    quantity INT,           -- Measure
    unit_price DECIMAL(10,2), -- Measure
    total_amount DECIMAL(10,2), -- Measure
    discount_amount DECIMAL(10,2), -- Measure
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key)
);

-- Dimension Table (Descriptive Attributes)
CREATE TABLE dim_product (
    product_key INT PRIMARY KEY,
    product_id VARCHAR(50),
    product_name VARCHAR(200),
    category VARCHAR(100),
    subcategory VARCHAR(100),
    brand VARCHAR(100),
    color VARCHAR(50),
    size VARCHAR(20),
    -- SCD Type 2 columns
    effective_date DATE,
    expiry_date DATE,
    is_current BOOLEAN
);
```

### Q6: What are Fact Tables and Dimension Tables?
**Answer:**

**Fact Tables:**
- Contain quantitative data (measures/metrics)
- Foreign keys to dimension tables
- Large number of rows
- Narrow (fewer columns)
- Store business events/transactions
- Examples: sales_amount, quantity, profit

**Dimension Tables:**
- Contain descriptive attributes
- Primary key referenced by fact tables
- Smaller number of rows
- Wide (many columns)
- Provide context to facts
- Examples: customer, product, date, location

```sql
-- Fact Table Example
CREATE TABLE fact_order_line_items (
    order_line_id INT PRIMARY KEY,
    order_date_key INT,
    customer_key INT,
    product_key INT,
    shipping_address_key INT,
    -- Measures
    quantity INT,
    unit_price DECIMAL(10,2),
    discount_percent DECIMAL(5,2),
    tax_amount DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    cost DECIMAL(10,2),
    profit DECIMAL(10,2)
);

-- Dimension Table Example
CREATE TABLE dim_customer (
    customer_key INT PRIMARY KEY,  -- Surrogate key
    customer_id VARCHAR(50),        -- Natural key
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(200),
    phone VARCHAR(20),
    gender VARCHAR(10),
    date_of_birth DATE,
    customer_segment VARCHAR(50),
    loyalty_tier VARCHAR(50),
    registration_date DATE,
    -- SCD Type 2
    effective_date DATE,
    expiry_date DATE,
    is_current BOOLEAN,
    created_timestamp TIMESTAMP,
    updated_timestamp TIMESTAMP
);
```

### Q7: What are the different types of Fact Tables?
**Answer:**

**1. Transaction Fact Table**
- One row per transaction/event
- Most granular level
- Example: Individual sales transactions

```sql
CREATE TABLE fact_sales_transaction (
    transaction_id INT PRIMARY KEY,
    transaction_datetime TIMESTAMP,
    date_key INT,
    time_key INT,
    customer_key INT,
    product_key INT,
    store_key INT,
    cashier_key INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);
```

**2. Periodic Snapshot Fact Table**
- One row per period (daily, weekly, monthly)
- Shows state at regular intervals
- Example: Daily account balance

```sql
CREATE TABLE fact_account_balance_daily (
    account_key INT,
    date_key INT,
    opening_balance DECIMAL(15,2),
    deposits DECIMAL(15,2),
    withdrawals DECIMAL(15,2),
    closing_balance DECIMAL(15,2),
    average_balance DECIMAL(15,2),
    PRIMARY KEY (account_key, date_key)
);
```

**3. Accumulating Snapshot Fact Table**
- One row per process/workflow
- Updated as process progresses
- Multiple date columns for milestones
- Example: Order fulfillment pipeline

```sql
CREATE TABLE fact_order_fulfillment (
    order_key INT PRIMARY KEY,
    customer_key INT,
    product_key INT,
    -- Multiple date keys for process stages
    order_date_key INT,
    payment_date_key INT,
    shipment_date_key INT,
    delivery_date_key INT,
    -- Lag measures (days between stages)
    payment_lag_days INT,
    fulfillment_lag_days INT,
    delivery_lag_days INT,
    -- Status
    current_status VARCHAR(50),
    last_updated_timestamp TIMESTAMP
);
```

**4. Factless Fact Table**
- No measures, only foreign keys
- Records events or relationships
- Example: Student attendance, promotional coverage

```sql
-- Student Course Enrollment (Event tracking)
CREATE TABLE fact_student_attendance (
    attendance_id INT PRIMARY KEY,
    date_key INT,
    student_key INT,
    course_key INT,
    class_key INT,
    instructor_key INT,
    -- No measures, just presence/absence event
    attendance_flag BOOLEAN
);

-- Promotional Coverage (Coverage/Eligibility)
CREATE TABLE fact_promotion_coverage (
    date_key INT,
    product_key INT,
    store_key INT,
    promotion_key INT,
    -- No measures, just indicates product was on promotion
    PRIMARY KEY (date_key, product_key, store_key, promotion_key)
);
```

---

## ETL/ELT Processes

### Q8: What is ETL? Explain each component.
**Answer:**

**ETL = Extract, Transform, Load**

**1. Extract:**
- Pull data from source systems
- Sources: Databases, files, APIs, web services
- Methods: Full load, incremental load, CDC (Change Data Capture)

```sql
-- Extract example: Pull new orders since last run
SELECT order_id, customer_id, order_date, amount
FROM source_system.orders
WHERE created_date >= '2026-01-27 00:00:00';
```

**2. Transform:**
- Clean, validate, and convert data
- Data quality checks
- Business rule application
- Aggregations and calculations
- Lookups and joins

```sql
-- Transform example: Cleanse and standardize
SELECT 
    order_id,
    customer_id,
    CAST(order_date AS DATE) as order_date,
    -- Cleanse phone numbers
    REGEXP_REPLACE(phone, '[^0-9]', '') as clean_phone,
    -- Standardize country codes
    CASE 
        WHEN country IN ('US', 'USA', 'United States') THEN 'USA'
        WHEN country IN ('UK', 'United Kingdom', 'GB') THEN 'GBR'
        ELSE UPPER(country)
    END as standardized_country,
    -- Calculate total with tax
    amount * (1 + tax_rate) as total_with_tax
FROM staging.orders
WHERE order_date IS NOT NULL
  AND amount > 0;
```

**3. Load:**
- Insert data into target data warehouse
- Methods: Full load, incremental load, upsert (merge)
- Strategies: Truncate and load, append, SCD handling

```sql
-- Load example: Incremental load with merge
MERGE INTO dwh.fact_sales AS target
USING staging.sales AS source
ON target.order_id = source.order_id
WHEN MATCHED THEN
    UPDATE SET 
        quantity = source.quantity,
        amount = source.amount,
        updated_date = CURRENT_TIMESTAMP
WHEN NOT MATCHED THEN
    INSERT (order_id, date_key, customer_key, product_key, quantity, amount)
    VALUES (source.order_id, source.date_key, source.customer_key, 
            source.product_key, source.quantity, source.amount);
```

### Q9: What is the difference between ETL and ELT?
**Answer:**

**ETL (Extract, Transform, Load):**
- Transform happens before loading
- Uses separate ETL server/tool
- Better for complex transformations
- Less load on data warehouse
- Traditional approach
- Tools: Informatica, SSIS, Talend, DataStage

**ELT (Extract, Load, Transform):**
- Load raw data first, transform in warehouse
- Leverages data warehouse compute power
- Better for big data and cloud platforms
- More flexible for exploratory analysis
- Modern approach
- Tools: Snowflake, BigQuery, Redshift, Databricks

```sql
-- ETL Approach: Transform before load
-- Step 1: Extract and transform in ETL tool
-- Step 2: Load final clean data
INSERT INTO dwh.fact_sales (date_key, customer_key, product_key, amount)
SELECT date_key, customer_key, product_key, final_amount
FROM etl_staging.processed_sales;

-- ELT Approach: Load raw data, transform in warehouse
-- Step 1: Load raw data
INSERT INTO dwh.raw_sales SELECT * FROM source.sales;

-- Step 2: Transform in warehouse using SQL
CREATE TABLE dwh.fact_sales AS
SELECT 
    d.date_key,
    c.customer_key,
    p.product_key,
    SUM(r.quantity) as total_quantity,
    SUM(r.amount) as total_amount
FROM dwh.raw_sales r
JOIN dwh.dim_date d ON r.order_date = d.date
JOIN dwh.dim_customer c ON r.customer_id = c.customer_id
JOIN dwh.dim_product p ON r.product_id = p.product_id
GROUP BY d.date_key, c.customer_key, p.product_key;
```

### Q10: What is CDC (Change Data Capture)? What are different CDC methods?
**Answer:**

**CDC** tracks changes in source systems to extract only modified data (incremental loading).

**CDC Methods:**

**1. Timestamp-Based:**
```sql
-- Extract records modified since last run
SELECT * FROM source.customers
WHERE updated_timestamp > '2026-01-27 00:00:00';
```

**2. Trigger-Based:**
```sql
-- Create trigger to capture changes
CREATE TRIGGER customer_changes_trigger
AFTER INSERT OR UPDATE OR DELETE ON customers
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO cdc_changes VALUES (NEW.customer_id, 'INSERT', SYSDATE);
    ELSIF UPDATING THEN
        INSERT INTO cdc_changes VALUES (NEW.customer_id, 'UPDATE', SYSDATE);
    ELSIF DELETING THEN
        INSERT INTO cdc_changes VALUES (OLD.customer_id, 'DELETE', SYSDATE);
    END IF;
END;
```

**3. Log-Based (Database Logs):**
- Reads transaction logs
- Most efficient and least intrusive
- Tools: Oracle GoldenGate, Debezium, AWS DMS

**4. Version Number:**
```sql
-- Track changes using version column
SELECT * FROM source.products
WHERE version_number > :last_processed_version;
```

**5. Full Comparison (Hash/Checksum):**
```sql
-- Compare hash values to detect changes
SELECT s.*
FROM source.products s
LEFT JOIN dwh.dim_product t ON s.product_id = t.product_id
WHERE MD5(CONCAT(s.name, s.price, s.category)) != t.record_hash
   OR t.product_id IS NULL;
```

---

## Slowly Changing Dimensions (SCD)

### Q11: What are Slowly Changing Dimensions? Explain different types.
**Answer:**

**SCD** handles changes in dimension attributes over time.

**Type 0: Retain Original**
- Never change original value
- Ignore updates

```sql
CREATE TABLE dim_product_type0 (
    product_key INT PRIMARY KEY,
    product_id VARCHAR(50),
    original_category VARCHAR(100),  -- Never changes
    current_price DECIMAL(10,2)      -- Can change
);
```

**Type 1: Overwrite**
- Update existing record
- No history maintained
- Current values only

```sql
-- Update existing record (no history)
UPDATE dim_customer
SET email = 'newemail@example.com',
    phone = '555-9999',
    updated_timestamp = CURRENT_TIMESTAMP
WHERE customer_id = 'C12345';
```

**Type 2: Add New Row**
- Maintain full history
- Add new row for each change
- Most common approach

```sql
CREATE TABLE dim_customer_type2 (
    customer_key INT PRIMARY KEY,      -- Surrogate key
    customer_id VARCHAR(50),            -- Natural key
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(200),
    address VARCHAR(500),
    city VARCHAR(100),
    -- SCD Type 2 columns
    effective_date DATE,
    expiry_date DATE,
    is_current BOOLEAN,
    version INT
);

-- Insert new row for change
INSERT INTO dim_customer_type2 
    (customer_key, customer_id, first_name, last_name, email, address, 
     effective_date, expiry_date, is_current, version)
VALUES 
    (2002, 'C12345', 'John', 'Doe', 'john.new@email.com', '456 New St',
     '2026-01-27', '9999-12-31', TRUE, 2);

-- Expire old row
UPDATE dim_customer_type2
SET expiry_date = '2026-01-26',
    is_current = FALSE
WHERE customer_id = 'C12345' AND is_current = TRUE;
```

**Type 3: Add New Column**
- Limited history (current + previous)
- Additional columns for previous values

```sql
CREATE TABLE dim_product_type3 (
    product_key INT PRIMARY KEY,
    product_id VARCHAR(50),
    product_name VARCHAR(200),
    current_category VARCHAR(100),
    previous_category VARCHAR(100),
    category_change_date DATE,
    current_price DECIMAL(10,2),
    previous_price DECIMAL(10,2),
    price_change_date DATE
);

-- Update with previous value
UPDATE dim_product_type3
SET previous_category = current_category,
    current_category = 'New Category',
    category_change_date = CURRENT_DATE
WHERE product_id = 'P12345';
```

**Type 4: History Table**
- Current data in main table
- History in separate table

```sql
-- Current table
CREATE TABLE dim_customer_current (
    customer_key INT PRIMARY KEY,
    customer_id VARCHAR(50),
    first_name VARCHAR(100),
    email VARCHAR(200)
);

-- History table
CREATE TABLE dim_customer_history (
    history_id INT PRIMARY KEY,
    customer_key INT,
    customer_id VARCHAR(50),
    first_name VARCHAR(100),
    email VARCHAR(200),
    effective_date DATE,
    expiry_date DATE
);
```

**Type 6: Hybrid (1+2+3)**
- Combines Type 1, 2, and 3
- Current value, previous value, and full history

```sql
CREATE TABLE dim_customer_type6 (
    customer_key INT PRIMARY KEY,
    customer_id VARCHAR(50),
    -- Current values (Type 1)
    current_email VARCHAR(200),
    current_address VARCHAR(500),
    -- Previous values (Type 3)
    previous_email VARCHAR(200),
    previous_address VARCHAR(500),
    -- History tracking (Type 2)
    effective_date DATE,
    expiry_date DATE,
    is_current BOOLEAN
);
```

### Q12: How do you implement SCD Type 2 in SQL?
**Answer:**

```sql
-- Step 1: Create dimension table with SCD Type 2 structure
CREATE TABLE dim_customer (
    customer_key INT PRIMARY KEY AUTO_INCREMENT,
    customer_id VARCHAR(50),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(200),
    city VARCHAR(100),
    state VARCHAR(50),
    effective_date DATE,
    expiry_date DATE,
    is_current BOOLEAN,
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 2: Implement SCD Type 2 logic
-- Expire existing current record
UPDATE dim_customer
SET expiry_date = CURRENT_DATE - INTERVAL '1 DAY',
    is_current = FALSE
WHERE customer_id = :source_customer_id
  AND is_current = TRUE
  AND (email != :source_email OR city != :source_city OR state != :source_state);

-- Insert new record with changes
INSERT INTO dim_customer 
    (customer_id, first_name, last_name, email, city, state, 
     effective_date, expiry_date, is_current)
SELECT 
    customer_id,
    first_name,
    last_name,
    email,
    city,
    state,
    CURRENT_DATE as effective_date,
    DATE '9999-12-31' as expiry_date,
    TRUE as is_current
FROM staging.customer_updates
WHERE NOT EXISTS (
    SELECT 1 FROM dim_customer d
    WHERE d.customer_id = staging.customer_updates.customer_id
      AND d.is_current = TRUE
      AND d.email = staging.customer_updates.email
      AND d.city = staging.customer_updates.city
      AND d.state = staging.customer_updates.state
);

-- Step 3: Query with point-in-time
SELECT 
    f.order_date,
    f.amount,
    c.customer_id,
    c.email,
    c.city,
    c.state
FROM fact_sales f
JOIN dim_customer c ON f.customer_key = c.customer_key
WHERE f.order_date BETWEEN c.effective_date AND c.expiry_date;
```

---

## Star Schema vs Snowflake Schema

### Q13: What is Star Schema? What are its advantages?
**Answer:**

**Star Schema:**
- Central fact table surrounded by dimension tables
- Denormalized dimension tables
- Simple structure (looks like a star)

**Advantages:**
1. Simpler queries (fewer joins)
2. Better query performance
3. Easy to understand
4. Optimized for OLAP
5. Easier maintenance

```sql
-- Star Schema Example

-- Central Fact Table
CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_key INT,
    customer_key INT,
    product_key INT,
    store_key INT,
    quantity INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key)
);

-- Denormalized Dimension Tables
CREATE TABLE dim_product (
    product_key INT PRIMARY KEY,
    product_id VARCHAR(50),
    product_name VARCHAR(200),
    category VARCHAR(100),        -- Denormalized
    subcategory VARCHAR(100),     -- Denormalized
    brand VARCHAR(100),           -- Denormalized
    brand_manager VARCHAR(100),   -- Denormalized
    supplier_name VARCHAR(200),   -- Denormalized
    supplier_country VARCHAR(50)  -- Denormalized
);

CREATE TABLE dim_customer (
    customer_key INT PRIMARY KEY,
    customer_id VARCHAR(50),
    customer_name VARCHAR(200),
    city VARCHAR(100),            -- Denormalized
    state VARCHAR(50),            -- Denormalized
    country VARCHAR(50),          -- Denormalized
    region VARCHAR(50),           -- Denormalized
    customer_segment VARCHAR(50)  -- Denormalized
);

-- Simple query with fewer joins
SELECT 
    d.year,
    p.category,
    c.region,
    SUM(f.amount) as total_sales
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
JOIN dim_product p ON f.product_key = p.product_key
JOIN dim_customer c ON f.customer_key = c.customer_key
WHERE d.year = 2025
GROUP BY d.year, p.category, c.region;
```

### Q14: What is Snowflake Schema? How is it different from Star Schema?
**Answer:**

**Snowflake Schema:**
- Normalized dimension tables
- Dimension tables split into sub-dimensions
- More complex structure

**Star vs Snowflake:**

| Aspect | Star Schema | Snowflake Schema |
|--------|-------------|------------------|
| Normalization | Denormalized | Normalized |
| Complexity | Simple | Complex |
| Joins | Fewer | More |
| Query Performance | Faster | Slower |
| Storage | More space | Less space |
| Maintenance | Easier | Harder |
| Data Redundancy | Higher | Lower |

```sql
-- Snowflake Schema Example

-- Fact Table (Same as Star)
CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_key INT,
    customer_key INT,
    product_key INT,
    store_key INT,
    quantity INT,
    amount DECIMAL(10,2)
);

-- Normalized Product Dimension
CREATE TABLE dim_product (
    product_key INT PRIMARY KEY,
    product_id VARCHAR(50),
    product_name VARCHAR(200),
    subcategory_key INT,          -- Foreign key to subcategory
    brand_key INT,                -- Foreign key to brand
    supplier_key INT,             -- Foreign key to supplier
    FOREIGN KEY (subcategory_key) REFERENCES dim_subcategory(subcategory_key),
    FOREIGN KEY (brand_key) REFERENCES dim_brand(brand_key),
    FOREIGN KEY (supplier_key) REFERENCES dim_supplier(supplier_key)
);

CREATE TABLE dim_subcategory (
    subcategory_key INT PRIMARY KEY,
    subcategory_name VARCHAR(100),
    category_key INT,             -- Foreign key to category
    FOREIGN KEY (category_key) REFERENCES dim_category(category_key)
);

CREATE TABLE dim_category (
    category_key INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE dim_brand (
    brand_key INT PRIMARY KEY,
    brand_name VARCHAR(100),
    brand_manager VARCHAR(100)
);

CREATE TABLE dim_supplier (
    supplier_key INT PRIMARY KEY,
    supplier_name VARCHAR(200),
    supplier_country VARCHAR(50)
);

-- Normalized Customer Dimension
CREATE TABLE dim_customer (
    customer_key INT PRIMARY KEY,
    customer_id VARCHAR(50),
    customer_name VARCHAR(200),
    city_key INT,                 -- Foreign key to city
    segment_key INT,              -- Foreign key to segment
    FOREIGN KEY (city_key) REFERENCES dim_city(city_key),
    FOREIGN KEY (segment_key) REFERENCES dim_customer_segment(segment_key)
);

CREATE TABLE dim_city (
    city_key INT PRIMARY KEY,
    city_name VARCHAR(100),
    state_key INT,                -- Foreign key to state
    FOREIGN KEY (state_key) REFERENCES dim_state(state_key)
);

CREATE TABLE dim_state (
    state_key INT PRIMARY KEY,
    state_name VARCHAR(50),
    country_key INT,              -- Foreign key to country
    region VARCHAR(50),
    FOREIGN KEY (country_key) REFERENCES dim_country(country_key)
);

CREATE TABLE dim_country (
    country_key INT PRIMARY KEY,
    country_name VARCHAR(50)
);

-- Complex query with more joins
SELECT 
    d.year,
    cat.category_name,
    co.country_name,
    SUM(f.amount) as total_sales
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
JOIN dim_product p ON f.product_key = p.product_key
JOIN dim_subcategory sub ON p.subcategory_key = sub.subcategory_key
JOIN dim_category cat ON sub.category_key = cat.category_key
JOIN dim_customer c ON f.customer_key = c.customer_key
JOIN dim_city ci ON c.city_key = ci.city_key
JOIN dim_state s ON ci.state_key = s.state_key
JOIN dim_country co ON s.country_key = co.country_key
WHERE d.year = 2025
GROUP BY d.year, cat.category_name, co.country_name;
```

---

## Fact Tables & Dimension Tables

### Q15: What is a Surrogate Key? Why is it used?
**Answer:**

**Surrogate Key:**
- System-generated unique identifier
- Usually an auto-incrementing integer
- No business meaning
- Used as primary key in dimension tables

**Natural Key:**
- Business identifier from source system
- Has business meaning
- Example: Customer ID, Product Code

**Why Use Surrogate Keys:**
1. Performance: Integer joins faster than string joins
2. SCD Type 2: Allows multiple versions of same natural key
3. Integration: Handles data from multiple sources with same natural key
4. Independence: Protects from source system changes
5. Consistency: Uniform key structure across all dimensions

```sql
-- Without Surrogate Key (Natural Key only)
CREATE TABLE dim_customer_natural (
    customer_id VARCHAR(50) PRIMARY KEY,  -- Natural key
    customer_name VARCHAR(200),
    email VARCHAR(200),
    city VARCHAR(100)
);

-- Problem: Can't handle SCD Type 2 with natural key
-- Can only have one row per customer_id

-- With Surrogate Key (Recommended)
CREATE TABLE dim_customer (
    customer_key INT PRIMARY KEY AUTO_INCREMENT,  -- Surrogate key
    customer_id VARCHAR(50),                       -- Natural key
    customer_name VARCHAR(200),
    email VARCHAR(200),
    city VARCHAR(100),
    effective_date DATE,
    expiry_date DATE,
    is_current BOOLEAN,
    INDEX idx_customer_id (customer_id)
);

-- Can have multiple versions of same customer
INSERT INTO dim_customer VALUES
(1, 'C001', 'John Doe', 'john@old.com', 'Boston', '2023-01-01', '2024-12-31', FALSE),
(2, 'C001', 'John Doe', 'john@new.com', 'New York', '2025-01-01', '9999-12-31', TRUE);

-- Fact table uses surrogate key
CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    customer_key INT,  -- References surrogate key, not natural key
    product_key INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key)
);
```

### Q16: What is a Degenerate Dimension?
**Answer:**

**Degenerate Dimension:**
- Dimension key stored in fact table without corresponding dimension table
- Acts as dimension but has no attributes
- Typically transaction identifiers
- Common examples: Order Number, Invoice Number, Ticket Number

```sql
-- Fact table with degenerate dimensions
CREATE TABLE fact_order_line_items (
    order_line_id INT PRIMARY KEY,
    -- Regular dimension keys
    date_key INT,
    customer_key INT,
    product_key INT,
    -- Degenerate dimensions (no separate dimension table)
    order_number VARCHAR(50),       -- Degenerate dimension
    invoice_number VARCHAR(50),     -- Degenerate dimension
    purchase_order_number VARCHAR(50), -- Degenerate dimension
    -- Measures
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);

-- Query using degenerate dimension
SELECT 
    order_number,
    SUM(quantity) as total_quantity,
    SUM(total_amount) as total_amount
FROM fact_order_line_items
WHERE order_number = 'ORD-2026-0001'
GROUP BY order_number;

-- All line items for an order
SELECT *
FROM fact_order_line_items
WHERE order_number = 'ORD-2026-0001';
```

### Q17: What is a Conformed Dimension?
**Answer:**

**Conformed Dimension:**
- Dimension shared across multiple fact tables or data marts
- Same structure and content in all places
- Enables consistent reporting across business areas
- Example: Date dimension, Customer dimension, Product dimension

**Benefits:**
1. Consistent definitions across organization
2. Enables cross-functional analysis
3. Reduces development time
4. Easier maintenance
5. Single version of truth

```sql
-- Conformed Date Dimension (used by multiple fact tables)
CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    date DATE UNIQUE,
    year INT,
    quarter INT,
    month INT,
    month_name VARCHAR(20),
    week_of_year INT,
    day_of_month INT,
    day_of_week INT,
    day_name VARCHAR(20),
    is_weekend BOOLEAN,
    is_holiday BOOLEAN,
    fiscal_year INT,
    fiscal_quarter INT,
    fiscal_month INT
);

-- Fact Table 1: Sales
CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_key INT,  -- References conformed dim_date
    customer_key INT,
    product_key INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);

-- Fact Table 2: Inventory
CREATE TABLE fact_inventory (
    inventory_id INT PRIMARY KEY,
    date_key INT,  -- References same conformed dim_date
    product_key INT,
    warehouse_key INT,
    quantity_on_hand INT,
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);

-- Fact Table 3: Website Traffic
CREATE TABLE fact_web_traffic (
    session_id INT PRIMARY KEY,
    date_key INT,  -- References same conformed dim_date
    visitor_key INT,
    page_views INT,
    duration_seconds INT,
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);

-- Cross-functional analysis using conformed dimension
SELECT 
    d.date,
    d.day_name,
    SUM(s.amount) as total_sales,
    SUM(i.quantity_on_hand) as total_inventory,
    SUM(w.page_views) as total_page_views
FROM dim_date d
LEFT JOIN fact_sales s ON d.date_key = s.date_key
LEFT JOIN fact_inventory i ON d.date_key = i.date_key
LEFT JOIN fact_web_traffic w ON d.date_key = w.date_key
WHERE d.date BETWEEN '2026-01-01' AND '2026-01-31'
GROUP BY d.date, d.day_name
ORDER BY d.date;
```

---

## Data Warehouse Architecture

### Q18: Explain different Data Warehouse architectures.
**Answer:**

**1. Single-Tier Architecture:**
- Minimalist approach
- No separation between operational and analytical
- Rarely used

**2. Two-Tier Architecture:**
- Source systems → Data Warehouse
- Direct load without staging
- Limited transformation capability

**3. Three-Tier Architecture (Most Common):**

```
┌─────────────────┐
│ Source Systems  │  Tier 1: Data Sources
│ (OLTP, Files,   │
│  APIs, etc.)    │
└────────┬────────┘
         │ Extract
         ▼
┌─────────────────┐
│ Staging Area    │  Tier 2: Data Storage & Processing
│ & ETL           │  - Staging tables
│                 │  - Data cleansing
│ ┌─────────────┐ │  - Transformation
│ │ Data        │ │  - Integration
│ │ Warehouse   │ │
│ │  - Facts    │ │
│ │  - Dims     │ │
│ └─────────────┘ │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Presentation    │  Tier 3: Data Delivery
│ Layer           │  - Data Marts
│ - Data Marts    │  - OLAP Cubes
│ - Reports       │  - Reporting tools
│ - Dashboards    │  - BI applications
└─────────────────┘
```

**4. Hub-and-Spoke (Inmon Architecture):**
- Enterprise Data Warehouse (hub)
- Multiple Data Marts (spokes)
- Top-down approach

**5. Data Mart Bus (Kimball Architecture):**
- Bottom-up approach
- Start with data marts
- Use conformed dimensions
- Integrate over time

**6. Modern Cloud Architecture:**
```
┌──────────────────────────────────────┐
│        Data Sources (Tier 1)         │
│  OLTP │ SaaS │ IoT │ Logs │ Files   │
└─────────────────┬────────────────────┘
                  │
         ┌────────▼────────┐
         │  Cloud Storage  │  (Data Lake)
         │  (S3, Azure     │
         │   Blob, GCS)    │
         └────────┬────────┘
                  │
    ┌─────────────▼──────────────┐
    │  Cloud Data Warehouse      │
    │  (Snowflake, Redshift,     │
    │   BigQuery, Synapse)       │
    │  - Data loading            │
    │  - Transformation          │
    │  - Analytics               │
    └─────────────┬──────────────┘
                  │
    ┌─────────────▼──────────────┐
    │    BI & Analytics Layer    │
    │  Tableau │ PowerBI │ Looker│
    └────────────────────────────┘
```

### Q19: What is Data Lake? How is it different from Data Warehouse?
**Answer:**

**Data Lake:**
- Stores raw data in native format
- Schema-on-read
- Supports structured, semi-structured, unstructured data
- More flexible, less governed
- Lower cost
- Used for exploratory analysis, ML

**Data Warehouse:**
- Stores processed, structured data
- Schema-on-write
- Only structured data
- More governed, business-ready
- Higher cost
- Used for reporting, BI

| Aspect | Data Lake | Data Warehouse |
|--------|-----------|----------------|
| Data Type | All types | Structured only |
| Schema | Schema-on-read | Schema-on-write |
| Processing | ELT | ETL |
| Storage Cost | Lower | Higher |
| Query Performance | Slower | Faster |
| Users | Data scientists | Business analysts |
| Agility | High | Lower |
| Data Quality | Variable | High |

**Modern Approach: Data Lakehouse**
- Combines benefits of both
- Structured + flexibility
- Examples: Databricks, Snowflake

---

## Performance & Optimization

### Q20: How do you optimize Data Warehouse query performance?
**Answer:**

**1. Partitioning:**
```sql
-- Partition fact table by date
CREATE TABLE fact_sales (
    sale_id INT,
    sale_date DATE,
    customer_key INT,
    product_key INT,
    amount DECIMAL(10,2)
)
PARTITION BY RANGE (YEAR(sale_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION p2026 VALUES LESS THAN (2027)
);

-- Query benefits from partition pruning
SELECT SUM(amount)
FROM fact_sales
WHERE sale_date BETWEEN '2025-01-01' AND '2025-12-31';
-- Only scans p2025 partition
```

**2. Indexing:**
```sql
-- Create indexes on foreign keys
CREATE INDEX idx_date_key ON fact_sales(date_key);
CREATE INDEX idx_customer_key ON fact_sales(customer_key);
CREATE INDEX idx_product_key ON fact_sales(product_key);

-- Composite index for common query patterns
CREATE INDEX idx_date_customer ON fact_sales(date_key, customer_key);

-- Covering index (includes all columns needed)
CREATE INDEX idx_sales_covering 
ON fact_sales(date_key, customer_key, product_key, amount);
```

**3. Materialized Views / Aggregates:**
```sql
-- Pre-aggregate common queries
CREATE MATERIALIZED VIEW mv_sales_daily AS
SELECT 
    date_key,
    product_key,
    SUM(quantity) as total_quantity,
    SUM(amount) as total_amount,
    COUNT(*) as transaction_count
FROM fact_sales
GROUP BY date_key, product_key;

-- Refresh periodically
REFRESH MATERIALIZED VIEW mv_sales_daily;
```

**4. Columnar Storage:**
- Use columnar format (Parquet, ORC)
- Better compression
- Read only needed columns

**5. Compression:**
```sql
-- Enable table compression
ALTER TABLE fact_sales COMPRESS;
```

**6. Statistics:**
```sql
-- Gather statistics for optimizer
ANALYZE TABLE fact_sales;
ANALYZE TABLE dim_product;
```

**7. Query Optimization:**
```sql
-- Bad: Uses function on indexed column
SELECT * FROM fact_sales 
WHERE YEAR(sale_date) = 2025;

-- Good: Uses range condition
SELECT * FROM fact_sales 
WHERE sale_date >= '2025-01-01' AND sale_date < '2026-01-01';

-- Bad: SELECT *
SELECT * FROM fact_sales;

-- Good: Select only needed columns
SELECT date_key, product_key, amount FROM fact_sales;
```

---

## Advanced Topics

### Q21: What is a Data Vault? When would you use it?
**Answer:**

**Data Vault:**
- Modeling methodology for data warehouses
- Designed for agility, scalability, and auditability
- Consists of three core components:

**1. Hubs**: Business keys
**2. Links**: Relationships between hubs
**3. Satellites**: Descriptive attributes and history

```sql
-- Hub: Business key
CREATE TABLE hub_customer (
    customer_hub_key INT PRIMARY KEY AUTO_INCREMENT,
    customer_id VARCHAR(50) UNIQUE,  -- Business key
    load_date TIMESTAMP,
    record_source VARCHAR(100)
);

-- Hub: Product
CREATE TABLE hub_product (
    product_hub_key INT PRIMARY KEY AUTO_INCREMENT,
    product_id VARCHAR(50) UNIQUE,  -- Business key
    load_date TIMESTAMP,
    record_source VARCHAR(100)
);

-- Link: Customer-Product relationship (Purchase)
CREATE TABLE link_purchase (
    purchase_link_key INT PRIMARY KEY AUTO_INCREMENT,
    customer_hub_key INT,
    product_hub_key INT,
    load_date TIMESTAMP,
    record_source VARCHAR(100),
    FOREIGN KEY (customer_hub_key) REFERENCES hub_customer(customer_hub_key),
    FOREIGN KEY (product_hub_key) REFERENCES hub_product(product_hub_key)
);

-- Satellite: Customer attributes
CREATE TABLE sat_customer (
    customer_sat_key INT PRIMARY KEY AUTO_INCREMENT,
    customer_hub_key INT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(200),
    phone VARCHAR(20),
    load_date TIMESTAMP,
    load_end_date TIMESTAMP,
    record_source VARCHAR(100),
    FOREIGN KEY (customer_hub_key) REFERENCES hub_customer(customer_hub_key)
);

-- Satellite: Product attributes
CREATE TABLE sat_product (
    product_sat_key INT PRIMARY KEY AUTO_INCREMENT,
    product_hub_key INT,
    product_name VARCHAR(200),
    category VARCHAR(100),
    price DECIMAL(10,2),
    load_date TIMESTAMP,
    load_end_date TIMESTAMP,
    record_source VARCHAR(100),
    FOREIGN KEY (product_hub_key) REFERENCES hub_product(product_hub_key)
);

-- Satellite: Purchase details
CREATE TABLE sat_purchase (
    purchase_sat_key INT PRIMARY KEY AUTO_INCREMENT,
    purchase_link_key INT,
    purchase_date DATE,
    quantity INT,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    load_date TIMESTAMP,
    record_source VARCHAR(100),
    FOREIGN KEY (purchase_link_key) REFERENCES link_purchase(purchase_link_key)
);
```

**When to Use Data Vault:**
- Multiple source systems
- Frequently changing sources
- Audit requirements
- Agile development
- Complex integration scenarios

**Advantages:**
- Highly auditable
- Flexible for changes
- Parallel loading
- Handles multiple sources well

**Disadvantages:**
- More complex than star schema
- More joins required for queries
- Requires additional layer for reporting

---

## Scenario-Based Questions

### Q22: Design a data warehouse for an e-commerce company.
**Answer:**

```sql
-- Date Dimension (Conformed)
CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    date DATE,
    year INT,
    quarter INT,
    month INT,
    month_name VARCHAR(20),
    week_of_year INT,
    day_of_month INT,
    day_of_week INT,
    day_name VARCHAR(20),
    is_weekend BOOLEAN,
    is_holiday BOOLEAN,
    holiday_name VARCHAR(100),
    fiscal_year INT,
    fiscal_quarter INT
);

-- Customer Dimension (SCD Type 2)
CREATE TABLE dim_customer (
    customer_key INT PRIMARY KEY AUTO_INCREMENT,
    customer_id VARCHAR(50),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(200),
    phone VARCHAR(20),
    gender VARCHAR(10),
    date_of_birth DATE,
    customer_segment VARCHAR(50),
    loyalty_tier VARCHAR(50),
    registration_date DATE,
    -- Address attributes
    address_line1 VARCHAR(255),
    address_line2 VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    zip_code VARCHAR(20),
    country VARCHAR(50),
    -- SCD Type 2
    effective_date DATE,
    expiry_date DATE,
    is_current BOOLEAN,
    version INT,
    created_timestamp TIMESTAMP,
    updated_timestamp TIMESTAMP
);

-- Product Dimension (SCD Type 2)
CREATE TABLE dim_product (
    product_key INT PRIMARY KEY AUTO_INCREMENT,
    product_id VARCHAR(50),
    product_name VARCHAR(200),
    description TEXT,
    category VARCHAR(100),
    subcategory VARCHAR(100),
    brand VARCHAR(100),
    color VARCHAR(50),
    size VARCHAR(20),
    weight DECIMAL(10,2),
    unit_of_measure VARCHAR(20),
    cost DECIMAL(10,2),
    list_price DECIMAL(10,2),
    -- SCD Type 2
    effective_date DATE,
    expiry_date DATE,
    is_current BOOLEAN
);

-- Promotion Dimension
CREATE TABLE dim_promotion (
    promotion_key INT PRIMARY KEY AUTO_INCREMENT,
    promotion_id VARCHAR(50),
    promotion_name VARCHAR(200),
    promotion_type VARCHAR(50),
    discount_percent DECIMAL(5,2),
    start_date DATE,
    end_date DATE,
    is_active BOOLEAN
);

-- Payment Method Dimension
CREATE TABLE dim_payment_method (
    payment_method_key INT PRIMARY KEY AUTO_INCREMENT,
    payment_method_code VARCHAR(20),
    payment_method_name VARCHAR(100),
    payment_type VARCHAR(50)  -- Credit Card, Debit Card, PayPal, etc.
);

-- Shipping Method Dimension
CREATE TABLE dim_shipping_method (
    shipping_method_key INT PRIMARY KEY AUTO_INCREMENT,
    shipping_method_code VARCHAR(20),
    shipping_method_name VARCHAR(100),
    estimated_days INT
);

-- Order Status Dimension
CREATE TABLE dim_order_status (
    order_status_key INT PRIMARY KEY AUTO_INCREMENT,
    status_code VARCHAR(20),
    status_name VARCHAR(50),
    status_category VARCHAR(50)
);

-- Fact: Order Headers (Accumulating Snapshot)
CREATE TABLE fact_orders (
    order_key INT PRIMARY KEY AUTO_INCREMENT,
    order_number VARCHAR(50),  -- Degenerate dimension
    -- Date keys for order lifecycle
    order_date_key INT,
    payment_date_key INT,
    ship_date_key INT,
    delivery_date_key INT,
    -- Other dimension keys
    customer_key INT,
    shipping_address_key INT,
    payment_method_key INT,
    shipping_method_key INT,
    order_status_key INT,
    promotion_key INT,
    -- Measures
    subtotal DECIMAL(10,2),
    tax_amount DECIMAL(10,2),
    shipping_cost DECIMAL(10,2),
    discount_amount DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    item_count INT,
    -- Lag measures
    payment_lag_days INT,
    fulfillment_lag_days INT,
    delivery_lag_days INT,
    -- Timestamps
    created_timestamp TIMESTAMP,
    updated_timestamp TIMESTAMP,
    -- Foreign keys
    FOREIGN KEY (order_date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    FOREIGN KEY (payment_method_key) REFERENCES dim_payment_method(payment_method_key),
    FOREIGN KEY (shipping_method_key) REFERENCES dim_shipping_method(shipping_method_key),
    FOREIGN KEY (order_status_key) REFERENCES dim_order_status(order_status_key)
);

-- Fact: Order Line Items (Transaction)
CREATE TABLE fact_order_line_items (
    order_line_key INT PRIMARY KEY AUTO_INCREMENT,
    order_number VARCHAR(50),  -- Degenerate dimension
    line_number INT,
    order_date_key INT,
    customer_key INT,
    product_key INT,
    promotion_key INT,
    -- Measures
    quantity INT,
    unit_price DECIMAL(10,2),
    unit_cost DECIMAL(10,2),
    discount_amount DECIMAL(10,2),
    line_total DECIMAL(10,2),
    line_cost DECIMAL(10,2),
    line_profit DECIMAL(10,2),
    -- Foreign keys
    FOREIGN KEY (order_date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (promotion_key) REFERENCES dim_promotion(promotion_key)
);

-- Fact: Product Inventory (Periodic Snapshot - Daily)
CREATE TABLE fact_product_inventory (
    inventory_key INT PRIMARY KEY AUTO_INCREMENT,
    date_key INT,
    product_key INT,
    warehouse_key INT,
    -- Measures
    opening_quantity INT,
    receipts INT,
    sales INT,
    adjustments INT,
    closing_quantity INT,
    min_stock_level INT,
    max_stock_level INT,
    reorder_point INT,
    stock_value DECIMAL(15,2),
    -- Flags
    is_out_of_stock BOOLEAN,
    is_below_reorder_point BOOLEAN,
    -- Foreign keys
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    PRIMARY KEY (date_key, product_key, warehouse_key)
);

-- Fact: Customer Activity (Periodic Snapshot - Monthly)
CREATE TABLE fact_customer_monthly (
    customer_monthly_key INT PRIMARY KEY AUTO_INCREMENT,
    month_key INT,
    customer_key INT,
    -- Measures
    order_count INT,
    total_items_purchased INT,
    total_amount DECIMAL(10,2),
    average_order_value DECIMAL(10,2),
    days_since_last_order INT,
    lifetime_value DECIMAL(15,2),
    -- Flags
    is_active BOOLEAN,
    is_churned BOOLEAN,
    -- Foreign keys
    FOREIGN KEY (month_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    PRIMARY KEY (month_key, customer_key)
);

-- Fact: Website Traffic (Transaction)
CREATE TABLE fact_web_sessions (
    session_key INT PRIMARY KEY AUTO_INCREMENT,
    session_id VARCHAR(100),  -- Degenerate dimension
    date_key INT,
    time_key INT,
    customer_key INT,
    -- Measures
    page_views INT,
    duration_seconds INT,
    bounce_flag BOOLEAN,
    conversion_flag BOOLEAN,
    cart_abandonment_flag BOOLEAN,
    items_viewed INT,
    items_added_to_cart INT,
    search_count INT,
    -- Foreign keys
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key)
);

-- Example queries

-- Sales by category and month
SELECT 
    d.year,
    d.month_name,
    p.category,
    SUM(f.line_total) as total_sales,
    SUM(f.quantity) as total_quantity,
    COUNT(DISTINCT f.order_number) as order_count,
    SUM(f.line_profit) as total_profit
FROM fact_order_line_items f
JOIN dim_date d ON f.order_date_key = d.date_key
JOIN dim_product p ON f.product_key = p.product_key
WHERE d.year = 2025
GROUP BY d.year, d.month_name, p.category
ORDER BY d.year, d.month, total_sales DESC;

-- Customer lifetime value
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.customer_segment,
    c.loyalty_tier,
    SUM(f.total_amount) as lifetime_value,
    COUNT(DISTINCT f.order_number) as total_orders,
    AVG(f.total_amount) as avg_order_value,
    MIN(d.date) as first_order_date,
    MAX(d.date) as last_order_date,
    DATEDIFF(MAX(d.date), MIN(d.date)) as customer_tenure_days
FROM dim_customer c
JOIN fact_orders f ON c.customer_key = f.customer_key
JOIN dim_date d ON f.order_date_key = d.date_key
WHERE c.is_current = TRUE
GROUP BY c.customer_id, c.first_name, c.last_name, c.customer_segment, c.loyalty_tier
HAVING COUNT(DISTINCT f.order_number) >= 5
ORDER BY lifetime_value DESC;

-- Product performance
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.brand,
    SUM(f.quantity) as total_sold,
    SUM(f.line_total) as total_revenue,
    SUM(f.line_profit) as total_profit,
    AVG(f.unit_price) as avg_selling_price,
    COUNT(DISTINCT f.order_number) as order_count
FROM dim_product p
JOIN fact_order_line_items f ON p.product_key = f.product_key
WHERE p.is_current = TRUE
GROUP BY p.product_id, p.product_name, p.category, p.brand
ORDER BY total_revenue DESC
LIMIT 20;
```

This e-commerce data warehouse design includes:
- Multiple fact tables for different business processes
- Proper use of conformed dimensions
- SCD Type 2 for customer and product
- Degenerate dimensions (order_number)
- Different fact table types (transaction, periodic snapshot, accumulating snapshot)
- Support for complex analytical queries

---

## Practice Tips

1. **Understand business requirements** before designing
2. **Start with star schema** unless there's specific reason for snowflake
3. **Use surrogate keys** for all dimensions
4. **Implement SCD Type 2** for critical dimensions
5. **Create conformed dimensions** for enterprise consistency
6. **Partition large fact tables** by date
7. **Create proper indexes** on foreign keys
8. **Document your design** with ERD diagrams
9. **Test with realistic data volumes**
10. **Consider query patterns** during design

Good luck with your data warehouse interviews! 🚀
