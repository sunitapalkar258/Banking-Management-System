# Banking Management System – SQL Project

## 📌 Project Overview

This project focuses on designing and analyzing a relational Banking Management System using SQL.

The database stores information related to customers, accounts, transactions, and loans. SQL queries are used to retrieve, analyze, and generate useful insights from the banking data.

## 🎯 Project Objectives

- Design a relational banking database
- Store customer, account, transaction, and loan information
- Establish relationships using Primary Keys and Foreign Keys
- Perform data retrieval and analysis using SQL
- Practice JOINs, aggregate functions, subqueries, and window functions
- Analyze customer balances and transaction activities

## 🗄️ Database

**Database Name:** Bank

## 📊 Core Tables

- Customers
- Accounts
- Transactions
- Loans

## 🔍 SQL Concepts Used

- CREATE DATABASE
- CREATE TABLE
- Primary Keys
- Foreign Keys
- SELECT
- INNER JOIN
- LEFT JOIN
- GROUP BY
- HAVING
- Aggregate Functions
  - SUM()
  - COUNT()
  - AVG()
  - MIN()
  - MAX()
- Subqueries
- ORDER BY
- RANK()
- DENSE_RANK()
- LAG()
- LEAD()
- SUM() OVER()

## 📋 Queries & Analysis Performed

The project includes SQL queries for:

1. Displaying customer names, account numbers, and account balances using INNER JOIN
2. Finding the top 3 customers with the highest account balances
3. Displaying customers who have taken loans
4. Calculating total deposited and withdrawn amounts
5. Finding customer-wise total transaction amounts
6. Finding customers whose balances are above the average balance
7. Finding the highest transaction amount for each customer
8. Displaying customers who have not taken any loans using LEFT JOIN
9. Counting transactions performed by each customer
10. Ranking customers based on account balance using RANK()
11. Ranking customers using DENSE_RANK()
12. Finding previous transaction amounts using LAG()
13. Finding next transaction amounts using LEAD()
14. Calculating running transaction totals using SUM() OVER()
15. Finding the second-highest account balance using a subquery
16. Finding the second-highest account balance using DENSE_RANK()
17. Finding customers based on their transaction count
18. Finding minimum and maximum transaction amounts for each customer

## 📈 Key Findings

- Highest account balance: ₹2,00,000
- Second-highest account balance: ₹1,50,000
- Average account balance: ₹93,000
- Total deposits: ₹1,21,000
- Total withdrawals: ₹35,000
- Net transaction value: ₹86,000

## 🛠️ Tools Used

- SQL Server
- SQL Server Management Studio (SSMS)

## 📁 Project Structure

```text
Banking-Management-System/
│
├── README.md
├── Banking_Management_System_SQL_Queries.sql
├── Banking_Management_System_Project_Presentation.pptx
│
└── Screenshots/
    └── Banking_Management_System_Query_Result.pdf
