# ETL Testing Assessment - MCQ

## ETL Testing Fundamentals

### 1. What is the primary goal of ETL testing?
- A) To test the UI of reporting tools
- B) To verify data is correctly extracted, transformed, and loaded
- C) To validate source system performance only
- D) To design data models

**Answer: B) To verify data is correctly extracted, transformed, and loaded**

### 2. Which of the following is NOT a core ETL testing objective?
- A) Data completeness
- B) Data accuracy
- C) UI responsiveness
- D) Data consistency

**Answer: C) UI responsiveness**

### 3. What does ETL stand for?
- A) Extract, Transform, Load
- B) Evaluate, Test, Launch
- C) Extract, Transfer, Log
- D) Execute, Transform, Load

**Answer: A) Extract, Transform, Load**

### 4. Which environment is most commonly used for ETL testing before production?
- A) Development only
- B) Staging/UAT
- C) Production only
- D) Source system

**Answer: B) Staging/UAT**

### 5. Which testing validates that all expected records moved from source to target?
- A) Performance testing
- B) Data completeness testing
- C) UI testing
- D) Security testing

**Answer: B) Data completeness testing**

## ETL Process and Architecture

### 6. What is the purpose of a staging layer in ETL?
- A) To store final reports
- B) To temporarily hold raw extracted data
- C) To host BI dashboards
- D) To perform end-user queries

**Answer: B) To temporarily hold raw extracted data**

### 7. Which component applies business rules to source data?
- A) Extraction
- B) Transformation
- C) Load
- D) Archival

**Answer: B) Transformation**

### 8. What is the primary role of the target system in ETL?
- A) Provide source logs
- B) Receive transformed data
- C) Cleanse source data
- D) Validate UI controls

**Answer: B) Receive transformed data**

### 9. In ELT, where does transformation occur?
- A) In the source system
- B) In the target system
- C) In the staging layer only
- D) In the reporting layer

**Answer: B) In the target system**

### 10. Which architecture is commonly used for analytical reporting?
- A) OLTP
- B) Data Warehouse
- C) Cache-only store
- D) Message queue

**Answer: B) Data Warehouse**

## Data Validation and Reconciliation

### 11. Which validation compares record counts between source and target?
- A) Schema validation
- B) Row count reconciliation
- C) UI validation
- D) Index validation

**Answer: B) Row count reconciliation**

### 12. What is a hash total used for in ETL testing?
- A) Encrypting data
- B) Verifying numeric column integrity across systems
- C) Compressing files
- D) Generating surrogate keys

**Answer: B) Verifying numeric column integrity across systems**

### 13. Which check ensures no unexpected duplicates are loaded?
- A) Uniqueness check
- B) Latency check
- C) Index check
- D) UI check

**Answer: A) Uniqueness check**

### 14. What does data reconciliation primarily verify?
- A) UI layout consistency
- B) Data integrity between source and target
- C) Browser compatibility
- D) Network latency

**Answer: B) Data integrity between source and target**

### 15. Which validation confirms correct mapping of source fields to target fields?
- A) Mapping validation
- B) Security validation
- C) UI validation
- D) Backup validation

**Answer: A) Mapping validation**

## Data Quality Dimensions

### 16. Which data quality dimension checks that values follow required formats?
- A) Timeliness
- B) Validity
- C) Completeness
- D) Uniqueness

**Answer: B) Validity**

### 17. Missing mandatory values indicate a failure in which dimension?
- A) Completeness
- B) Accuracy
- C) Consistency
- D) Timeliness

**Answer: A) Completeness**

### 18. If the same customer appears with different birth dates across systems, which dimension is impacted?
- A) Timeliness
- B) Consistency
- C) Uniqueness
- D) Validity

**Answer: B) Consistency**

### 19. Data that is out of date violates which dimension?
- A) Timeliness
- B) Accuracy
- C) Validity
- D) Completeness

**Answer: A) Timeliness**

### 20. Which dimension ensures data values are correct and reliable?
- A) Accuracy
- B) Validity
- C) Uniqueness
- D) Completeness

**Answer: A) Accuracy**

## Transformation Testing

### 21. What is the main focus of transformation testing?
- A) Source system uptime
- B) Business rule correctness
- C) UI load time
- D) Network bandwidth

**Answer: B) Business rule correctness**

### 22. Which test validates that NULL handling rules are applied correctly?
- A) Load test
- B) Transformation rule test
- C) UI test
- D) Security test

**Answer: B) Transformation rule test**

### 23. A calculation error in derived columns is a failure of which area?
- A) Extraction
- B) Transformation
- C) Load
- D) Archival

**Answer: B) Transformation**

### 24. Which approach is best for verifying complex transformations?
- A) Manual visual checks only
- B) Independent calculation with SQL queries
- C) Skipping validation
- D) Testing UI dashboards

**Answer: B) Independent calculation with SQL queries**

### 25. Which transformation type changes data format without changing meaning?
- A) Aggregation
- B) Standardization
- C) Enrichment
- D) Filtering

**Answer: B) Standardization**

## Incremental and Full Loads

### 26. What is a full load?
- A) Loading only changed records
- B) Loading all records every run
- C) Loading errors only
- D) Loading only metadata

**Answer: B) Loading all records every run**

### 27. What is an incremental load?
- A) Loading all history each run
- B) Loading only new or changed records
- C) Loading only error records
- D) Loading only aggregate tables

**Answer: B) Loading only new or changed records**

### 28. Which field is commonly used to identify changed records?
- A) Binary flag
- B) Last updated timestamp
- C) UI status
- D) Record count

**Answer: B) Last updated timestamp**

### 29. What is CDC in ETL?
- A) Central Data Cache
- B) Change Data Capture
- C) Column Data Count
- D) Cross Data Check

**Answer: B) Change Data Capture**

### 30. What is a common risk in incremental loads?
- A) Excessive storage of all history every run
- B) Missing changed records due to incorrect watermark
- C) UI failures
- D) Browser incompatibility

**Answer: B) Missing changed records due to incorrect watermark**

## Data Warehouse Concepts

### 31. What is a fact table?
- A) Table storing descriptive attributes
- B) Table storing measurable metrics
- C) Table storing user profiles
- D) Table storing logs only

**Answer: B) Table storing measurable metrics**

### 32. What is a dimension table?
- A) Table containing transactional measures
- B) Table containing descriptive attributes
- C) Table containing error records only
- D) Table containing staging data

**Answer: B) Table containing descriptive attributes**

### 33. What is a surrogate key?
- A) Natural key from source system
- B) System-generated unique key in warehouse
- C) Composite business key
- D) External API key

**Answer: B) System-generated unique key in warehouse**

### 34. A conformed dimension is:
- A) A dimension used by only one fact table
- B) A shared dimension with consistent meaning across marts
- C) A staging-only dimension
- D) An invalid dimension

**Answer: B) A shared dimension with consistent meaning across marts**

### 35. Which schema is commonly used in data warehouses?
- A) Star schema
- B) Linked list schema
- C) Stack schema
- D) Binary schema

**Answer: A) Star schema**

## Slowly Changing Dimensions (SCD)

### 36. SCD Type 1 means:
- A) Add a new row for changes
- B) Overwrite existing data
- C) Add a new column for history
- D) Keep no history and no overwrite

**Answer: B) Overwrite existing data**

### 37. SCD Type 2 means:
- A) Overwrite existing data
- B) Add a new row to preserve history
- C) Add a new column for history only
- D) Ignore changes

**Answer: B) Add a new row to preserve history**

### 38. SCD Type 3 means:
- A) Add a new row for each change
- B) Add a new column for previous value
- C) Overwrite existing data
- D) Store history in fact table

**Answer: B) Add a new column for previous value**

### 39. Which field is commonly used to indicate current row in SCD Type 2?
- A) Is_Current flag
- B) Order_ID
- C) Batch_ID only
- D) UI_Status

**Answer: A) Is_Current flag**

### 40. Which SCD type keeps full history with start/end dates?
- A) Type 0
- B) Type 1
- C) Type 2
- D) Type 3

**Answer: C) Type 2**

## ETL Testing Types

### 41. Which testing ensures the target table structure matches design?
- A) Schema testing
- B) Performance testing
- C) UI testing
- D) Security testing

**Answer: A) Schema testing**

### 42. Which testing checks query runtime and load windows?
- A) Smoke testing
- B) Performance testing
- C) Usability testing
- D) Localization testing

**Answer: B) Performance testing**

### 43. Which testing validates a change did not break existing ETL jobs?
- A) Regression testing
- B) Ad-hoc testing
- C) UI testing
- D) Accessibility testing

**Answer: A) Regression testing**

### 44. Which testing confirms business users accept results?
- A) Unit testing
- B) UAT
- C) Smoke testing
- D) Integration testing

**Answer: B) UAT**

### 45. Which testing verifies data flow from source to target end-to-end?
- A) End-to-end ETL testing
- B) UI testing
- C) Localization testing
- D) Cross-browser testing

**Answer: A) End-to-end ETL testing**

## Data Profiling and Analysis

### 46. Data profiling is used to:
- A) Design UI components
- B) Analyze data structure, quality, and content
- C) Encrypt data
- D) Generate reports only

**Answer: B) Analyze data structure, quality, and content**

### 47. Which profiling metric detects duplicates?
- A) Distinct count
- B) Sum
- C) Average
- D) Max

**Answer: A) Distinct count**

### 48. Which profiling check identifies out-of-range values?
- A) Min/Max range check
- B) UI snapshot
- C) Index scan
- D) Metadata sync

**Answer: A) Min/Max range check**

### 49. Which profiling check identifies NULL prevalence?
- A) Null count
- B) Foreign key check
- C) Index check
- D) UI check

**Answer: A) Null count**

### 50. Which output is a common result of profiling?
- A) Data quality scorecard
- B) UI component list
- C) API schema
- D) Browser matrix

**Answer: A) Data quality scorecard**

## ETL Tools and Platforms

### 51. Which is an ETL tool?
- A) Informatica PowerCenter
- B) Selenium
- C) JUnit
- D) Postman

**Answer: A) Informatica PowerCenter**

### 52. Which Microsoft tool is commonly used for ETL?
- A) SSIS
- B) SSRS
- C) SSMS only
- D) MS Paint

**Answer: A) SSIS**

### 53. Which open-source ETL/ELT tool is SQL-first?
- A) dbt
- B) QTP
- C) LoadRunner
- D) SoapUI

**Answer: A) dbt**

### 54. Which workflow orchestrator is commonly used with ETL pipelines?
- A) Apache Airflow
- B) Selenium Grid
- C) JMeter
- D) Cypress

**Answer: A) Apache Airflow**

### 55. Which tool is primarily used for data quality and reconciliation?
- A) QuerySurge
- B) Appium
- C) Playwright
- D) Postman

**Answer: A) QuerySurge**

## ETL Testing Queries and Checks

### 56. Which SQL clause is used to compare aggregated values between source and target?
- A) GROUP BY
- B) ORDER BY
- C) DISTINCT
- D) UNION ALL

**Answer: A) GROUP BY**

### 57. Which query helps find records in source not in target?
- A) INNER JOIN
- B) LEFT JOIN with NULL check
- C) CROSS JOIN
- D) FULL JOIN without filter

**Answer: B) LEFT JOIN with NULL check**

### 58. Which query helps identify duplicates in target?
- A) SELECT *
- B) GROUP BY key HAVING COUNT(*) > 1
- C) ORDER BY key
- D) DISTINCT key only

**Answer: B) GROUP BY key HAVING COUNT(*) > 1**

### 59. Which check validates referential integrity?
- A) Join parent and child tables to find orphans
- B) Count rows only
- C) Sort data
- D) Rename columns

**Answer: A) Join parent and child tables to find orphans**

### 60. Which comparison is best for very large datasets?
- A) Visual comparison
- B) Hash-based comparison
- C) Manual row-by-row comparison
- D) UI screenshot comparison

**Answer: B) Hash-based comparison**

## Performance and Optimization

### 61. Which factor most impacts ETL performance?
- A) Browser type
- B) Data volume
- C) UI color
- D) Font size

**Answer: B) Data volume**

### 62. Which technique improves load performance for large tables?
- A) Row-by-row inserts only
- B) Bulk loading
- C) Disabling indexes permanently
- D) UI caching

**Answer: B) Bulk loading**

### 63. What is partitioning used for?
- A) Splitting data to improve query/load performance
- B) Changing UI layout
- C) Encrypting columns
- D) Creating backups only

**Answer: A) Splitting data to improve query/load performance**

### 64. Which is a common performance test metric for ETL?
- A) Load window duration
- B) UI response time
- C) Click latency
- D) Color contrast

**Answer: A) Load window duration**

### 65. Which action is often used to optimize transformations?
- A) Avoiding indexes for all tables
- B) Filtering early in the pipeline
- C) Removing staging completely
- D) Converting all data to strings

**Answer: B) Filtering early in the pipeline**

## Error Handling and Logging

### 66. What is the purpose of an error table in ETL?
- A) Store UI errors
- B) Capture failed records for analysis
- C) Store backups only
- D) Replace staging tables

**Answer: B) Capture failed records for analysis**

### 67. What should ETL logs typically include?
- A) Row counts processed
- B) Error messages
- C) Start and end timestamps
- D) All of the above

**Answer: D) All of the above**

### 68. What is a common strategy for handling bad records?
- A) Stop the entire load always
- B) Quarantine and continue processing
- C) Ignore all errors
- D) Delete target table

**Answer: B) Quarantine and continue processing**

### 69. Which is an example of audit data captured during ETL?
- A) Source row count and target row count
- B) Browser version
- C) Screen resolution
- D) UI theme

**Answer: A) Source row count and target row count**

### 70. Which field helps track ETL batch execution?
- A) Batch_ID
- B) Font_Size
- C) UI_Color
- D) Browser_Name

**Answer: A) Batch_ID**

## Metadata and Lineage

### 71. What is data lineage?
- A) UI component hierarchy
- B) The path data takes from source to target
- C) Indexing strategy
- D) Browser history

**Answer: B) The path data takes from source to target**

### 72. Metadata in ETL typically describes:
- A) UI styles
- B) Data definitions, mappings, and transformations
- C) Browser plugins
- D) Screen layouts

**Answer: B) Data definitions, mappings, and transformations**

### 73. Which document lists source-to-target field mappings?
- A) STTM (Source-to-Target Mapping)
- B) UI Style Guide
- C) API Contract only
- D) Browser matrix

**Answer: A) STTM (Source-to-Target Mapping)**

### 74. Which technique helps verify lineage?
- A) Trace a value from source to target using keys
- B) Change UI themes
- C) Disable logs
- D) Ignore metadata

**Answer: A) Trace a value from source to target using keys**

### 75. Why is metadata important in ETL testing?
- A) It replaces test cases
- B) It enables understanding of data definitions and transformations
- C) It is only for UI testing
- D) It reduces the need for validation

**Answer: B) It enables understanding of data definitions and transformations**

## Security and Compliance

### 76. Which practice helps protect sensitive data in ETL testing?
- A) Masking or anonymization
- B) Printing data to logs
- C) Sharing production data openly
- D) Disabling access controls

**Answer: A) Masking or anonymization**

### 77. Which compliance concern is common for PII data?
- A) GDPR
- B) UI contrast ratio
- C) Browser plugin updates
- D) Screen resolution

**Answer: A) GDPR**

### 78. Which rule ensures only authorized users access ETL data?
- A) Role-based access control
- B) UI theming
- C) Browser cache
- D) Font size

**Answer: A) Role-based access control**

### 79. Which is a best practice for handling production data in test environments?
- A) Use raw production data without changes
- B) Mask or tokenize sensitive fields
- C) Email data to testers
- D) Store data in spreadsheets

**Answer: B) Mask or tokenize sensitive fields**

### 80. Which data category often requires additional controls?
- A) PII/PHI
- B) Log levels
- C) UI preferences
- D) Screen size

**Answer: A) PII/PHI**

## Automation and Test Strategy

### 81. What is a benefit of automating ETL tests?
- A) Increases manual effort
- B) Enables repeatable and faster regression checks
- C) Removes need for data validation
- D) Eliminates business rules

**Answer: B) Enables repeatable and faster regression checks**

### 82. Which approach is common for ETL test automation?
- A) Data-driven testing with SQL scripts
- B) Pixel-based UI testing
- C) Browser-only testing
- D) Manual copy-paste validation

**Answer: A) Data-driven testing with SQL scripts**

### 83. Which framework is often used to automate ETL validations?
- A) Python + SQL (custom framework)
- B) Selenium only
- C) Cypress only
- D) Appium only

**Answer: A) Python + SQL (custom framework)**

### 84. What is the role of a test harness in ETL testing?
- A) Execute and validate ETL jobs and results
- B) Render UI screens
- C) Manage browsers
- D) Track UI clicks

**Answer: A) Execute and validate ETL jobs and results**

### 85. Which is a best practice for ETL test case design?
- A) Use small, controlled datasets with known outcomes
- B) Skip edge cases
- C) Avoid negative testing
- D) Do not document assumptions

**Answer: A) Use small, controlled datasets with known outcomes**

## Common ETL Issues

### 86. Which issue is caused by incorrect join conditions?
- A) Data duplication or loss
- B) Faster load times
- C) UI freezing
- D) Increased memory only

**Answer: A) Data duplication or loss**

### 87. What is a common cause of data truncation?
- A) Target column length too small
- B) Correct data types
- C) Proper indexing
- D) Valid transformations

**Answer: A) Target column length too small**

### 88. Which issue indicates mismatched data types between source and target?
- A) Data type mismatch error
- B) Better performance
- C) Faster extraction
- D) Improved UI

**Answer: A) Data type mismatch error**

### 89. What happens if primary keys are not enforced in target?
- A) Duplicate records may load
- B) ETL automatically deduplicates
- C) Performance always improves
- D) No impact

**Answer: A) Duplicate records may load**

### 90. Which issue can occur with timezone conversions?
- A) Incorrect date/time values
- B) Faster processing
- C) Smaller storage
- D) Better UI

**Answer: A) Incorrect date/time values**

## Best Practices and Governance

### 91. What is the main purpose of data governance in ETL?
- A) Define UI themes
- B) Ensure data quality, security, and compliance
- C) Increase UI animations
- D) Control browser plugins

**Answer: B) Ensure data quality, security, and compliance**

### 92. Which document defines transformation rules and mappings?
- A) Source-to-Target Mapping (STTM)
- B) UI specification
- C) Browser matrix
- D) API catalog only

**Answer: A) Source-to-Target Mapping (STTM)**

### 93. What is a common SLA for ETL?
- A) Maximum load window duration
- B) UI response time
- C) Number of clicks
- D) Page load time only

**Answer: A) Maximum load window duration**

### 94. Which practice helps ensure repeatable ETL tests?
- A) Version control for scripts and test data
- B) Changing rules without documentation
- C) Deleting logs after each run
- D) Testing only in production

**Answer: A) Version control for scripts and test data**

### 95. Why is data sampling risky if used alone?
- A) It may miss edge cases and defects
- B) It always finds all defects
- C) It replaces reconciliation
- D) It improves coverage

**Answer: A) It may miss edge cases and defects**

## Advanced ETL Testing Concepts

### 96. What is a watermark in ETL?
- A) UI brand logo
- B) A marker to track last processed data
- C) A security token
- D) A storage partition name

**Answer: B) A marker to track last processed data**

### 97. What is data drift in ETL?
- A) UI style changes
- B) Changes in data distributions or patterns over time
- C) Faster queries
- D) Smaller datasets only

**Answer: B) Changes in data distributions or patterns over time**

### 98. What is a common method to validate aggregate tables?
- A) Recompute aggregates from base data and compare
- B) UI snapshot comparison
- C) Browser replay
- D) Manual guessing

**Answer: A) Recompute aggregates from base data and compare**

### 99. What is a common pitfall when testing ETL with production data?
- A) Sensitive data exposure
- B) Too many indexes
- C) Faster loads
- D) Better UI

**Answer: A) Sensitive data exposure**

### 100. Which practice helps ensure ETL test completeness?
- A) Cover positive, negative, and edge cases
- B) Test only happy paths
- C) Skip documentation
- D) Avoid automation

**Answer: A) Cover positive, negative, and edge cases**

---

## Scoring Guide:
- 90-100: Excellent - Senior ETL/BI QA Engineer
- 75-89: Very Good - Mid-Level ETL/BI QA Engineer
- 60-74: Good - Junior ETL/BI QA Engineer
- Below 60: Needs Improvement - Focus on ETL fundamentals

---

**Note:** These questions cover ETL testing concepts, data quality, reconciliation, performance, and governance. Regular practice and hands-on experience are essential for mastery.
