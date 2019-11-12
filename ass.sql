create database BANK;
use BANK;

drop table if exists Transactions;
drop table if exists BRANCH;
drop table if exists Beneficiary;
drop table if exists Dependents;
drop table if exists Guarantor;
drop table if exists EMPOLYEE;
drop table if exists Customers;
drop table if exists Deposit;
drop table if exists Withdraw;



create table EMPOLYEE(
	Id INT, 
	DoB DATE, 
	Email VARCHAR(30), 
	JoingDate DATE NOT NULL,
	Fname VARCHAR(30) NOT NULL, 
    Mname VARCHAR(30), 
	LName VARCHAR(30),
    AadharNumber INT,
    BranchNumber INT,
    DeptName VARCHAR(30),
    MgrID INT,
	PRIMARY KEY (Id)
);
create table Customers(
	Id INT, 
	DoB DATE,
    balance INT,
    HouseNo INT,
	Fname VARCHAR(30) NOT NULL, 
	Mname VARCHAR(30), 
	LName VARCHAR(30),
    AadharNumber INT,
    LandMark varchar(30),
    Sex varchar(30),
    PRIMARY KEY (Id)
);
create table Deposit( 
    
    
    Transaction_id INT,
     Account_Number INT,
     Branch_Number INT

);
create table Withdraw( 
    
    
    Transaction_id INT,
     Account_Number INT,
     Branch_Number INT

);

create table Guarantor (
Cus_acc_no INT,
Account_Number INT,
Branch_NO INT,
G_name INT
	
);
create table Dependents (
	E_id INT,
    Mob_no INT,
    Relationship varchar(20),
    DOB date 
);
create table Beneficiary (
	Cus_acc_no INT,
    Mob_no INT,
    Relationship varchar(20),
    DOB date 
);
create table BRANCH(
    Branch_no int,
    IFCE_Code INT,
    Locations varchar(30),
    B_mgrId INT
	
);
create table Transactions(
	Cus_acc_no INT,
    TRANSACTIONID INT,
    Amount INT,
    accType VARchar(20) 
);


INSERT INTO EMPOLYEE VALUES (1,'1993-07-05','112@i.ac.in','2006-07-20','Nita','Rit','Soni',12221211,5,'Finance',3 );
