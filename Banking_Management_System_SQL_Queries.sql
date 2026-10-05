create database Bank;

use Bank;

create table Customers(
Customer_ID int primary key ,
Customer_Name varchar(50) not null,
Phone_No varchar(15),
City varchar(50),
Account_Type varchar(50)
);

insert into Customers values
(1,'Rahul Sharma',9876543210,'Pune','Saving'),
(2,'Snehal Patil',9988776655,'Mumbai','Current'),
(3,'Aman Varma',9123456780,'Nagpur','Saving'),
(4,'Priya Singh',9012345678,'Delhi','Current'),
(5,'Karan Mehta',9871203456,'Hyderabad','Saving'),
(6,'Neha Joshi',9988001122,'Pune','Current'),
(7,'Rohit Kumar',9765432109,'Bangalore','Saving'),
(8,'Pooja Sharma',9876540001,'Chennai','Saving'),
(9,'Vivek Shah',9001122334,'Ahmedabad','Current'),
(10,'Anjali Verma',9988771100,'jaipur','Saving');

select * from Customers;

create table Accounts (
Account_ID int primary key,
Customer_ID int,
Balance decimal(10,2),
Open_Date date,

Foreign key (Customer_ID) 
References Customers(Customer_ID)
);

insert into Accounts values
(1001,1,55000,'2025-01-10'),
(1002,2,120000,'2024-11-20'),
(1003,3,35000,'2025-03-15'),
(1004,4,98000,'2025-02-01'),
(1005,5,75000,'2025-01-25'),
(1006,6,150000,'2024-12-18'),
(1007,7,42000,'2025-04-10'),
(1008,8,88000,'2025-05-05'),
(1009,9,200000,'2024-09-30'),
(1010,10,67000,'2025-03-22');

select * from Accounts;

create table Transactions(
Transaction_ID int primary key,
Account_ID int,
Transaction_Type varchar(50),
Amount decimal(10,2),
Transaction_data date,

Foreign key (Account_ID)
References Accounts(Account_ID)
);

insert into Transactions values
(1,1001,'Deposit',10000,'2026-06-01'),
(2,1001,'Withdraw',5000,'2026-06-02'),
(3,1002,'Deposit',25000,'2026-06-02'),
(4,1003,'Withdraw',3000,'2026-06-03'),
(5,1004,'Deposit',15000,'2026-06-04'),
(6,1005,'Deposit',12000,'2026-06-05'),
(7,1006,'Withdraw',7000,'2026-06-05'),
(8,1007,'Deposit',9000,'2026-06-06'),
(9,1008,'Withdraw',4500,'2026-06-06'),
(10,1009,'Deposit',30000,'2026-06-06'),
(11,1010,'Withdraw',2000,'2026-06-07'),
(12,1002,'Withdraw',10000,'2026-06-08'),
(13,1003,'Deposit',5000,'2026-06-08'),
(14,1005,'Withdraw',3500,'2026-06-09'),
(15,1007,'Deposit',15000,'2026-06-09');

select * from Transactions;

create table Loans(
Loan_ID int primary key,
Customer_ID int,
Loan_Amount decimal(10,2),
Loan_Type varchar(50),

Foreign key (Customer_ID)
References Customers(Customer_ID)
);

insert into Loans values
(1,1,500000,'Home Loan'),
(2,2,200000,'Car Loan'),
(3,4,100000,'Education Loan'),
(4,5,300000,'Business Loan'),
(5,6,150000,'Personal Loan'),
(6,8,250000,'Home Loan'),
(7,9,400000,'Business Loan'),
(8,10,180000,'Car Loan');

select * from Loans;

select * from Customers;
select * from Accounts;
select * from Transactions;
select * from Loans;

--1. Display customer names, account numbers, and account balances using INNER JOIN.
select c.Customer_Name,a.Account_ID,a.Balance
from Customers c inner join Accounts a
on c.Customer_ID = a.Customer_ID;

--2. Find the top 3 customers with the highest account balances.
select top(3) c.Customer_Name,a.Balance
from Customers c inner join Accounts a
on c.Customer_ID = a.Customer_ID
order by a.Balance desc;

--3. Show all customers who have taken loans along with loan amount and loan type.
select c.Customer_Name,l.Loan_Amount,l.Loan_Type
from Customers c inner join Loans l
on c.Customer_ID = l.Customer_ID;

--4. Find the total deposited amount and total withdrawn amount separately.
select Transaction_type,
sum(amount) as Total_Amount from Transactions
group by Transaction_Type;

--5. Display customer-wise total transaction amount using GROUP BY.
select  c.Customer_Name ,sum(t.Amount) as Total_Transaction_Amount
from Customers c inner join Accounts a
on c.Customer_ID = a.Customer_ID
inner join Transactions t
on a.Account_ID = t.Account_ID
group by c.Customer_Name;

--6. Find customers whose balances are greater than the average bank balance.
select c.Customer_Name,a.Balance
from Customers c inner join Accounts a
on c.Customer_ID = a.Customer_ID
where a.Balance > (select avg(balance) from Accounts);

--7. Show the highest transaction amount performed by each customer.
select c.Customer_Name,max(t.amount) as Highest_transaction_amount 
from Customers c inner join Accounts a
on c.Customer_ID = a.Customer_ID
inner join Transactions t
on a.Account_ID = t.Account_ID
group by c.Customer_Name;

--8. Display all customers who have not taken any loans using LEFT JOIN.
select c.Customer_Name,l.Loan_Amount
from Customers c left join Loans l
on c.Customer_ID = l.Customer_ID
where Loan_Amount is null;

--9. Find the total number of transactions performed by each customer.
select c.Customer_Name,count(*) as total_transaction
from Customers c inner join Accounts a
on c.Customer_ID = a.Customer_ID
inner join Transactions t
on a.Account_ID = t.Account_ID
group by c.Customer_Name;

--10. Rank customers based on their account balances using RANK() window function.
select c.Customer_Name,a.Balance,
rank() over(order by balance desc) as ranks
from Customers c inner join Accounts a
on c.Customer_ID = a.Customer_ID;

--11. Display dense ranking of customers according to balance using DENSE_RANK().
select c.Customer_Name,a.Balance,
dense_rank() over(order by balance desc) as dense_ranking
from Customers c inner join Accounts a
on c.Customer_ID = a.Customer_ID;

--12. Show previous transaction amount using LAG() function.
select c.Customer_Name,t.Amount,
lag(Amount) over(order by amount asc) as previous_transaction_amount
from Customers c inner join Accounts a
on c.Customer_ID = a.Customer_ID
inner join Transactions t 
on a.Account_ID = t.Account_ID;

--13. Show next transaction amount using LEAD() function.
select c.Customer_Name,t.Amount,
lead(Amount) over(order by amount asc) as next_transaction_amount
from Customers c inner join Accounts a
on c.Customer_ID = a.Customer_ID
inner join Transactions t 
on a.Account_ID = t.Account_ID;

--14. Calculate running total of transaction amounts using SUM() OVER().
select c.Customer_Name,t.Amount,
sum(Amount) over(order by amount asc) as Runnig_total_amount
from Customers c inner join Accounts a
on c.Customer_ID = a.Customer_ID
inner join Transactions t 
on a.Account_ID = t.Account_ID;

--15. Find the second highest account balance using subquery or window function.
select max(a.balance) as secound_highest_balance
from Customers c inner join Accounts a
on c.Customer_ID = a.Customer_ID
where a.balance < ( select max(Balance) from Accounts);

--16. Find customers who performed more than 1 transactions.
select c.Customer_Name,count(*) as total_transaction_number
from Customers c inner join Accounts a
on c.Customer_ID = a.Customer_ID
inner join Transactions t
on a.Account_ID = t.Account_ID
group by c.Customer_Name
having count(*)>1
order by c.Customer_Name desc;

--17. Display customer-wise minimum and maximum transaction amounts
select c.Customer_Name,
min(amount) as minimum_transaction_amount, 
max(amount) as maximum_transaction_amount
from Customers c inner join Accounts a
on c.Customer_ID = a.Customer_ID
inner join Transactions t
on a.Account_ID = t.Account_ID
group by c.Customer_Name;