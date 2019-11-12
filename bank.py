import subprocess as sp
import pymysql
import pymysql.cursors
import re

def chkaccnt():
    count1=1;
    while(count1):
        x=(input("Account Number: "))
        y=re.search(r"[0-9]{11}",x)
        if(y!=None):
            count1=0
            return x
        else:
            print("Enter Account Number is not 11 digit integer")
            print("Please Re-enter")

def chkcode():
    count1=1;
    while(count1):
        x=(input("IFSC CODE: "))
        y=re.search(r"[0-9]{11}",x)
        if(y!=None):
            count1=0
            return x
        else:
            print("Enter ifsc code is not 11 digit integer")
            print("Please Re-enter")

def chkaadhar():
    count1=1
    while(count1):
        x=(input("Aadhar Number: "))
        y=re.search(r"[0-9]{12}",x)
        if(y!=None):
            count1=0
            return x
        else:
            print("entered Aadhar Number is not 12 digit integer")
            print("Please Re-enter")

def chkdob(i):
    count1=1
    while(count1):
        if(i==0):
            x=input("DateofBirth: YYYY-MM-DD: ")
        else:
            x=input("Joiningdate: YYYY-MM-DD: ")
        y=re.search(r"[0-9]{4}-[0-9]{2}-[0-9]{2}",x)
        if(y==None):
            print("Error in the date format 4 digits for year initially than 2 for month and after that 2 for day and also not forget to use hyphen between them.")

        else:
            count1=0
            return x

def chkmob():
    count1=1
    while(count1):
        x=input("Enter a valid 10 digit Number: ")
        y=re.search(r"[0-9]{10}",x)
        if(y!=None):
            count1=0
            return x
            # cust["MobileNumber"]=int(x)
        else:
            print("Enter Mobile Number is not 10 digit")
            print("Please Re-enter")

def chkid(i):
    count1=1
    while(count1):
        if(i==0):
            x=input("Enter a 5-digit Employee Id: ")
        else:
            x=input("Enter a 5-digit Manager Id: ")
        y=re.search(r"[0-9]{5}",x)
        if(y!=None):
            count1=0
            return x
        else:
            print("Entered Id is not 5 digit integer")
            print("Please Re-enter")


def addbene(accnt):
    try:
        bene={}
        print("Enter beneficiary details")
        bene["Cust_accnt_number"]=int(accnt)
        bene["Name"]=input("Name: ")
        bene["Relationship"]=input("Relationship: ")
        bene["DateofBirth"]=chkdob(0)
        query="INSERT INTO BENEFICIARY("Cust_acct_number","Name","Relationship","Date of Birth") VALUES (%d,'%s','%s','%s')" %(bene["Cust_accnt_number"],bene["Name"],bene["Relationship"],bene["DateofBirth"])
        print(query)
        cur.execute(query)
        con.commit()
        n=int(input("How many mobile numbers have been registered by beneficiary: "))
        for i in range(n):
            lst=[]
            lst[i]=chkmob()
            quer1="INSERT INTO BENEFICIARY_MBL("Cust_acct_number","MobileNumber","Name") VALUES(%d,%d,'%s')"%(bene["Cust_acct_number"],int(lst[i]),bene["Name"])
            print(quer1)
            cur.execute(quer1)
            con.commit()


    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)

def delbene(accnt):
    try:
        query="Delete from BENEFICIARY WHERE Cust_accnt_number=%d"%(int(accnt))
        print(query)
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)


        # bene["DateofBirth"]=input("DateofBirth YYYY-MM-DD: ")


def addcustomer():
    try:
        cust={}
        print("Enter new customer's details: ")
        cust["Fname"]=(input("First_name: "))
        cust["Mname"]=(input("Middle name: "))
        cust["Lname"]=(input("Last name: "))
        cust["AccountNumber"]=int(chkaccnt())
        cust["AadharNumber"]=int(chkaadhar());
        cust["HouseNumber"]=(input("House Number: "))
        cust["StreetNumber"]=input("Street Number: ")
        cust["Landmark"]=input("Landmark: ")
        cust["DateofBirth"]=chkdob(0)
        cust["Balance"]=int(input("Enter his Account Balance: "))
        cust["Sex"]=input("Enter sex (either Male or Female as written): ")

        query="INSERT INTO CUSTOMER("Fname","Mname","Lname","AccountNumber","AadharNumber","HouseNumber","StreetNumber","Landmark","DateofBirth","Balance","Sex") VALUES ('%s','%s','%s',%d,%d,%d,%d,'%s','%s',%f,'%s')"%(cust["Fname"],cust["Mname"],cust["Lname"],cust["AccountNumber"],cust["AadharNumber"],cust["HouseNumber"],cust["StreetNumber"],cust["Landmark"],cust["DateofBirth"],cust["Balance"],cust["Sex"])

        print(query)
        cur.execute(query)
        con.commit()

        n=int(input("How many mobile numbers have been registered by customer: "))
        for i in range(n):
            lst=[]
            lst[i]=chkmob()
            quer1="INSERT INTO CUSTOMER_MBL("Cust_acct_number","MobileNumber") VALUES(%d,%d)"%(cust["AccountNumber"],int(lst[i]))
            print(quer1)
            cur.execute(quer1)
            con.commit()

        n1=int(input("How many beneficiaries does this customer have? "))
        for i in range(n1):
            addbene(cust["AccountNumber"])

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        
return

def updatecustomer():
    try:
        accnt=int(input("Enter the account number of customer which has to be updated: "))
        print("1. for updating First name of customer")
        print("2. for updating Middle name of customer")
        print("3. for updating Last name of customer")
        print("4. for updating Aadhar Number of customer")
        print("5. for updating House Number of customer")
        print("6. for updating Street numberer of customer")
        print("7. for updating Landmark of customer")
        print("8. for updating Date of Birth of customer")
        print("9. for updating Sex of customer")
        x=int(input())
        query=0
        if(x==1):
            y=input("Enter First Name: ")
            query="Update CUSTOMER SET FNAME='%s'"%(y)
        elif(x==2):
            y=input("Enter Middle Name: ")
            query="Update CUSTOMER SET MNAME='%s'"%(y)
        elif(x==3):
            y=input("Enter Last Name: ")
            query="Update CUSTOMER SET LNAME='%s'"%(y)
        elif(x==4):
            y=int(chkaadhar())
            query="Update CUSTOMER SET AadharNumber=%d"%(y)
        elif(x==5):
            y=int(input("Enter House Number: "))
            query="Update CUSTOMER SET HouseNumber=%d"%(y)
        elif(x==6):
            y=int(input("Enter Street Number: "))
            query="Update CUSTOMER SET StreetNumber=%d"%(y)
        elif(x==7):
            y=input("Enter Landmark: ")
            query="Update CUSTOMER SET Landmark='%s'"%(y)
        elif(x==8):
            y=chkdob(0)
            query="Update CUSTOMER SET DateofBirth='%s'"%(y)
        elif(x==9):
            y=input("Enter Sex: ")
            query="Update CUSTOMER SET Sex='%s'"%(y)

        print(query)
        cur.execute(query)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)

def delcustomer():
    try:
        accnt=int(chkaccnt())
        query="DELETE FROM CUSTOMER WHERE AccountNumber=%d"%(accnt)
        print(query)
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)

def subcls(dept,id1):
    try:
        query=0
        if(dept=="IT"):
            a=input("Enter the skill which you have acquired: ")
            b=input("Enter the language which you know: ")
            query="INSERT INTO IT("Id","CP SKILLS","CP LANG") VALUES(%d,'%s','%s')"%(int(id1),a,b)

        elif(dept=="Finance"):
            a=input("Enter the Qualification: ")
            b=int(input("Enter the typing Speed: "))
            query="INSERT INTO Finance("Id","Qualification","TypingSpeed") VALUES(%d,'%s',%d)"%(int(id1),a,b)

        elif(dept=="Security"):
            a=int(input("Enter the Experience: "))
            query="INSERT INTO Security("Id","Experience") VALUES(%d,%d)"%(int(id1),a)

        print(query)
        cur.execute(query)
        con.commit()  

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)

def adddep(id):
    try:
        dep={}
        print("Enter dependent details")
        dep["E_id"]=int(id)
        dep["Name"]=input("Name: ")
        dep["Relationship"]=input("Relationship: ")
        dep["DateofBirth"]=chkdob(0)
        query="INSERT INTO DEPENDENT("E_id","Name","Relationship","Date of Birth") VALUES (%d,'%s','%s','%s')" %(dep["E_id"],dep["Name"],dep["Relationship"],dep["DateofBirth"])
        print(query)
        cur.execute(query)
        con.commit()
        n=int(input("How many mobile numbers have been registered by beneficiary: "))
        for i in range(n):
            lst=[]
            lst[i]=chkmob()
            quer1="INSERT INTO DEPENDENT_MBL("E_id","MobileNumber","Name") VALUES(%d,%d,'%s')"%(dep["E_id"],int(lst[i]),dep["Name"])
            print(quer1)
            cur.execute(quer1)
            con.commit()
        
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)

def addemployee():
    try:
        emp={}
        print("Enter new employee's details: ")
        emp["Fname"]=(input("First_name: "))
        emp["Mname"]=(input("Middle name: "))
        emp["Lname"]=(input("Last name: "))
        emp["Id"]=int(chkid(0))
        emp["AadharNumber"]=int(chkaadhar());
        emp["BranchNumber"]=(input("Branch Number: "))
        # emp["StreetNumber"]=input("Street Number: ")
        emp["DeptName"]=input("Dept. Name: ")
        subcls(emp["DeptName"],emp["Id"])
        emp["DateofBirth"]=chkdob(0)
        emp["Salary"]=int(input("Enter his Salary: "))
        emp["Mgr_id"]=int(chkid(1))
        emp["Joiningdate"]=chkdob(1)
        # emp["Sex"]=input("Enter sex (either Male or Female as written): ")

        query="INSERT INTO EMPLOYEE("Fname","Mname","Lname","Id","AadharNumber","Mgr_id","BranchNumber","DeptName","DateofBirth","Salary","Joiningdate") VALUES ('%s','%s','%s',%d,%d,%d,%d,'%s','%s',%f,'%s')"%(emp["Fname"],emp["Mname"],emp["Lname"],emp["Id"],emp["AadharNumber"],emp["Mgr_id"],emp["BranchNumber"],emp["DeptName"],emp["DateofBirth"],emp["Salary"],emp["Joiningdate"])

        print(query)
        cur.execute(query)
        con.commit()

        n1=int(input("How many beneficiaries does this empomer have? "))
        for i in range(n1):
            adddep(emp["Id"])

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)

return

def updateemployee():
    try:
        id=int(input("Enter the id of employee which has to be updated: "))
        print("1. for updating First name of employee")
        print("2. for updating Middle name of employee")
        print("3. for updating Last name of employee")
        print("4. for updating Aadhar Number of employee")
        print("5. for updating Branch Number of employee")
        print("6. for updating Mgr_id of employee")
        print("7. for updating DeptName of employee")
        print("8. for updating Date of Birth of employee")
        print("9. for updating Joiningdate of employee")
        print("10. for updating Salary of employee")
        dept="SELECT DeptName FROM EMPLOYEE WHERE Id=%d"%(id)
        x=int(input())
        query=0
        if(x==1):
            y=input("Enter First Name: ")
            query="Update EMPLOYEE SET FNAME='%s'"%(y)
        elif(x==2):
            y=input("Enter Middle Name: ")
            query="Update EMPLOYEE SET MNAME='%s'"%(y)
        elif(x==3):
            y=input("Enter Last Name: ")
            query="Update EMPLOYEE SET LNAME='%s'"%(y)
        elif(x==4):
            y=int(chkaadhar())
            query="Update EMPLOYEE SET AadharNumber=%d"%(y)
        elif(x==5):
            y=int(input("Enter Branch Number: "))
            query="Update EMPLOYEE SET BranchNumber=%d"%(y)
        elif(x==6):
            y=int(input("Enter Mgr_id: "))
            query="Update EMPLOYEE SET Mgr_id=%d"%(y)
        elif(x==7):
            quer1="DELETE FROM %s WHERE Id=%d",%(dept,id)
            y=input("Enter DeptName: ")
            query="Update EMPLOYEE SET DeptName='%s'"%(y)
            subcls(y,id)
        elif(x==8):
            y=chkdob(0)
            query="Update EMPLOYEE SET DateofBirth='%s'"%(y)
        elif(x==9):
            y=chkdob(1)
            # y=input("Enter Joining: ")
            query="Update EMPLOYEE SET Joiningdate='%s'"%(y)
        elif(x==10):
            y=int(input("Enter salary: "))
            query="Update EMPLOYEE SET SALARY=%d"%(y)

        print(query)
        cur.execute(query)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)

def delemployee():
    try:
        id=int(input("Enter id of Employee to be deleted: "))
        query="DELETE FROM EMPLOYEE WHERE Id=%d"%(id)
        print(query)
        cur.execute(query)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)

def addbranch():
    try:
        branch={}
        print("Please enter the branch details: ")
        branch["BranchNumber"]=int(input("Enter the Branch number: "))
        branch["IFSCcode"]=int(chkcode())
        branch["Location"]=input("Enter the location of Branch: ")
        branch["BMgr_id"]=int(chkid(1))

        query="INSERT INTO BRANCH("BranchNumber","IFSCcode","Location","BMgr_id") VALUES (%d,%d,'%s',%d)"%(branch["BranchNumber"],branch["IFSCcode"],branch["Location"],branch["BMgr_id"])
        print(query)
        cur.execute(query)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)

def delbranch():
    try:
        no=int(input("Please enter the branch number to be deleted: "))
        query="DELETE FROM BRANCH WHERE BranchNumber=%d"%(no)
        print(query)
        cur.execute(query)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)

def transaction():
    try:
        trans={}
        print("Please enter all the transaction's details: ")
        trans["Transaction_id"]=int(input("Please enter the transaction id: "))
        trans["Cust_accnt_number"]=int(input("Please enter the account number: "))
        trans["Amount"]=int(input("Please enter the amount: "))
        trans["Type"]=input("Tell whether transaction is deposit or withdrawal: ")
        # if(trans["Type"]=="Withdrawal"):
            # withdrawal(trans["Transaction_id"],trans["Amount"])
        # else:
            # deposit(trans["Transaction_id"],trans["Amount"])

        query="INSERT INTO TRANSACTION("Transaction_id","Cust_accnt_number","Amount","Type") VALUES (%d,%d,%d,'%s')"%(trans["Transaction_id"],trans["Cust_accnt_number"],trans["Amount"],trans["Type"])
        print(query)
        cur.execute(query)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        

def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch==1): 
        addcustomer()
    elif(ch==2):
        addemployee()
    elif(ch==3):
        addbranch()
    elif(ch==4):
        addtransaction()
    else:
        print("Error: Invalid Option")


while(1):
    tmp = sp.call('clear',shell=True)
    username = input("Username: ")
    password = input("Password: ")

    try:
        con = pymysql.connect(host='localhost',
                user=username,
                password=password,
                db='BANK',
                cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear',shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")
        tmp = input("Enter any key to CONTINUE>")

        with con:
            cur = con.cursor()
            while(1):
                tmp = sp.call('clear',shell=True)
                print("1. Add a new customer")
                print("2. Add a new employee")
                print("3. Add a new branch")
                print("4. Add a new transaction")
                print("0. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear',shell=True)
                if ch==0:
                    break
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")


    except:
        tmp = sp.call('clear',shell=True)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
    
   