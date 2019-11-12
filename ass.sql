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
    Sex varchar(30)
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


INSERT INTO EMPOLYEE VALUES (111,'M','1993-02-01','111@i.ac.in',2011,8.56,'Apun','Aur','Pappu');
INSERT INTO EMPOLYEE VALUES (112,'F','1993-07-05','112@i.ac.in',2011,9.58,'Nita','Rit','Soni');
INSERT INTO EMPOLYEE VALUES (113,'F','1994-02-09','113@i.ac.in',2012,5,'Sita','Nit','Sona');
INSERT INTO EMPOLYEE VALUES (114,'F','1995-09-16','114@i.ac.in',2013,5.67,'Gita','Sit','Soni');
INSERT INTO EMPOLYEE VALUES (115,'F','1994-06-28','115@i.ac.in',2013,9.29,'Rita','Git','Sony');
INSERT INTO EMPOLYEE VALUES (116,'M','1993-11-11','116@i.ac.in',2011,8.6,'Ekaur','Apun','Pappu');
INSERT INTO EMPOLYEE VALUES (117,'M','1995-04-22','117@i.ac.in',2013,NULL,'Anupam',NULL,'Singh');
INSERT INTO EMPOLYEE VALUES (118,'M','1994-12-15','118@i.ac.in',2013,8,'Rishabh',NULL,'Goel');
INSERT INTO EMPOLYEE VALUES (119,'F','1991-03-23','119@i.ac.in',2010,8.2,'Tanika','Kumari','Rawat');
INSERT INTO EMPOLYEE VALUES (120,'F','1993-12-23','120@i.ac.in',2011,7,'Anita',NULL,'Gupta');
INSERT INTO EMPOLYEE VALUES (121,'F','1994-01-31','121@i.ac.in',2012,7.8,'Rohini',NULL,'Jindal');
INSERT INTO EMPOLYEE VALUES (122,'M','1995-08-27','122@i.ac.in',2013,6.6,'Atul',NULL,'Goyal');
INSERT INTO EMPOLYEE VALUES (123,'M','1996-11-14','123@i.ac.in',2014,5.2,'Shahid','Afreedi','Khan');
INSERT INTO EMPOLYEE VALUES (124,'F','1992-10-16','124@i.ac.in',2010,8.1,'Surbhi','K.','Reddy');
INSERT INTO EMPOLYEE VALUES (125,'M','1993-05-24','125@i.ac.in',2011,9.5,'Aditya','Kumari','Poul');
INSERT INTO EMPOLYEE VALUES (126,'M','1992-02-07','126@i.ac.in',2010,7.9,'Rohan','kumari','Aggrawal');
INSERT INTO EMPOLYEE VALUES (127,'F','1993-08-04','127@i.ac.in',2012,8.3,'Shalini','Mohan','Satre');
INSERT INTO EMPOLYEE VALUES (128,'M','1994-01-17','128@i.ac.in',2013,8.5,'Mohan',NULL,'Chawala');
INSERT INTO EMPOLYEE VALUES (129,'F','1993-06-12','129@i.ac.in',2013,9.2,'Swati',NULL,'Mittal');
INSERT INTO EMPOLYEE VALUES (130,'M','1996-10-18','130@i.ac.in',2014,6,'Arun','Dev','Kaul');
INSERT INTO EMPOLYEE VALUES (131,'F','1996-09-12','131@i.ac.in',2015,5.3,'Ronak','Kumari','Chouhan');
INSERT INTO EMPOLYEE VALUES (132,'F','1993-08-04','132@i.ac.in',2012,7.7,'Ropal','Bala','Tak');
INSERT INTO EMPOLYEE VALUES (133,'M','2009-01-13','133@i.ac.in',2011,10,'Akhil','Prakash','Gupta');

INSERT INTO Customers VALUES ('F11','Rakesh Gupta','221 WH','F11@i.ac.in','8888888887','a.ac.in/F11');
INSERT INTO Customers VALUES ('F12','Nyna Chari','331 WH','F12@i.ac.in','9898745548','a.ac.in/F12');
INSERT INTO Customers VALUES ('F13','Ryna Sharma','335 WH','F13@i.ac.in','9874589632','a.ac.in/F13');
INSERT INTO Customers VALUES ('F14','Syna Rao','118 WH','F14@i.ac.in','7894587459','a.ac.in/F14');
INSERT INTO Customers VALUES ('F15','Rini Jha','120 WH','F15@i.ac.in','8978452225','a.ac.in/F15');
INSERT INTO Customers VALUES ('F16','Tanvir Ahmed','330 WH','F16@i.ac.in','9865478542','a.ac.in/F16');
INSERT INTO Customers VALUES ('F17','Sarfaraz Masood','320 WH','F17@i.ac.in','8965231478','a.ac.in/F17');
INSERT INTO Customers VALUES ('F18','Amita Patil','100 RH','F18@i.ac.in','9658321232','a.ac.in/F18');
INSERT INTO Customers VALUES ('F19','Gaurav Gupta','101 RH','F19@i.ac.in','9878142536','a.ac.in/F19');
INSERT INTO Customers VALUES ('F20','Moulik Pal','105 RH','F20@i.ac.in','9874586954','a.ac.in/F20');

INSERT INTO Deposit VALUES ("R1","Understanding Data Centre","225 PH","F13");
INSERT INTO Deposit VALUES ("R2","Wireless Networks Centre","118 AH","F11");
INSERT INTO Deposit VALUES ("R3","Robotics Institute","100 RH","F14");
INSERT INTO Deposit VALUES ("R4","CVIT","148 PH","F16");
INSERT INTO Deposit VALUES ("R5","LTRC Centre","226 PH","F20");
INSERT INTO Deposit VALUES ("R6","Cognitive Science Lab","120 AH","F11");

INSERT INTO Guarantor  VALUES ("F11","R2");
INSERT INTO Guarantor  VALUES ("F12","R2");
INSERT INTO Guarantor  VALUES ("F13","R3");
INSERT INTO Guarantor  VALUES ("F14","R3");
INSERT INTO Guarantor  VALUES ("F14","R1");
INSERT INTO Guarantor  VALUES ("F16","R4");
INSERT INTO Guarantor  VALUES ("F15","R5");
INSERT INTO Guarantor  VALUES ("F20","R5");
INSERT INTO Guarantor  VALUES ("F18","R6");
INSERT INTO Guarantor  VALUES ("F19","R6");
INSERT INTO Guarantor  VALUES ("F17","R5");
INSERT INTO Guarantor  VALUES ("F20","R6");

INSERT INTO Dependents  VALUES ("Sem1",'2007-08-01','2007-12-27');
INSERT INTO Dependents  VALUES ("Sem2",'2007-12-28','2008-05-08');
INSERT INTO Dependents  VALUES ("Sem3",'2008-08-01','2008-12-27');
INSERT INTO Dependents  VALUES ("Sem4",'2008-12-28','2009-05-08');

INSERT INTO Beneficiary  VALUES ("C11","Automata Theory",1,5);
INSERT INTO Beneficiary  VALUES ("C12","Data structure and programming",1,5);
INSERT INTO Beneficiary  VALUES ("C13","digital logic theory",1,3);
INSERT INTO Beneficiary  VALUES ("C14","discrete maths",2,5);
INSERT INTO Beneficiary  VALUES ("C15","operating system-II",2,4);
INSERT INTO Beneficiary  VALUES ("C16","operating system-I",3,3);
INSERT INTO Beneficiary  VALUES ("C17","information technology",3,4);
INSERT INTO Beneficiary  VALUES ("C18","language processor-I",4,4);
INSERT INTO Beneficiary  VALUES ("C19","language processor-II",3,5);
INSERT INTO Beneficiary  VALUES ("C20","language processor-III",1,5);


INSERT INTO BRANCH VALUES ("C15","C16");
INSERT INTO BRANCH VALUES ("C20","C18");
INSERT INTO BRANCH VALUES ("C20","C19");
INSERT INTO BRANCH VALUES ("C11","C12");
INSERT INTO BRANCH VALUES ("C11","C13");

INSERT INTO Transactions VALUES ("C11","S1");
INSERT INTO Transactions VALUES ("C12","S1");
INSERT INTO Transactions VALUES ("C13","S1");
INSERT INTO Transactions VALUES ("C14","S1");
INSERT INTO Transactions VALUES ("C15","S1");
INSERT INTO Transactions VALUES ("C16","S2");
INSERT INTO Transactions VALUES ("C17","S2");
INSERT INTO Transactions VALUES ("C18","S3");
INSERT INTO Transactions VALUES ("C19","S3");
INSERT INTO Transactions VALUES ("C20","S3");
INSERT INTO Transactions VALUES ("C11","S2");
INSERT INTO Transactions VALUES ("C12","S2");
INSERT INTO Transactions VALUES ("C13","S2");

INSERT INTO TAKES VALUES ("F11",111,"C11","S1","Sem1",80,"A");
INSERT INTO TAKES VALUES ("F12",111,"C18","S3","Sem2",78,"A-");
INSERT INTO TAKES VALUES ("F11",111,"C17","S2","Sem3",86,"B");
INSERT INTO TAKES VALUES ("F13",111,"C16","S2","Sem1",84,"B-");
INSERT INTO TAKES VALUES ("F13",112,"C16","S2","Sem1",65,"A");
INSERT INTO TAKES VALUES ("F12",112,"C18","S3","Sem2",70,"A");
INSERT INTO TAKES VALUES ("F13",112,"C13","S2","Sem3",90,"A");
INSERT INTO TAKES VALUES ("F12",113,"C18","S3","Sem1",85,"B-");
INSERT INTO TAKES VALUES ("F15",113,"C19","S3","Sem1",85,"B-");
INSERT INTO TAKES VALUES ("F17",113,"C20","S3","Sem2",40,"F");
INSERT INTO TAKES VALUES ("F14",114,"C15","S1","Sem1",50,"B-");
INSERT INTO TAKES VALUES ("F13",114,"C16","S2","Sem2",54,"C-");
INSERT INTO TAKES VALUES ("F12",114,"C12","S2","Sem3",55,"C");
INSERT INTO TAKES VALUES ("F13",114,"C13","S1","Sem1",45,"A");
INSERT INTO TAKES VALUES ("F17",115,"C20","S3","Sem1",85,"A");
INSERT INTO TAKES VALUES ("F12",116,"C18","S3","Sem2",90,"A-");
INSERT INTO TAKES VALUES ("F13",116,"C16","S2","Sem3",92,"A-");
INSERT INTO TAKES VALUES ("F11",116,"C17","S2","Sem1",96,"A");
INSERT INTO TAKES VALUES ("F14",116,"C14","S1","Sem1",90,"B");
INSERT INTO TAKES VALUES ("F13",116,"C13","S2","Sem2",40,"B");
INSERT INTO TAKES VALUES ("F12",119,"C12","S2","Sem3",100,"B");
INSERT INTO TAKES VALUES ("F12",118,"C12","S2","Sem1",80,"B");
INSERT INTO TAKES VALUES ("F13",118,"C13","S2","Sem1",80,"B");
INSERT INTO TAKES VALUES ("F11",117,"C13","S1","Sem2",88,"A");
INSERT INTO TAKES VALUES ("F20",119,"C12","S1","Sem3",82,"A-");
INSERT INTO TAKES VALUES ("F12",121,"C13","S1","Sem2",72,"B");
INSERT INTO TAKES VALUES ("F13",121,"C19","S3","Sem2",75,"B-");
INSERT INTO TAKES VALUES ("F11",122,"C15","S1","Sem3",87,"A");
INSERT INTO TAKES VALUES ("F14",122,"C16","S2","Sem3",90,"B");
INSERT INTO TAKES VALUES ("F14",119,"C17","S2","Sem3",66,"B");
INSERT INTO TAKES VALUES ("F15",122,"C18","S3","Sem3",40,"B-");
INSERT INTO TAKES VALUES ("F11",123,"C19","S3","Sem1",66,"C");
INSERT INTO TAKES VALUES ("F20",119,"C20","S3","Sem3",74,"C-");
INSERT INTO TAKES VALUES ("F19",124,"C11","S2","Sem2",99,"A");
INSERT INTO TAKES VALUES ("F18",125,"C12","S2","Sem1",55,"B-");
INSERT INTO TAKES VALUES ("F16",127,"C13","S2","Sem3",84,"C");
INSERT INTO TAKES VALUES ("F18",127,"C12","S1","Sem3",89,"B-");
INSERT INTO TAKES VALUES ("F17",128,"C14","S1","Sem1",95,"C");
INSERT INTO TAKES VALUES ("F15",119,"C16","S2","Sem3",70,"A");
INSERT INTO TAKES VALUES ("F14",129,"C12","S1","Sem2",92,"A-");
INSERT INTO TAKES VALUES ("F13",120,"C15","S1","Sem2",78,"B");
INSERT INTO TAKES VALUES ("F17",126,"C16","S2","Sem1",70,"B-");
INSERT INTO TAKES VALUES ("F18",131,"C17","S2","Sem3",60,"C-");
INSERT INTO TAKES VALUES ("F20",132,"C14","S1","Sem2",94,"B-");
INSERT INTO TAKES VALUES ("F13",130,"C11","S1","Sem2",85,"A-");
INSERT INTO TAKES VALUES ("F12",133,"C13","S1","Sem1",71,"B");
INSERT INTO TAKES VALUES ("F11",120,"C12","S1","Sem2",40,"C-");
INSERT INTO TAKES VALUES ("F20",130,"C15","S1","Sem2",71,"C");
INSERT INTO TAKES VALUES ("F17",133,"C11","S1","Sem1",86,"B");
INSERT INTO TAKES VALUES ("F12",120,"C20","S3","Sem2",100,"A");
