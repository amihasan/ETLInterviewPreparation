# SQL Practice Repository

A comprehensive collection of SQL practice questions, solutions, and interview preparation materials.

## 📚 Contents

### 1. Practice Questions (`sql_practice_questions.md`)
70 SQL practice questions organized by difficulty level:
- **Beginner (10 questions)**: SELECT, WHERE, ORDER BY, LIMIT
- **Intermediate (19 questions)**: Aggregates, GROUP BY, HAVING, JOINs, Subqueries
- **Advanced (41 questions)**: Window functions, CTEs, complex queries, performance optimization

### 2. Solutions (`solutions.md`)
Complete solutions for all 70 practice questions with detailed SQL code and explanations.

### 3. Interview Questions (`interview_questions.md`)
35+ comprehensive SQL interview questions covering:
- Basic SQL Concepts (Q1-Q8)
- Intermediate Questions (Q9-Q16)
- Advanced SQL Topics (Q17-Q22)
- Scenario-Based Questions (Q23-Q28)
- Performance & Optimization (Q29-Q31)
- Database Design Questions (Q32-Q35)

### 4. Sample Data (`sample_data.sql`)
Ready-to-use database setup including:
- Schema creation (employees, departments, projects, employee_projects)
- 50 sample employees across 8 departments
- 13 sample projects
- Employee-project assignments
- Indexes for performance

## 🚀 Getting Started

1. **Set up the database:**
   ```bash
   # For MySQL
   mysql -u username -p < sample_data.sql
   
   # For PostgreSQL
   psql -U username -d database_name -f sample_data.sql
   ```

2. **Start practicing:**
   - Open `sql_practice_questions.md` for practice questions
   - Try to solve them yourself first
   - Check `solutions.md` for answers and explanations

3. **Interview preparation:**
   - Review `interview_questions.md` for common interview questions
   - Practice explaining concepts verbally
   - Understand the reasoning behind each solution

## 📊 Database Schema

The practice database includes:

- **employees**: Employee information (50 records)
- **departments**: Department details (8 departments)
- **projects**: Project information (13 projects)
- **employee_projects**: Many-to-many relationship between employees and projects

## 💡 Tips for Practice

1. Start with beginner questions and progress gradually
2. Write queries yourself before checking solutions
3. Try multiple approaches to solve the same problem
4. Focus on understanding why a solution works
5. Practice explaining your queries verbally
6. Test queries with edge cases
7. Consider performance implications for large datasets

## 🎯 Topics Covered

- Basic SELECT statements
- WHERE and HAVING clauses
- JOINs (INNER, LEFT, RIGHT, FULL, SELF, CROSS)
- Aggregate functions (COUNT, SUM, AVG, MAX, MIN)
- GROUP BY and ORDER BY
- Subqueries and correlated subqueries
- Window functions (ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD)
- Common Table Expressions (CTEs)
- Recursive queries
- Set operations (UNION, INTERSECT, EXCEPT)
- Date and string functions
- CASE statements
- Data modification (INSERT, UPDATE, DELETE)
- Query optimization
- Indexing strategies
- Database design and normalization

## 📝 License

This repository is for educational purposes. Feel free to use, modify, and share.

## 🤝 Contributing

Suggestions and improvements are welcome! Feel free to:
- Submit issues for corrections or improvements
- Add more practice questions
- Improve explanations
- Add solutions for different SQL dialects

## 📚 Additional Resources

- [LeetCode Database Problems](https://leetcode.com/problemset/database/)
- [HackerRank SQL Challenges](https://www.hackerrank.com/domains/sql)
- [SQLZoo](https://sqlzoo.net/)
- [Mode Analytics SQL Tutorial](https://mode.com/sql-tutorial/)

Happy practicing! 🎯
