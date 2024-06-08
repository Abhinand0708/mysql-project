create database library;
use library;
create table Branch (
    Branch_no int primary key,
    Manager_Id varchar(10),
    Branch_address varchar(100),
    Contact_no varchar(15)
);

create table Employee (
    Emp_Id int primary key,
    Emp_name varchar(20),
    Position varchar(20),
    Salary decimal(10, 2),
    Branch_no int,
    foreign key (Branch_no) references Branch(Branch_no)
    );
    
    create table Books (
    ISBN varchar(20) primary key,
    Book_title varchar(250),
    Category varchar(150),
    Rental_Price decimal(10, 2),
    Status enum('yes', 'no'), 
    Author varchar(125),
    Publisher varchar(125)
);

create table Customer (
    Customer_Id int primary key,
    Customer_name varchar(25),
    Customer_address varchar(100),
    Reg_date date
);

create table IssueStatus (
    Issue_Id int primary key,
    Issued_cust int,
    Issued_book_name varchar(100),
    Issue_date date,
    Isbn_book varchar(20),
    foreign key (Issued_cust) references Customer(Customer_Id),
    foreign key (Isbn_book) references Books(ISBN)
);

create table ReturnStatus (
    Return_Id int primary key,
    Return_cust int,
    Return_book_name varchar(100),
    Return_date date,
    Isbn_book2 varchar(20),
    foreign key (Return_cust) references Customer(Customer_Id),
    foreign key (Isbn_book2) references Books(ISBN)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(001, 'C01', 'CS 01 ground floor', '123-456-7890'),
(101, 'E02', 'EC 101 first floor', '987-654-3210'),
(201, 'E03', 'EE 201 second floor', '555-555-5555'),
(301, 'C04', 'CV 301 third floor', '666-666-6666'),
(401, 'M05', 'ME 401 fourth floor', '777-777-7777'),
(501, 'B06', 'BCA 501 fifth floor', '888-888-8888'),
(601, 'B07', 'BBA 601 sixth floor', '999-999-9999'),
(701, 'B08', 'BHM 701 seventh floor', '111-111-1111'),
(801, 'N09', 'NS 801 eighth floor', '222-222-2222'),
(901, 'F10', 'FD 901 ninth floor', '333-333-3333');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(011, 'Amit', 'Lib Mgr', 75000.00, 001),
(012, 'Varun', 'Lib Mgr', 72000.00, 501),
(013, 'Riya', 'Sr Libr', 65000.00, 001),
(014, 'Maya', 'Sr Libr', 63000.00, 401),
(015, 'Kiran', 'Sr Libr', 62000.00, 701),
(016, 'Siddharth', 'Sr Libr', 62000.00, 901),
(017, 'Aarav', 'Librn', 56000.00, 001),
(018, 'Aryan', 'Librn', 56000.00, 101),
(019, 'Akshay', 'Librn', 55000.00, 201),
(020, 'Meera', 'Librn', 53000.00, 301),
(021, 'Diya', 'Librn', 53000.00, 401),
(022, 'Arjun', 'Librn', 52000.00, 501),
(023, 'Kavya', 'Librn', 52000.00, 601),
(024, 'Suresh', 'Librn', 50000.00, 701),
(025, 'Neha', 'Librn', 50000.00, 801),
(026, 'Rahul', 'Librn', 50000.00, 901),
(027, 'Priya', 'Lib Clk', 48000.00, 001),
(028, 'Aditya', 'Lib Clk', 48000.00, 101),
(029, 'Priya', 'Lib Clk', 42000.00, 201),
(030, 'Aditya', 'Lib Clk', 41000.00, 801),
(031, 'Rajesh', 'Lib Asst', 39000.00, 001),
(032, 'Deepa', 'Lib Asst', 37000.00, 301),
(033, 'Suman', 'Lib Asst', 37000.00, 401),
(034, 'Arya', 'Lib Asst', 35000.00, 801),
(035, 'Anusha', 'Cashier', 32000.00, 001),
(036, 'Vishal', 'Cashier', 32000.00, 201),
(037, 'Shreya', 'Cashier', 30000.00, 701),
(038, 'Devika', 'Lib Tech', 28000.00, 001);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES

-- Computer Science
('9780262032933', 'AI: Modern Approach', 'CS', 425.00, 'Yes', 'Stuart Russell, Peter Norvig', 'Pearson'),
('9780262033848', 'Intro to Algorithms', 'CS', 320.00, 'Yes', 'Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein', 'MIT Press'),

-- Electronics & Communication
('9780132543031', 'Comm Sys Engineering', 'EC', 522.00, 'Yes', 'John G. Proakis, Masoud Salehi', 'Pearson'),
('9789339221003', 'Electronic Comm Sys', 'EC', 318.00, 'Yes', 'George Kennedy, Bernard Davis', 'McGraw-Hill'),

-- Electrical and Electronic 
('9781119235382', 'Electric Circuits', 'EE', 415.00, 'Yes', 'James W. Nilsson, Susan A. Riedel', 'Wiley'),
('9780133760033', 'Microelectronic Circuits', 'EE', 318.00, 'Yes', 'Adel S. Sedra, Kenneth C. Smith', 'Oxford Univ Press'),
('9780415152913', 'Hist of Eng: Classical & Medieval', 'EE', 420.00, 'Yes', 'Donald Hill', 'Routledge'),

-- Civil 
('9780136088394', 'Eng Mech: Statics', 'CV', 520.00, 'Yes', 'J.L. Meriam, L.G. Kraige', 'Pearson'),
('9780470917764', 'Prin of Geotech Eng', 'CV', 625.00, 'Yes', 'Braja M. Das, Khaled Sobhan', 'Cengage Learning'),
('9780784409880', 'Hist of Civil Eng', 'CV', 422.00, 'Yes', 'Peter R. Smith', 'ASCE Press'),

-- Mechanical 
('9780132280821', 'Fund of Thermodynamics', 'ME', 822.00, 'Yes', 'Richard E. Sonntag, Claus Borgnakke, Gordon J. Van Wylen', 'Wiley'),
('9781118007398', 'Intro to Fluid Mech', 'ME', 523.00, 'No', 'William S. Janna', 'Wiley'),
('9780486255934', 'Hist of Mech Inventions', 'ME', 324.00, 'Yes', 'Abbott Payson Usher', 'Dover Pub'),

-- BCA
('9780132121360', 'Database Sys Concepts', 'BCA', 417.00, 'Yes', 'Abraham Silberschatz, Henry F. Korth, S. Sudarshan', 'McGraw-Hill'),
('9780134670942', 'Computer Networking', 'BCA', 319.00, 'No', 'James F. Kurose, Keith W. Ross', 'Pearson'),

-- BBA
('9780470533024', 'Principles of Marketing', 'BBA', 616.00, 'No', 'Philip Kotler, Gary Armstrong', 'Pearson'),
('9781292095048', 'Operations Mgmt', 'BBA', 718.00, 'Yes', 'Nigel Slack, Alistair Brandon-Jones, Robert Johnston', 'Pearson'),

-- BHM
('9788126519840', 'Hotel Mgmt & Ops', 'BHM', 321.00, 'Yes', 'Denney G. Rutherford', 'Wiley'),
('9780470399163', 'Hospitality Mgmt Accounting', 'BHM', 424.00, 'Yes', 'Martin G. Jagels', 'Wiley'),

-- Nursing
('9780323356224', 'Med-Surg Nursing', 'Nursing', 628.00, 'Yes', 'Sharon L. Lewis, Shannon Ruff Dirksen, Margaret M. Heitkemper, Linda Bucher', 'Mosby'),
('9780323390228', 'Pharm & Nursing Process', 'Nursing', 530.00, 'Yes', 'Linda Lane Lilley, Shelly Rainforth Collins, Julie S. Snyder', 'Mosby'),

-- Fashion Design
('9781501315388', 'Fashion Sketchbook', 'FD', 325.00, 'Yes', 'Bina Abling', 'Fairchild Books'),
('9781501317979', 'Draping for Apparel Design', 'FD', 427.00, 'Yes', 'Helen Joseph-Armstrong', 'Fairchild Books');


INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(301, 'Rahul', 'Chennai 101', '2021-02-01'),
(302, 'Sneha', 'Bangalore 202', '2021-03-15'),
(303, 'Ravi', 'Hyderabad 303', '2021-04-10'),
(304, 'Priya', 'Pune 404', '2021-05-20'),
(305, 'Arjun', 'Mumbai 505', '2021-06-25'),
(306, 'Anita', 'Delhi 606', '2021-07-30'),
(307, 'Vikram', 'Jaipur 707', '2021-08-05'),
(308, 'Divya', 'Ahmedabad 808', '2021-09-10'),
(309, 'Nikhil', 'Surat 909', '2021-10-15'),
(310, 'Kavita', 'Kolkata 110', '2021-11-20'),
(311, 'Manish', 'Patna 211', '2021-12-25'),
(312, 'Pooja', 'Lucknow 312', '2022-01-10'),
(313, 'Amit', 'Bhopal 413', '2022-02-15'),
(314, 'Sunita', 'Nagpur 514', '2022-03-20'),
(315, 'Rohan', 'Indore 615', '2022-04-25'),
(316, 'Meera', 'Coimbatore 716', '2022-05-30'),
(317, 'Suresh', 'Mysore 817', '2022-06-10'),
(318, 'Naina', 'Vijayawada 918', '2022-07-15'),
(319, 'Vikas', 'Visakhapatnam 119', '2022-08-20'),
(320, 'Leela', 'Thiruvananthapuram 220', '2022-09-25'),
(321, 'Ashok', 'Madurai 321', '2022-10-30'),
(322, 'Kiran', 'Mangalore 422', '2022-11-05'),
(323, 'Shweta', 'Ranchi 523', '2022-12-10'),
(324, 'Anil', 'Raipur 624', '2023-01-15'),
(325, 'Gita', 'Chandigarh 725', '2023-02-20'),
(326, 'Rakesh', 'Bhubaneswar 826', '2023-03-25');


INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(401, 301, 'AI: Modern Approach', '2023-01-15', '9780262032933'),
(402, 303, 'Intro to Algorithms', '2023-02-20', '9780262033848'),
(403, 305, 'Comm Sys Engineering', '2023-03-25', '9780132543031'),
(404, 307, 'Electronic Comm Sys', '2023-04-30', '9789339221003'),
(405, 309, 'Electric Circuits', '2023-05-05', '9781119235382'),
(406, 311, 'Microelectronic Circuits', '2023-06-10', '9780133760033'),
(407, 313, 'Hist of Eng: Classical & Medieval', '2023-07-15', '9780415152913'),
(408, 315, 'Eng Mech: Statics', '2023-08-20', '9780136088394');

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(501, 301, 'AI: Modern Approach', '2023-03-01', '9780262032933'),
(502, 303, 'Intro to Algorithms', '2023-04-05', '9780262033848'),
(503, 305, 'Comm Sys Engineering', '2023-05-10', '9780132543031'),
(504, 307, 'Electronic Comm Sys', '2023-06-15', '9789339221003'),
(505, 309, 'Electric Circuits', '2023-07-20', '9781119235382'),
(506, 311, 'Microelectronic Circuits', '2023-08-25', '9780133760033'),
(507, 313, 'Hist of Eng: Classical & Medieval', '2023-09-30', '9780415152913'),
(508, 315, 'Eng Mech: Statics', '2023-10-05', '9780136088394');


-- Display all the tables and Write the queries for the following :

#To show Books table

select * from Branch;

#To show Employee table

select * from Employee;

#To show Books table

select * from Books;

#To show IssueStatus table

select * from IssueStatus;

#To show ReturnStatus table

select * from ReturnStatus;

select Book_title,Category,Rental_price
from Books
where status='Yes';

select Emp_name,Salary 
from Employee
order by Salary desc;


select Book_title,Customer_name
from IssueStatus i 
join Books b 
on i.Isbn_book=b.ISBN
join Customer c
on i.Issued_cust=c.Customer_Id;


select Category,count(*) as Total_Book
from Books
group by Category;


select Emp_name,Position,Salary
from Employee
where Salary>50000.00;



select  Customer_name,Reg_date
from Customer 
where Reg_date<'2022-01-01'
and Customer_Id not in(select Issued_cust from IssueStatus);
 
-- 7. Display the branch numbers and the total count of employees in each branch.

select Branch_no,count(*) as Total_Employee
from Employee 
group by Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.

select Customer_Id,Customer_name,Issue_date
from Customer c join IssueStatus i
on c.Customer_Id=i.Issued_cust
where Issue_date between '2023-06-01' and '2023-06-30';

-- 9. Retrieve book_title from book table containing history.

select Book_title,Category
from Books
where Book_title like'%history%';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees

select Branch_no,count(*) as Total_Emloyee
from Employee
group by Branch_no
having count(*)>5;






    
