
-- ------------------------------------------------------------
-- Branches (5)
-- ------------------------------------------------------------
INSERT INTO Branch (Branch_Code, Branch_Name, Address, Phone) VALUES
('KHI-001', 'Karachi Main',   '123 M.A. Jinnah Road, Karachi',     '021-111222333'),
('LHR-001', 'Lahore Mall',    '45 Mall Road, Lahore',              '042-333444555'),
('ISB-001', 'Islamabad Blue', '7 Blue Area, Islamabad',            '051-555666777'),
('PEW-001', 'Peshawar City',  '12 GT Road, Peshawar',              '091-777888999'),
('QTA-001', 'Quetta Central', '88 Zarghoon Road, Quetta',          '081-222333444');

-- ------------------------------------------------------------
-- Customers (15 — mix of individual and corporate)
-- ------------------------------------------------------------
INSERT INTO Customer (First_Name, Last_Name, Date_of_Birth, Address, Phone, Email) VALUES
('Ahmed',    'Khan',     '1990-05-12', 'Block 4, PECHS, Karachi',       '0300-1234567', 'ahmed.khan@mail.com'),
('Sara',     'Ali',      '1985-08-22', 'Gulberg III, Lahore',           '0311-2345678', 'sara.ali@mail.com'),
('Omar',     'Sheikh',   '1978-01-30', 'F-8 Markaz, Islamabad',         '0321-3456789', 'omar.sheikh@mail.com'),
('Fatima',   'Siddiqui', '1995-03-18', 'Hayatabad Phase 3, Peshawar',   '0333-4567890', 'fatima.s@mail.com'),
('Bilal',    'Raza',     '1982-11-05', 'Satellite Town, Quetta',        '0345-5678901', 'bilal.raza@mail.com'),
('Ayesha',   'Mahmood',  '1993-07-25', 'Clifton Block 5, Karachi',      '0312-6789012', 'ayesha.m@mail.com'),
('Usman',    'Farooq',   '1988-12-14', 'Model Town, Lahore',            '0322-7890123', 'usman.f@mail.com'),
('Hina',     'Noor',     '1997-04-09', 'G-11, Islamabad',               '0301-8901234', 'hina.noor@mail.com'),
('Zara',     'Qureshi',  '1991-09-30', 'University Road, Peshawar',     '0344-9012345', 'zara.q@mail.com'),
('Farhan',   'Waqar',    '1980-06-17', 'Jinnah Town, Quetta',           '0315-0123456', 'farhan.w@mail.com'),
('Imran',    'Yousuf',   '1975-02-28', 'Defence Phase 6, Karachi',      '0336-1234560', 'imran.y@mail.com'),
('Sana',     'Butt',     '1999-10-11', 'Johar Town, Lahore',            '0307-2345671', 'sana.butt@mail.com'),
('Tariq',    'Mirza',    '1983-08-03', 'E-7, Islamabad',                '0317-3456782', 'tariq.m@mail.com'),
('Mehwish',  'Iqbal',    '1996-01-22', 'Ring Road, Peshawar',           '0348-4567893', 'mehwish.i@mail.com'),
('Shahzad',  'Enterprises', '1970-05-05', 'I.I. Chundrigar Road, Karachi', '0300-9999000', 'shahzad.ent@corp.com');

-- Individual customers (1–14)
INSERT INTO Individual_Customer (Customer_ID, Nationality, Occupation, Income_Level, NIC) VALUES
(1,  'Pakistani', 'Engineer',         'High',   '42101-1234567-1'),
(2,  'Pakistani', 'Teacher',          'Medium', '35202-2345678-2'),
(3,  'Pakistani', 'Businessman',      'High',   '61101-3456789-3'),
(4,  'Pakistani', 'Doctor',           'High',   '17301-4567890-4'),
(5,  'Pakistani', 'Government Officer','Medium','83101-5678901-5'),
(6,  'Pakistani', 'Lawyer',           'High',   '42201-6789012-6'),
(7,  'Pakistani', 'Accountant',       'Medium', '35301-7890123-7'),
(8,  'Pakistani', 'Software Developer','High',  '61201-8901234-8'),
(9,  'Pakistani', 'Nurse',            'Medium', '17401-9012345-9'),
(10, 'Pakistani', 'Trader',           'High',   '83201-0123456-0'),
(11, 'Pakistani', 'Banker',           'High',   '42301-1234561-1'),
(12, 'Pakistani', 'Student',          'Low',    '35401-2345672-2'),
(13, 'Pakistani', 'Architect',        'High',   '61301-3456783-3'),
(14, 'Pakistani', 'Pharmacist',       'Medium', '17501-4567894-4');

-- Corporate customer (15)
INSERT INTO Corporate_Customer (Customer_ID, Company_Name, Reg_Number, Industry_Type) VALUES
(15, 'Shahzad Enterprises Ltd.', 'SECP-2005-78432', 'Retail & Trading');

-- ------------------------------------------------------------
-- Accounts (20 — mix of Savings, Current, Fixed Deposit)
-- ------------------------------------------------------------
INSERT INTO Account (Account_Number, Account_Type, Balance, Opening_Date, Branch_ID) VALUES
('ACC-10001', 'Savings',       150000.00, '2020-03-15', 1),
('ACC-10002', 'Current',        80000.00, '2021-07-01', 2),
('ACC-10003', 'Fixed_Deposit', 500000.00, '2022-01-10', 3),
('ACC-10004', 'Savings',        45000.00, '2019-11-20', 4),
('ACC-10005', 'Current',       200000.00, '2020-06-05', 5),
('ACC-10006', 'Savings',        30000.00, '2021-02-28', 1),
('ACC-10007', 'Fixed_Deposit', 750000.00, '2020-09-14', 2),
('ACC-10008', 'Current',        60000.00, '2022-04-01', 3),
('ACC-10009', 'Savings',        25000.00, '2023-01-15', 4),
('ACC-10010', 'Savings',       110000.00, '2021-08-22', 5),
('ACC-10011', 'Current',        95000.00, '2022-03-10', 1),
('ACC-10012', 'Savings',        12000.00, '2023-06-01', 2),
('ACC-10013', 'Fixed_Deposit', 300000.00, '2021-12-05', 3),
('ACC-10014', 'Savings',        68000.00, '2020-07-19', 4),
('ACC-10015', 'Current',       180000.00, '2022-10-31', 5),
('ACC-10016', 'Savings',        55000.00, '2021-05-12', 1),
('ACC-10017', 'Fixed_Deposit', 1000000.00,'2019-03-22', 2),
('ACC-10018', 'Current',       220000.00, '2023-02-14', 3),
('ACC-10019', 'Savings',        40000.00, '2022-08-08', 4),
('ACC-10020', 'Current',       310000.00, '2020-11-30', 5);

-- Savings_Account subtypes
INSERT INTO Savings_Account (Account_ID, Min_Balance, Interest_Rate, Withdrawal_Limit) VALUES
(1,  5000.00, 6.50, 5),
(4,  2000.00, 5.75, 4),
(6,  5000.00, 6.50, 5),
(9,  2000.00, 5.00, 3),
(10, 5000.00, 6.75, 6),
(12, 2000.00, 5.25, 3),
(14, 5000.00, 6.00, 5),
(16, 5000.00, 6.50, 5),
(19, 2000.00, 5.50, 4);

-- Current_Account subtypes
INSERT INTO Current_Account (Account_ID, Overdraft_Limit, Monthly_Fee, Cheque_Book) VALUES
(2,  50000.00, 500.00, TRUE),
(5,  100000.00, 750.00, TRUE),
(8,  30000.00, 300.00, FALSE),
(11, 75000.00, 600.00, TRUE),
(15, 80000.00, 650.00, TRUE),
(18, 120000.00, 800.00, TRUE),
(20, 150000.00, 900.00, TRUE);

-- Fixed_Deposit subtypes
INSERT INTO Fixed_Deposit (Account_ID, Maturity_Date, Fixed_Rate, Penalty_Clause) VALUES
(3,  '2025-01-10', 10.50, 2000.00),
(7,  '2024-09-14', 11.00, 3000.00),
(13, '2025-12-05', 10.75, 1500.00),
(17, '2026-03-22', 11.25, 5000.00);

-- Customer_Account links
INSERT INTO Customer_Account (Customer_ID, Account_ID, Ownership_Share) VALUES
(1,  1,  100.00),
(2,  2,  100.00),
(3,  3,  100.00),
(4,  4,  100.00),
(5,  5,  100.00),
(6,  6,  100.00),
(7,  7,  100.00),
(8,  8,  100.00),
(9,  9,  100.00),
(10, 10, 100.00),
(11, 11, 100.00),
(12, 12, 100.00),
(13, 13, 100.00),
(14, 14, 100.00),
(15, 15, 100.00),
(1,  16,  50.00),  -- joint account: Ahmed & Ayesha
(6,  16,  50.00),
(3,  17, 100.00),
(11, 18, 100.00),
(15, 19, 100.00),
(15, 20, 100.00);

-- ------------------------------------------------------------
-- Employees (15)
-- ------------------------------------------------------------
INSERT INTO Employee (First_Name, Last_Name, Position, Branch_ID) VALUES
('Kamran',   'Shah',    'Manager',      1),
('Nadia',    'Hussain', 'Teller',       1),
('Waqas',    'Ahmed',   'Loan Officer', 1),
('Rabia',    'Malik',   'Manager',      2),
('Asif',     'Javed',   'Teller',       2),
('Sadia',    'Khan',    'Loan Officer', 2),
('Hamid',    'Iqbal',   'Manager',      3),
('Lubna',    'Qazi',    'Teller',       3),
('Zeeshan',  'Baig',    'Loan Officer', 3),
('Amna',     'Rizvi',   'Manager',      4),
('Shoaib',   'Ansari',  'Teller',       4),
('Fariha',   'Dar',     'Loan Officer', 4),
('Tariq',    'Usman',   'Manager',      5),
('Samina',   'Pasha',   'Teller',       5),
('Mohsin',   'Rauf',    'Loan Officer', 5);

-- Manager subtypes
INSERT INTO Manager (Employee_ID, Department, Mgr_Start_Date, Mgr_Level) VALUES
(1,  'Operations',  '2018-04-01', 'Senior'),
(4,  'Operations',  '2019-07-15', 'Senior'),
(7,  'Finance',     '2020-01-10', 'Mid'),
(10, 'Operations',  '2017-11-20', 'Senior'),
(13, 'Finance',     '2021-03-05', 'Mid');

-- Teller subtypes
INSERT INTO Teller (Employee_ID, Counter_No, Shift_Type) VALUES
(2,  1, 'Morning'),
(5,  2, 'Evening'),
(8,  1, 'Morning'),
(11, 3, 'Night'),
(14, 2, 'Morning');

-- Loan Officer subtypes
INSERT INTO Loan_Officer (Employee_ID, Loan_Limit, Specialization) VALUES
(3,  5000000.00, 'Personal Loans'),
(6,  8000000.00, 'Business Loans'),
(9,  6000000.00, 'Home Loans'),
(12, 4000000.00, 'Personal Loans'),
(15, 7000000.00, 'Business Loans');

-- ------------------------------------------------------------
-- External Customers (3)
-- ------------------------------------------------------------
INSERT INTO External_Customer (First_Name, Last_Name, Bank_Name, IBAN_Number, Account_Number) VALUES
('James',   'Brown',   'HSBC UK',         'GB29NWBK60161331926819', 'UK88899001'),
('Maria',   'Garcia',  'Santander Spain',  'ES8023100001180000012345', 'ES99001234'),
('Yusuf',   'Al-Amri', 'Emirates NBD UAE', 'AE070331234567890123456', 'UAE77001234');

-- ------------------------------------------------------------
-- Cards (20)
-- ------------------------------------------------------------
INSERT INTO Card (Card_Number, Card_Type, Expiration_Date, CVV_Code, Issue_Date, Card_Status, Account_ID, Customer_ID) VALUES
('4111111111111111', 'Debit',  '2027-12-31', '123', '2022-01-10', 'Active',   1,  1),
('5500005555555559', 'Credit', '2026-06-30', '456', '2021-06-15', 'Active',   2,  2),
('4012888888881881', 'Debit',  '2025-03-31', '789', '2020-03-15', 'Active',   3,  3),
('4111222233334444', 'Credit', '2026-09-30', '321', '2021-09-01', 'Active',   4,  4),
('5105105105105100', 'Debit',  '2024-12-31', '654', '2019-12-10', 'Expired',  5,  5),
('4222222222222',    'Debit',  '2027-08-31', '987', '2022-08-20', 'Active',   6,  6),
('5454545454545454', 'Credit', '2026-11-30', '111', '2021-11-05', 'Active',   7,  7),
('4916338506082832', 'Debit',  '2025-07-31', '222', '2020-07-01', 'Active',   8,  8),
('4532015112830366', 'Debit',  '2027-04-30', '333', '2022-04-18', 'Active',   9,  9),
('4716160788720456', 'Credit', '2026-01-31', '444', '2021-01-22', 'Active',   10, 10),
('4539578763621486', 'Debit',  '2024-05-31', '555', '2019-05-14', 'Expired',  11, 11),
('4024007136512380', 'Debit',  '2027-10-31', '666', '2022-10-03', 'Active',   12, 12),
('4716338565885697', 'Credit', '2025-02-28', '777', '2020-02-19', 'Blocked',  13, 13),
('4929462361560042', 'Debit',  '2027-06-30', '888', '2022-06-11', 'Active',   14, 14),
('5425233430109903', 'Credit', '2026-04-30', '999', '2021-04-25', 'Active',   15, 15),
('4485275742308327', 'Debit',  '2027-09-30', '112', '2022-09-07', 'Active',   16, 1),
('4916338506082899', 'Credit', '2026-07-31', '223', '2021-07-30', 'Active',   17, 3),
('4532015112830399', 'Debit',  '2025-11-30', '334', '2020-11-12', 'Active',   18, 11),
('4716160788720499', 'Credit', '2027-03-31', '445', '2022-03-01', 'Active',   19, 15),
('4539578763621499', 'Debit',  '2026-08-31', '556', '2021-08-16', 'Active',   20, 15);

-- ------------------------------------------------------------
-- Loans (10)
-- ------------------------------------------------------------
INSERT INTO Loan (Loan_Amount, Interest_Rate, Term, Application_Date, Approval_Status, Customer_ID, Branch_ID) VALUES
(500000.00,  12.50, 36, '2023-03-01', 'Approved', 1,  1),
(1200000.00, 13.00, 60, '2022-07-15', 'Approved', 3,  2),
(250000.00,  11.75, 24, '2023-08-20', 'Approved', 4,  3),
(800000.00,  12.00, 48, '2021-11-10', 'Approved', 6,  1),
(350000.00,  14.00, 36, '2023-01-05', 'Approved', 7,  2),
(2000000.00, 11.50, 84, '2022-04-18', 'Approved', 11, 3),
(150000.00,  15.00, 12, '2023-09-01', 'Approved', 12, 4),
(600000.00,  12.75, 48, '2022-06-22', 'Approved', 13, 5),
(900000.00,  13.25, 60, '2021-08-30', 'Approved', 15, 1),
(180000.00,  14.50, 24, '2023-05-17', 'Pending',  8,  4);

-- ------------------------------------------------------------
-- Loan Payments
-- ------------------------------------------------------------
INSERT INTO Loan_Payment (Loan_ID, Customer_ID, Account_ID, Payment_Date, Payment_Amount, Remaining_Balance, Payment_Status, Late_Fee) VALUES
-- Loan 1 (Ahmed Khan)
(1, 1, 1, '2023-04-01', 18500.00, 481500.00, 'Paid',    NULL),
(1, 1, 1, '2023-05-01', 18500.00, 463000.00, 'Paid',    NULL),
(1, 1, 1, '2023-06-01', 18500.00, 444500.00, 'Paid',    NULL),
(1, 1, 1, '2023-07-01', 18500.00, 426000.00, 'Paid',    NULL),
(1, 1, 1, '2023-08-01', 18500.00, 407500.00, 'Overdue', 500.00),
-- Loan 2 (Omar Sheikh)
(2, 3, 3, '2022-08-15', 28000.00, 1172000.00, 'Paid',   NULL),
(2, 3, 3, '2022-09-15', 28000.00, 1144000.00, 'Paid',   NULL),
(2, 3, 3, '2022-10-15', 28000.00, 1116000.00, 'Paid',   NULL),
(2, 3, 3, '2022-11-15', 28000.00, 1088000.00, 'Overdue',750.00),
-- Loan 3 (Fatima Siddiqui)
(3, 4, 4, '2023-09-20', 12500.00, 237500.00, 'Paid',    NULL),
(3, 4, 4, '2023-10-20', 12500.00, 225000.00, 'Paid',    NULL),
(3, 4, 4, '2023-11-20', 12500.00, 212500.00, 'Pending', NULL),
-- Loan 4 (Ayesha Mahmood)
(4, 6, 6, '2022-12-10', 22000.00, 778000.00, 'Paid',    NULL),
(4, 6, 6, '2023-01-10', 22000.00, 756000.00, 'Paid',    NULL),
(4, 6, 6, '2023-02-10', 22000.00, 734000.00, 'Paid',    NULL),
-- Loan 6 (Imran Yousuf)
(6, 11, 11, '2022-05-18', 42000.00, 1958000.00, 'Paid', NULL),
(6, 11, 11, '2022-06-18', 42000.00, 1916000.00, 'Paid', NULL),
(6, 11, 11, '2022-07-18', 42000.00, 1874000.00, 'Paid', NULL),
(6, 11, 11, '2022-08-18', 42000.00, 1832000.00, 'Overdue', 1000.00),
-- Loan 7 (Sana Butt)
(7, 12, 12, '2023-10-01', 14000.00, 136000.00, 'Paid',  NULL),
(7, 12, 12, '2023-11-01', 14000.00, 122000.00, 'Paid',  NULL),
(7, 12, 12, '2023-12-01', 14000.00, 108000.00, 'Pending', NULL);

-- ------------------------------------------------------------
-- Transactions (35)
-- ------------------------------------------------------------
INSERT INTO Transaction (Transaction_Date, Transaction_Type, Amount, Description, Sender_Account_ID, Receiver_Account_ID, ECustomer_ID, Card_ID, Employee_ID) VALUES
-- Deposits
('2023-01-05 09:15:00', 'Deposit',    50000.00, 'Salary credit',              NULL, 1,    NULL, NULL, 2),
('2023-01-10 10:30:00', 'Deposit',    80000.00, 'Business income',            NULL, 2,    NULL, NULL, 5),
('2023-02-01 11:00:00', 'Deposit',   150000.00, 'FD top-up',                  NULL, 3,    NULL, NULL, 8),
('2023-02-15 14:20:00', 'Deposit',    25000.00, 'Family remittance',          NULL, 4,    NULL, NULL, 11),
('2023-03-01 09:45:00', 'Deposit',    60000.00, 'Monthly salary',             NULL, 5,    NULL, NULL, 14),
('2023-03-10 10:00:00', 'Deposit',    30000.00, 'Freelance income',           NULL, 6,    NULL, NULL, 2),
('2023-04-05 11:30:00', 'Deposit',   200000.00, 'Business revenue',           NULL, 7,    NULL, NULL, 5),
('2023-04-20 15:00:00', 'Deposit',    45000.00, 'Salary',                     NULL, 8,    NULL, NULL, 8),
('2023-05-01 09:00:00', 'Deposit',    20000.00, 'Part time income',           NULL, 9,    NULL, NULL, 11),
('2023-05-15 13:45:00', 'Deposit',    70000.00, 'Rental income',              NULL, 10,   NULL, NULL, 14),
-- Withdrawals
('2023-01-15 10:00:00', 'Withdrawal', 10000.00, 'ATM cash withdrawal',        1,    NULL, NULL, 1,   NULL),
('2023-02-03 11:15:00', 'Withdrawal', 15000.00, 'ATM cash withdrawal',        2,    NULL, NULL, 2,   5),
('2023-02-20 14:00:00', 'Withdrawal', 20000.00, 'Counter withdrawal',         3,    NULL, NULL, NULL, 8),
('2023-03-05 09:30:00', 'Withdrawal',  8000.00, 'ATM cash withdrawal',        4,    NULL, NULL, 4,   NULL),
('2023-03-22 12:00:00', 'Withdrawal', 25000.00, 'Counter withdrawal',         5,    NULL, NULL, NULL, 14),
('2023-04-10 10:45:00', 'Withdrawal', 12000.00, 'ATM withdrawal',             6,    NULL, NULL, 6,   NULL),
('2023-05-05 11:00:00', 'Withdrawal',  5000.00, 'ATM withdrawal',             9,    NULL, NULL, 9,   NULL),
('2023-05-20 14:30:00', 'Withdrawal', 30000.00, 'Counter withdrawal',         10,   NULL, NULL, NULL, 2),
-- Internal Transfers
('2023-01-20 09:00:00', 'Transfer',   25000.00, 'Rent payment',               1,    2,    NULL, NULL, 2),
('2023-02-10 10:30:00', 'Transfer',   40000.00, 'Business transfer',          5,    6,    NULL, NULL, 5),
('2023-03-15 11:45:00', 'Transfer',   15000.00, 'Family support',             10,   4,    NULL, NULL, 8),
('2023-04-01 13:00:00', 'Transfer',   55000.00, 'Investment transfer',        7,    11,   NULL, NULL, 11),
('2023-04-25 14:15:00', 'Transfer',   20000.00, 'Savings transfer',           2,    9,    NULL, NULL, 14),
('2023-05-10 09:30:00', 'Transfer',   35000.00, 'Business transfer',          11,   15,   NULL, NULL, 2),
-- External / Inter-bank Transfers
('2023-02-25 10:00:00', 'Transfer',   75000.00, 'Wire transfer to UK',        1,    NULL, 1,    NULL, 2),
('2023-03-28 11:30:00', 'Transfer',  120000.00, 'Wire transfer to Spain',     5,    NULL, 2,    NULL, 5),
('2023-04-15 14:00:00', 'Transfer',   90000.00, 'Wire transfer to UAE',       11,   NULL, 3,    NULL, 8),
-- Card Transactions
('2023-01-25 16:00:00', 'Withdrawal', 18000.00, 'POS purchase - electronics', 1,    NULL, NULL, 1,   NULL),
('2023-02-14 19:30:00', 'Withdrawal',  7500.00, 'POS purchase - dining',      2,    NULL, NULL, 2,   NULL),
('2023-03-20 15:00:00', 'Withdrawal', 22000.00, 'Online shopping',            5,    NULL, NULL, 5,   NULL),
('2023-04-08 11:00:00', 'Withdrawal',  9500.00, 'POS purchase - groceries',   6,    NULL, NULL, 6,   NULL),
('2023-05-02 14:00:00', 'Withdrawal', 45000.00, 'Electronics purchase',       10,   NULL, NULL, 10,  NULL),
('2023-05-18 17:30:00', 'Withdrawal', 13000.00, 'Restaurant & travel',        14,   NULL, NULL, 14,  NULL),
('2023-06-01 10:00:00', 'Deposit',    95000.00, 'Corporate salary',           NULL, 15,   NULL, NULL, 2),
('2023-06-15 11:00:00', 'Transfer',  200000.00, 'Corporate wire to UAE',      15,   NULL, 3,    NULL, 5);

-- Deposit subtypes
INSERT INTO Deposit (Transaction_ID, Deposit_Method, Source_Account) VALUES
(1,  'Bank Transfer', 'EXT-PAYROLL-001'),
(2,  'Cash',          NULL),
(3,  'Bank Transfer', 'EXT-SAVINGS-002'),
(4,  'Bank Transfer', 'EXT-FAMILY-003'),
(5,  'Cash',          NULL),
(6,  'Cash',          NULL),
(7,  'Bank Transfer', 'EXT-BIZ-004'),
(8,  'Cash',          NULL),
(9,  'Cash',          NULL),
(10, 'Bank Transfer', 'EXT-RENT-005'),
(34, 'Bank Transfer', 'EXT-CORP-006');

-- Withdrawal subtypes
INSERT INTO Withdrawal (Transaction_ID, Withdrawal_Method, ATM_ID) VALUES
(11, 'ATM',     'ATM-KHI-007'),
(12, 'ATM',     'ATM-LHR-003'),
(13, 'Counter', NULL),
(14, 'ATM',     'ATM-PEW-002'),
(15, 'Counter', NULL),
(16, 'ATM',     'ATM-KHI-012'),
(17, 'ATM',     'ATM-PEW-005'),
(18, 'Counter', NULL),
(28, 'POS',     NULL),
(29, 'POS',     NULL),
(30, 'POS',     NULL),
(31, 'POS',     NULL),
(32, 'POS',     NULL),
(33, 'POS',     NULL);

-- Transfer subtypes
INSERT INTO Transfer (Transaction_ID, Transfer_Fee, Destination_Bank) VALUES
(19, 0.00,    'Internal'),
(20, 0.00,    'Internal'),
(21, 0.00,    'Internal'),
(22, 0.00,    'Internal'),
(23, 0.00,    'Internal'),
(24, 0.00,    'Internal'),
(25, 500.00,  'HSBC UK'),
(26, 750.00,  'Santander Spain'),
(27, 600.00,  'Emirates NBD UAE'),
(35, 1200.00, 'Emirates NBD UAE');


-- Update customer phone number
UPDATE Customer
SET    Phone = '0300-9999999'
WHERE  Customer_ID = 1;

-- Block a card
UPDATE Card
SET    Card_Status = 'Blocked'
WHERE  Card_Number = '5500005555555559';

-- Mark loan payment as overdue with late fee
UPDATE Loan_Payment
SET    Payment_Status = 'Overdue',
       Late_Fee = 500.00
WHERE  Payment_ID = 3;


-- Remove an expired card
DELETE FROM Card
WHERE  Card_Status = 'Expired';

-- Remove a rejected loan application
DELETE FROM Loan
WHERE  Approval_Status = 'Rejected';
