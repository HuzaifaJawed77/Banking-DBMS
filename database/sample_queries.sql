-- Q1: All customers with their accounts and branch
SELECT c.Customer_ID,
       CONCAT(c.First_Name,' ',c.Last_Name) AS Customer_Name,
       a.Account_Number, a.Account_Type, a.Balance,
       b.Branch_Name
FROM   Customer c
JOIN   Customer_Account ca ON c.Customer_ID = ca.Customer_ID
JOIN   Account a           ON ca.Account_ID  = a.Account_ID
JOIN   Branch b            ON a.Branch_ID    = b.Branch_ID
ORDER  BY c.Customer_ID;

-- Q2: Total & average balance per branch
SELECT b.Branch_Name,
       COUNT(a.Account_ID)  AS Total_Accounts,
       SUM(a.Balance)       AS Total_Balance,
       AVG(a.Balance)       AS Avg_Balance,
       MAX(a.Balance)       AS Max_Balance
FROM   Branch b
LEFT JOIN Account a ON b.Branch_ID = a.Branch_ID
GROUP  BY b.Branch_ID, b.Branch_Name
ORDER  BY Total_Balance DESC;

-- Q3: Monthly transaction volume
SELECT YEAR(Transaction_Date)  AS Year,
       MONTH(Transaction_Date) AS Month,
       Transaction_Type,
       COUNT(*)               AS Txn_Count,
       SUM(Amount)            AS Total_Amount
FROM   Transaction
GROUP  BY Year, Month, Transaction_Type
ORDER  BY Year DESC, Month DESC;

-- Q4: Active loans with customer and branch
SELECT l.Loan_ID, l.Loan_Amount, l.Interest_Rate, l.Remaining_Balance,
       CONCAT(c.First_Name,' ',c.Last_Name) AS Customer_Name,
       b.Branch_Name
FROM   Loan l
JOIN   Customer c ON l.Customer_ID = c.Customer_ID
JOIN   Branch b   ON l.Branch_ID   = b.Branch_ID
WHERE  l.Approval_Status = 'Approved'
ORDER  BY l.Remaining_Balance DESC;

-- Q5: Customers with above-average total balance
SELECT c.Customer_ID,
       CONCAT(c.First_Name,' ',c.Last_Name) AS Customer_Name,
       SUM(a.Balance) AS Total_Balance
FROM   Customer c
JOIN   Customer_Account ca ON c.Customer_ID = ca.Customer_ID
JOIN   Account a           ON ca.Account_ID  = a.Account_ID
GROUP  BY c.Customer_ID, c.First_Name, c.Last_Name
HAVING SUM(a.Balance) > (SELECT AVG(Balance) FROM Account)
ORDER  BY Total_Balance DESC;

-- Q6: Employees with role specialization
SELECT e.Employee_ID,
       CONCAT(e.First_Name,' ',e.Last_Name) AS Employee_Name,
       e.Position, b.Branch_Name,
       m.Department,
       tl.Counter_No,
       lo.Specialization
FROM   Employee e
JOIN   Branch b             ON e.Branch_ID   = b.Branch_ID
LEFT JOIN Manager m         ON e.Employee_ID = m.Employee_ID
LEFT JOIN Teller tl         ON e.Employee_ID = tl.Employee_ID
LEFT JOIN Loan_Officer lo   ON e.Employee_ID = lo.Employee_ID;

-- Q7: Overdue loan payments with days past due
SELECT lp.Payment_ID,
       CONCAT(c.First_Name,' ',c.Last_Name) AS Customer_Name,
       c.Phone, lp.Payment_Amount,
       lp.Remaining_Balance, lp.Late_Fee,
       DATEDIFF(CURDATE(), lp.Payment_Date) AS Days_Overdue
FROM   Loan_Payment lp
JOIN   Customer c ON lp.Customer_ID = c.Customer_ID
WHERE  lp.Payment_Status = 'Overdue'
ORDER  BY Days_Overdue DESC;

-- Q8: Total deposits and withdrawals per account (CASE WHEN)
SELECT a.Account_Number, a.Account_Type,
       SUM(CASE WHEN t.Transaction_Type='Deposit'
               THEN t.Amount ELSE 0 END) AS Total_Deposits,
       SUM(CASE WHEN t.Transaction_Type='Withdrawal'
               THEN t.Amount ELSE 0 END) AS Total_Withdrawals,
       COUNT(t.Transaction_ID)            AS Total_Transactions
FROM   Account a
LEFT JOIN Transaction t
       ON a.Account_ID = t.Sender_Account_ID
       OR a.Account_ID = t.Receiver_Account_ID
GROUP  BY a.Account_ID, a.Account_Number, a.Account_Type
ORDER  BY Total_Transactions DESC;

-- Q9: Inter-bank wire transfers
SELECT t.Transaction_ID, t.Transaction_Date, t.Amount,
       tr.Transfer_Fee, tr.Destination_Bank,
       CONCAT(ec.First_Name,' ',ec.Last_Name) AS Receiver,
       ec.IBAN_Number,
       a.Account_Number AS Sender_Account
FROM   Transaction t
JOIN   Transfer tr          ON t.Transaction_ID = tr.Transaction_ID
JOIN   External_Customer ec ON t.ECustomer_ID   = ec.ECustomer_ID
JOIN   Account a            ON t.Sender_Account_ID = a.Account_ID
ORDER  BY t.Transaction_Date DESC;

-- Q10: Branches with more than 3 accounts (HAVING)
SELECT b.Branch_Name,
       COUNT(a.Account_ID) AS Account_Count,
       SUM(a.Balance)       AS Total_Balance
FROM   Branch b
JOIN   Account a ON b.Branch_ID = a.Branch_ID
GROUP  BY b.Branch_ID, b.Branch_Name
HAVING COUNT(a.Account_ID) > 3
ORDER  BY Account_Count DESC;

-- Q11: Customers who have never taken a loan
SELECT c.Customer_ID,
       CONCAT(c.First_Name,' ',c.Last_Name) AS Customer_Name,
       c.Email
FROM   Customer c
WHERE  c.Customer_ID NOT IN (SELECT DISTINCT Customer_ID FROM Loan)
ORDER  BY c.Last_Name;

-- Q12: Savings accounts below minimum balance
SELECT a.Account_Number,
       CONCAT(c.First_Name,' ',c.Last_Name) AS Owner,
       a.Balance, sa.Min_Balance,
       sa.Min_Balance - a.Balance AS Deficit,
       b.Branch_Name
FROM   Account a
JOIN   Savings_Account sa  ON a.Account_ID  = sa.Account_ID
JOIN   Customer_Account ca ON a.Account_ID  = ca.Account_ID
JOIN   Customer c          ON ca.Customer_ID = c.Customer_ID
JOIN   Branch b            ON a.Branch_ID   = b.Branch_ID
WHERE  a.Balance < sa.Min_Balance
ORDER  BY Deficit DESC;

-- Q13: Top 3 customers by transaction count
SELECT c.Customer_ID,
       CONCAT(c.First_Name,' ',c.Last_Name) AS Customer_Name,
       COUNT(t.Transaction_ID)              AS Transaction_Count,
       SUM(t.Amount)                        AS Total_Amount
FROM   Customer c
JOIN   Customer_Account ca ON c.Customer_ID     = ca.Customer_ID
JOIN   Account a           ON ca.Account_ID      = a.Account_ID
JOIN   Transaction t       ON t.Sender_Account_ID = a.Account_ID
GROUP  BY c.Customer_ID, c.First_Name, c.Last_Name
ORDER  BY Transaction_Count DESC
LIMIT  3;

-- Q14: Branch performance summary
SELECT b.Branch_Name,
       COALESCE(acc.Account_Count, 0) AS Accounts,
       COALESCE(acc.Total_Balance, 0) AS Total_Balance,
       COALESCE(lns.Loan_Count,    0) AS Loans,
       COALESCE(emp.Staff_Count,   0) AS Staff
FROM   Branch b
LEFT JOIN (SELECT Branch_ID, COUNT(*) AS Account_Count,
                  SUM(Balance) AS Total_Balance
           FROM Account GROUP BY Branch_ID) acc ON b.Branch_ID = acc.Branch_ID
LEFT JOIN (SELECT Branch_ID, COUNT(*) AS Loan_Count
           FROM Loan GROUP BY Branch_ID)    lns ON b.Branch_ID = lns.Branch_ID
LEFT JOIN (SELECT Branch_ID, COUNT(*) AS Staff_Count
           FROM Employee GROUP BY Branch_ID) emp ON b.Branch_ID = emp.Branch_ID
ORDER  BY Total_Balance DESC;

-- Q15: Loan repayment summary
SELECT l.Loan_ID, l.Loan_Amount,
       CONCAT(c.First_Name,' ',c.Last_Name) AS Customer_Name,
       SUM(lp.Payment_Amount)                 AS Total_Paid,
       l.Loan_Amount - SUM(lp.Payment_Amount) AS Outstanding,
       COUNT(lp.Payment_ID)                   AS Payments_Made
FROM   Loan l
JOIN   Customer c      ON l.Customer_ID = c.Customer_ID
JOIN   Loan_Payment lp ON l.Loan_ID     = lp.Loan_ID
GROUP  BY l.Loan_ID, l.Loan_Amount, c.First_Name, c.Last_Name
ORDER  BY Outstanding DESC;


-- ============================================================
--  SECTION 4: UPDATE & DELETE EXAMPLES
-- ============================================================

-- Update customer phone
UPDATE Customer
SET    Phone = '0300-9999999'
WHERE  Customer_ID = 1;

-- Block a card
UPDATE Card
SET    Card_Status = 'Blocked'
WHERE  Card_Number = '5500005555555559';

-- Mark expired cards
UPDATE Card
SET    Card_Status = 'Expired'
WHERE  Expiration_Date < CURDATE()
  AND  Card_Status = 'Active';

-- Mark overdue loan payment
UPDATE Loan_Payment
SET    Payment_Status = 'Overdue',
       Late_Fee       = 500.00
WHERE  Payment_ID = 3;

-- Delete rejected loans
DELETE FROM Loan
WHERE  Approval_Status = 'Rejected';

-- Delete expired cards
DELETE FROM Card
WHERE  Card_Status = 'Expired';



-- ============================================================
--  END OF SCRIPT
-- ============================================================



