drop database if exists BANK;
create database BANK;
use BANK;

drop table if exists Transactions;
drop table if exists BRANCH;
drop table if exists Beneficiary;
drop table if exists Dependents;
drop table if exists Guarantor;
drop table if exists EMPOLYEE;
drop table if exists Customers;
drop table if exists Deposits;
drop table if exists Withdraw;
drop table if exists Guarantee_Customer; 
drop table if exists Customers_Mbl;
drop table if exists Guarantor_Mbl;
drop table if exists Dependents_Mbl;
drop table if exists Beneficiary_Mbl;

drop table if exists Security_d;
drop table if exists Finance_d;
drop table if exists IT_d;
drop TABLE if EXISTS LOAN;


create table EMPOLYEE(
	E_Id INT, 
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
	PRIMARY KEY (E_Id)
);
create table Customers(
	Cus_acc_no INT, 
	DoB DATE,
    balance INT,
    HouseNo INT,
	Fname VARCHAR(30) NOT NULL, 
	Mname VARCHAR(30), 
	LName VARCHAR(30),
    AadharNumber INT,
    LandMark varchar(30),
    Sex varchar(30),
    PRIMARY KEY (Cus_acc_no)
);
create table Guarantor (
Cus_acc_no INT,
Account_Number INT,
Branch_NO INT,
G_name INT,
FOREIGN Key (Cus_acc_no) REFERENCES Customers(Cus_acc_no),
Primary Key (Account_Number)

);
create table BRANCH(
    Branch_no int,
    IFCE_Code INT,
    Locations varchar(30),
    B_mgrId INT,
    Primary Key (Branch_no)

	
);
create table Guarantee_Customer (
Cus_acc_no INT,
Account_Number INT,
FOREIGN Key (Cus_acc_no) REFERENCES Customers(Cus_acc_no)

);
create table Transactions(
	Cus_acc_no INT,
    TRANSACTIONID INT,
    Amount INT,
    accType VARchar(20),
    Primary Key(TRANSACTIONID)

);
create table Dependents (
	E_id INT,
    D_Name VARCHAR(30),
    Relationship varchar(20),
    DOB date ,
FOREIGN Key (E_id) REFERENCES EMPOLYEE(E_id),
Primary Key(D_Name)
);
create table Beneficiary (
	Cus_acc_no INT,
    B_Name VARCHAR(30),
    Relationship varchar(20),
    DOB date,
    FOREIGN Key (Cus_acc_no) REFERENCES Customers(Cus_acc_no),
    primary key(B_Name)
);
create table Beneficiary_Mbl(
Cus_acc_no INT,
M_no INT,
B_Name VARCHAR(30),
FOREIGN Key (Cus_acc_no) REFERENCES Customers(Cus_acc_no),
FOREIGN Key (B_Name) REFERENCES Beneficiary(B_Name)


);
          



create table Guarantor_Mbl(
G_acc_no INT,
M_no INT,
Account_Number INT,
FOREIGN Key (Account_Number) REFERENCES Guarantor(Account_Number),
FOREIGN Key (G_acc_no) REFERENCES  Customers(Cus_acc_no)



);
create table  Dependents_Mbl (
E_Id INT,
M_no INT,
D_Name VARCHAR(30), 
FOREIGN Key (E_Id) REFERENCES EMPOLYEE(E_id),
FOREIGN Key (D_Name) REFERENCES Dependents(D_Name)



);
create table Customers_Mbl(
Cus_acc_no INT,
M_no INT,
FOREIGN Key (Cus_acc_no) REFERENCES Customers(Cus_acc_no)


);

create table Deposits( 
     Transaction_id INT,
     Account_Number INT,
     Branch_Number INT,
	 FOREIGN Key (Transaction_id) REFERENCES Transactions(TRANSACTIONID),
      FOREIGN Key (Account_Number) REFERENCES Customers(Cus_acc_no),
      FOREIGN Key (Branch_Number) REFERENCES BRANCH(Branch_no),
      PRIMARY KEY (Transaction_id)

);
create table Withdraw( 
    
    
    Transaction_id INT,
     Account_Number INT,
     Branch_Number INT,
    FOREIGN Key (Transaction_id) REFERENCES Transactions(TRANSACTIONID),
    FOREIGN Key (Account_Number) REFERENCES Customers(Cus_acc_no),
    FOREIGN Key (Branch_Number) REFERENCES BRANCH(Branch_no),
     PRIMARY KEY (Transaction_id)
     );









create table LOAN(
	Acc_NO INT,
    Branch_Number INT,
    E_ID INT,
    G_acc_no INT,
    AMOUNT INT,
    Rate_of_I FLOAT,
    Tenure INT,
    FOREIGN Key (Acc_NO) REFERENCES Customers(Cus_acc_no),
    FOREIGN Key (E_ID) REFERENCES EMPOLYEE(E_ID),
    FOREIGN Key (Branch_Number) REFERENCES BRANCH(Branch_no),
    FOREIGN Key (G_acc_no) REFERENCES Guarantor(Account_Number)
);


INSERT INTO EMPOLYEE VALUES (1,'1993-07-05','112@i.ac.in','2006-07-20','Nita','Rit','Soni',12221211,5,'Finance',3 );
INSERT INTO EMPOLYEE VALUES (2,'1993-05-05','113@i.ac.in','2006-06-20','Neha','raj','S',12222323,4,'IT', NULL);
INSERT INTO EMPOLYEE VALUES (3,'1995-06-05','114@i.ac.in','2006-08-20','Akhil','R','Ralla',45453343,3,'Finance', NULL);
INSERT INTO EMPOLYEE VALUES (4,'1996-05-05','115@i.ac.in','2006-09-20','Anant','a','Aggarwal',134343434,2,'Security', NULL);


