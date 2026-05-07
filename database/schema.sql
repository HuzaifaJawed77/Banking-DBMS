-- ============================================================
--  SECTION 1: DDL — DATABASE & TABLE CREATION
-- ============================================================

DROP DATABASE IF EXISTS BankingManagementSystem;
CREATE DATABASE BankingManagementSystem;
USE BankingManagementSystem;

-- ------------------------------------------------------------
-- TABLE: Branch
-- ------------------------------------------------------------
CREATE TABLE Branch (
    Branch_ID   INT          NOT NULL AUTO_INCREMENT,
    Branch_Code VARCHAR(20)  NOT NULL UNIQUE,
    Branch_Name VARCHAR(100) NOT NULL,
    Address     VARCHAR(255) NOT NULL,
    Phone       VARCHAR(20),
    PRIMARY KEY (Branch_ID)
);

-- ------------------------------------------------------------
-- TABLE: Customer
-- ------------------------------------------------------------
CREATE TABLE Customer (
    Customer_ID   INT          NOT NULL AUTO_INCREMENT,
    First_Name    VARCHAR(100) NOT NULL,
    Last_Name     VARCHAR(100) NOT NULL,
    Date_of_Birth DATE,
    Address       VARCHAR(255),
    Phone         VARCHAR(20),
    Email         VARCHAR(150) UNIQUE,
    PRIMARY KEY (Customer_ID)
);

-- ------------------------------------------------------------
-- TABLE: Individual_Customer  (EER Subtype of Customer)
-- ------------------------------------------------------------
CREATE TABLE Individual_Customer (
    Customer_ID  INT          NOT NULL,
    Nationality  VARCHAR(100),
    Occupation   VARCHAR(100),
    Income_Level VARCHAR(50),
    NIC          VARCHAR(20)  UNIQUE,
    PRIMARY KEY (Customer_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Corporate_Customer  (EER Subtype of Customer)
-- ------------------------------------------------------------
CREATE TABLE Corporate_Customer (
    Customer_ID   INT          NOT NULL,
    Company_Name  VARCHAR(150) NOT NULL,
    Reg_Number    VARCHAR(50)  UNIQUE,
    Industry_Type VARCHAR(100),
    PRIMARY KEY (Customer_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Account
-- ------------------------------------------------------------
CREATE TABLE Account (
    Account_ID     INT           NOT NULL AUTO_INCREMENT,
    Account_Number VARCHAR(30)   NOT NULL UNIQUE,
    Account_Type   ENUM('Savings','Current','Fixed_Deposit') NOT NULL,
    Balance        DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    Opening_Date   DATE          NOT NULL,
    Branch_ID      INT           NOT NULL,
    PRIMARY KEY (Account_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
        ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Savings_Account  (EER Subtype of Account)
-- ------------------------------------------------------------
CREATE TABLE Savings_Account (
    Account_ID       INT           NOT NULL,
    Min_Balance      DECIMAL(10,2) DEFAULT 0.00,
    Interest_Rate    DECIMAL(5,2),
    Withdrawal_Limit INT,
    PRIMARY KEY (Account_ID),
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Current_Account  (EER Subtype of Account)
-- ------------------------------------------------------------
CREATE TABLE Current_Account (
    Account_ID      INT           NOT NULL,
    Overdraft_Limit DECIMAL(10,2) DEFAULT 0.00,
    Monthly_Fee     DECIMAL(8,2),
    Cheque_Book     BOOLEAN       DEFAULT FALSE,
    PRIMARY KEY (Account_ID),
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Fixed_Deposit  (EER Subtype of Account)
-- ------------------------------------------------------------
CREATE TABLE Fixed_Deposit (
    Account_ID     INT           NOT NULL,
    Maturity_Date  DATE,
    Fixed_Rate     DECIMAL(5,2),
    Penalty_Clause DECIMAL(10,2) DEFAULT 0.00,
    PRIMARY KEY (Account_ID),
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Customer_Account  (M:N Junction)
-- ------------------------------------------------------------
CREATE TABLE Customer_Account (
    Customer_ID     INT           NOT NULL,
    Account_ID      INT           NOT NULL,
    Ownership_Share DECIMAL(5,2)  DEFAULT 100.00,
    PRIMARY KEY (Customer_ID, Account_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Account_ID)  REFERENCES Account(Account_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Employee
-- ------------------------------------------------------------
CREATE TABLE Employee (
    Employee_ID INT          NOT NULL AUTO_INCREMENT,
    First_Name  VARCHAR(100) NOT NULL,
    Last_Name   VARCHAR(100) NOT NULL,
    Position    ENUM('Manager','Teller','Loan Officer') NOT NULL,
    Branch_ID   INT          NOT NULL,
    PRIMARY KEY (Employee_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
        ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Manager  (EER Subtype of Employee)
-- ------------------------------------------------------------
CREATE TABLE Manager (
    Employee_ID    INT          NOT NULL,
    Department     VARCHAR(100),
    Mgr_Start_Date DATE,
    Mgr_Level      VARCHAR(50),
    PRIMARY KEY (Employee_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Teller  (EER Subtype of Employee)
-- ------------------------------------------------------------
CREATE TABLE Teller (
    Employee_ID INT         NOT NULL,
    Counter_No  INT,
    Shift_Type  ENUM('Morning','Evening','Night'),
    PRIMARY KEY (Employee_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Loan_Officer  (EER Subtype of Employee)
-- ------------------------------------------------------------
CREATE TABLE Loan_Officer (
    Employee_ID    INT           NOT NULL,
    Loan_Limit     DECIMAL(15,2),
    Specialization VARCHAR(100),
    PRIMARY KEY (Employee_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: External_Customer
-- ------------------------------------------------------------
CREATE TABLE External_Customer (
    ECustomer_ID   INT          NOT NULL AUTO_INCREMENT,
    First_Name     VARCHAR(100),
    Last_Name      VARCHAR(100),
    Bank_Name      VARCHAR(150),
    IBAN_Number    VARCHAR(50)  UNIQUE,
    Account_Number VARCHAR(50),
    PRIMARY KEY (ECustomer_ID)
);

-- ------------------------------------------------------------
-- TABLE: Card
-- ------------------------------------------------------------
CREATE TABLE Card (
    Card_ID         INT          NOT NULL AUTO_INCREMENT,
    Card_Number     VARCHAR(20)  NOT NULL UNIQUE,
    Card_Type       ENUM('Debit','Credit') NOT NULL,
    Expiration_Date DATE         NOT NULL,
    CVV_Code        CHAR(4)      NOT NULL,
    Issue_Date      DATE         NOT NULL,
    Card_Status     ENUM('Active','Blocked','Expired') DEFAULT 'Active',
    Account_ID      INT          NOT NULL,
    Customer_ID     INT          NOT NULL,
    PRIMARY KEY (Card_ID),
    FOREIGN KEY (Account_ID)  REFERENCES Account(Account_ID)  ON UPDATE CASCADE,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Transaction
-- ------------------------------------------------------------
CREATE TABLE Transaction (
    Transaction_ID      INT           NOT NULL AUTO_INCREMENT,
    Transaction_Date    DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Transaction_Type    ENUM('Deposit','Withdrawal','Transfer') NOT NULL,
    Amount              DECIMAL(15,2) NOT NULL CHECK (Amount > 0),
    Description         VARCHAR(255),
    Sender_Account_ID   INT           DEFAULT NULL,
    Receiver_Account_ID INT           DEFAULT NULL,
    ECustomer_ID        INT           DEFAULT NULL,
    Card_ID             INT           DEFAULT NULL,
    Employee_ID         INT           DEFAULT NULL,
    PRIMARY KEY (Transaction_ID),
    FOREIGN KEY (Sender_Account_ID)   REFERENCES Account(Account_ID)           ON UPDATE CASCADE,
    FOREIGN KEY (Receiver_Account_ID) REFERENCES Account(Account_ID)           ON UPDATE CASCADE,
    FOREIGN KEY (ECustomer_ID)        REFERENCES External_Customer(ECustomer_ID) ON UPDATE CASCADE,
    FOREIGN KEY (Card_ID)             REFERENCES Card(Card_ID)                 ON UPDATE CASCADE,
    FOREIGN KEY (Employee_ID)         REFERENCES Employee(Employee_ID)         ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Deposit  (EER Subtype of Transaction)
-- ------------------------------------------------------------
CREATE TABLE Deposit (
    Transaction_ID INT          NOT NULL,
    Deposit_Method VARCHAR(100),
    Source_Account VARCHAR(50),
    PRIMARY KEY (Transaction_ID),
    FOREIGN KEY (Transaction_ID) REFERENCES Transaction(Transaction_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Withdrawal  (EER Subtype of Transaction)
-- ------------------------------------------------------------
CREATE TABLE Withdrawal (
    Transaction_ID    INT         NOT NULL,
    Withdrawal_Method VARCHAR(100),
    ATM_ID            VARCHAR(50),
    PRIMARY KEY (Transaction_ID),
    FOREIGN KEY (Transaction_ID) REFERENCES Transaction(Transaction_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Transfer  (EER Subtype of Transaction)
-- ------------------------------------------------------------
CREATE TABLE Transfer (
    Transaction_ID   INT           NOT NULL,
    Transfer_Fee     DECIMAL(8,2)  DEFAULT 0.00,
    Destination_Bank VARCHAR(150),
    PRIMARY KEY (Transaction_ID),
    FOREIGN KEY (Transaction_ID) REFERENCES Transaction(Transaction_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Loan
-- ------------------------------------------------------------
CREATE TABLE Loan (
    Loan_ID          INT           NOT NULL AUTO_INCREMENT,
    Loan_Amount      DECIMAL(15,2) NOT NULL,
    Interest_Rate    DECIMAL(5,2)  NOT NULL,
    Term             INT           NOT NULL COMMENT 'Duration in months',
    Application_Date DATE          NOT NULL,
    Approval_Status  ENUM('Approved','Pending','Rejected') DEFAULT 'Pending',
    Customer_ID      INT           NOT NULL,
    Branch_ID        INT           NOT NULL,
    PRIMARY KEY (Loan_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON UPDATE CASCADE,
    FOREIGN KEY (Branch_ID)   REFERENCES Branch(Branch_ID)    ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- TABLE: Loan_Payment
-- ------------------------------------------------------------
CREATE TABLE Loan_Payment (
    Payment_ID        INT           NOT NULL AUTO_INCREMENT,
    Loan_ID           INT           NOT NULL,
    Customer_ID       INT           NOT NULL,
    Account_ID        INT           NOT NULL,
    Payment_Date      DATE          NOT NULL,
    Payment_Amount    DECIMAL(15,2) NOT NULL,
    Remaining_Balance DECIMAL(15,2),
    Payment_Status    ENUM('Paid','Overdue','Pending') DEFAULT 'Pending',
    Late_Fee          DECIMAL(8,2)  DEFAULT NULL,
    PRIMARY KEY (Payment_ID),
    FOREIGN KEY (Loan_ID)     REFERENCES Loan(Loan_ID)         ON UPDATE CASCADE,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON UPDATE CASCADE,
    FOREIGN KEY (Account_ID)  REFERENCES Account(Account_ID)   ON UPDATE CASCADE
);
