-- =============================================================================
-- BANK LOAN ANALYSIS DASHBOARD - SQL QUERIES
-- =============================================================================

-- -----------------------------------------------------------------------------
-- DATABASE SETUP
-- -----------------------------------------------------------------------------

CREATE SCHEMA `bank_loan_analysis_db`;
USE bank_loan_analysis_db;

CREATE TABLE `financial_loan_v1` (
    `id` INT PRIMARY KEY,
    `address_state` CHAR(2) NOT NULL,
    `application_type` VARCHAR(20) NOT NULL,
    `emp_length` VARCHAR(15),
    `emp_title` VARCHAR(100),
    `grade` CHAR(1) NOT NULL,
    `home_ownership` VARCHAR(15) NOT NULL,
    `issue_date` DATE NOT NULL,
    `last_credit_pull_date` DATE,
    `last_payment_date` DATE,
    `loan_status` VARCHAR(25) NOT NULL,
    `next_payment_date` DATE,
    `member_id` INT NOT NULL,
    `purpose` VARCHAR(30) NOT NULL,
    `sub_grade` VARCHAR(3) NOT NULL,
    `term` VARCHAR(15) NOT NULL,
    `verification_status` VARCHAR(20) NOT NULL,
    `annual_income` DECIMAL(10,2) NOT NULL,
    `dti` DECIMAL(6,4) NOT NULL,
    `installment` DECIMAL(8,2) NOT NULL,
    `int_rate` DECIMAL(6,4) NOT NULL,
    `loan_amount` DECIMAL(10,2) NOT NULL,
    `total_acc` SMALLINT NOT NULL,
    `total_payment` DECIMAL(10,2) NOT NULL,
    
    INDEX idx_loan_status (`loan_status`),
    INDEX idx_grade (`grade`),
    INDEX idx_state (`address_state`),
    INDEX idx_issue_date (`issue_date`),
    INDEX idx_purpose (`purpose`)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/financial_loan.csv'
INTO TABLE `financial_loan_v1`
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- =============================================================================
-- DASHBOARD 1 PAR !: KEY PERFORMANCE INDICATORS (KPIs)
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. TOTAL LOAN APPLICATIONS
-- -----------------------------------------------------------------------------

-- Total Applications (All Time)
SELECT COUNT(id) AS Total_Loan_Applications 
FROM bank_loan_analysis_db.financial_loan_v1;

-- MTD Applications (December 2021)
SELECT COUNT(id) AS MTD_Total_Loan_Applications 
FROM bank_loan_analysis_db.financial_loan_v1
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Applications (November 2021)
SELECT COUNT(id) AS PMTD_Total_Loan_Applications 
FROM bank_loan_analysis_db.financial_loan_v1
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- -----------------------------------------------------------------------------
-- 2. TOTAL FUNDED AMOUNT
-- -----------------------------------------------------------------------------

-- Total Funded Amount (All Time)
SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM financial_loan_v1;

-- MTD Funded Amount
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM financial_loan_v1
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Funded Amount
SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount 
FROM financial_loan_v1
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- -----------------------------------------------------------------------------
-- 3. TOTAL AMOUNT RECEIVED
-- -----------------------------------------------------------------------------

-- MTD Amount Received
SELECT SUM(total_payment) AS MTD_Total_Amount_Received 
FROM financial_loan_v1
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- -----------------------------------------------------------------------------
-- 4. AVERAGE INTEREST RATE
-- -----------------------------------------------------------------------------

-- Average Interest Rate (All Time)
SELECT ROUND(AVG(int_rate)*100, 4) AS Avg_Interest_Rate 
FROM financial_loan_v1;

-- MTD Average Interest Rate
SELECT ROUND(AVG(int_rate)*100, 4) AS MTD_Avg_Interest_Rate 
FROM financial_loan_v1 
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Average Interest Rate
SELECT ROUND(AVG(int_rate)*100, 4) AS PMTD_Avg_Interest_Rate 
FROM financial_loan_v1 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- -----------------------------------------------------------------------------
-- 5. AVERAGE DEBT-TO-INCOME RATIO (DTI)
-- -----------------------------------------------------------------------------

-- MTD Average DTI
SELECT ROUND(AVG(dti)*100, 4) AS MTD_Avg_DTI 
FROM financial_loan_v1
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Average DTI
SELECT ROUND(AVG(dti)*100, 4) AS PMTD_Avg_DTI 
FROM financial_loan_v1
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- =============================================================================
-- DASHBOARD 1 PART 2: OVERVIEW SUMMARY
-- =============================================================================

-- -----------------------------------------------------------------------------
-- GOOD LOAN ANALYSIS
-- -----------------------------------------------------------------------------

-- Good Loan Percentage
SELECT
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
    /
	COUNT(id) AS Good_Loan_Percentage
FROM financial_loan_v1;

-- Good Loan Applications Count
SELECT COUNT(id) AS Good_Loan_Applications 
FROM financial_loan_v1
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount 
FROM financial_loan_v1
WHERE loan_status IN ('Fully Paid', 'Current');

-- Good Loan Total Received Amount
SELECT SUM(total_payment) AS Good_Loan_Total_Received_Amount 
FROM financial_loan_v1
WHERE loan_status IN ('Fully Paid', 'Current');

-- -----------------------------------------------------------------------------
-- BAD LOAN ANALYSIS
-- -----------------------------------------------------------------------------

-- Bad Loan Percentage
SELECT
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100)
    /
	COUNT(id) AS Bad_Loan_Percentage
FROM financial_loan_v1;

-- Bad Loan Applications Count
SELECT COUNT(id) AS Bad_Loan_Applications 
FROM financial_loan_v1
WHERE loan_status = 'Charged Off';

-- Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount 
FROM financial_loan_v1
WHERE loan_status = 'Charged Off';

-- Bad Loan Total Received Amount
SELECT SUM(total_payment) AS Bad_Loan_Total_Received_Amount 
FROM financial_loan_v1
WHERE loan_status = 'Charged Off';

-- -----------------------------------------------------------------------------
-- LOAN STATUS GRID VIEW
-- -----------------------------------------------------------------------------

-- All Time Loan Status Summary
SELECT
	loan_status,
    COUNT(id) AS Total_Loan_Applications,
    SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount,
	AVG(int_rate * 100) AS Interest_Rate,
    AVG(dti * 100) AS DTI
FROM financial_loan_v1
GROUP BY loan_status;

-- MTD Loan Status Summary
SELECT
	loan_status,
    SUM(total_payment) AS MTD_Total_Amount_Received,
	SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM financial_loan_v1
WHERE MONTH(issue_date) = 12
GROUP BY loan_status;





-- =============================================================================
-- DASHBOARD 2: OVERVIEW ANALYTICS
-- =============================================================================

-- -----------------------------------------------------------------------------
-- MONTHLY TREND ANALYSIS
-- -----------------------------------------------------------------------------

-- Monthly Record of Loan Applications
SELECT
	MONTH(issue_date) AS Month_No,
	MONTHNAME(issue_date) AS Month_Name,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan_v1
GROUP BY MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY MONTH(issue_date) ASC;

-- -----------------------------------------------------------------------------
-- GEOGRAPHIC ANALYSIS
-- -----------------------------------------------------------------------------

-- Loan Performance by State
SELECT
	address_state,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan_v1
GROUP BY address_state
ORDER BY Total_Loan_Application DESC;

-- -----------------------------------------------------------------------------
-- LOAN TERM ANALYSIS
-- -----------------------------------------------------------------------------

-- Performance by Loan Term
SELECT
	term,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan_v1
GROUP BY term
ORDER BY term;

-- -----------------------------------------------------------------------------
-- EMPLOYMENT ANALYSIS
-- -----------------------------------------------------------------------------

-- Customer Employment Length Analysis
SELECT
	emp_length,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan_v1
GROUP BY emp_length
ORDER BY Total_Loan_Application DESC;

-- -----------------------------------------------------------------------------
-- PURPOSE ANALYSIS
-- -----------------------------------------------------------------------------

-- Loan Performance by Purpose
SELECT
	purpose,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan_v1
GROUP BY purpose
ORDER BY Total_Funded_Amount DESC;

-- -----------------------------------------------------------------------------
-- HOME OWNERSHIP ANALYSIS
-- -----------------------------------------------------------------------------

-- Loan Applicant Home Ownership Status
SELECT
	home_ownership,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan_v1
GROUP BY home_ownership
ORDER BY Total_Loan_Application DESC;





/*
╔══════════════════════════════════════════════════════════════════════════════╗
║                    POWER BI - MYSQL CONNECTION SOLUTION                     ║
║                        Technical Implementation Notes                       ║
╚══════════════════════════════════════════════════════════════════════════════╝

🚨 PROBLEM:
   Power BI native MySQL connector failed with "Internal connection fatal error"
   Root Cause: Compatibility issue between Power BI and MySQL 9.3

🎯 SOLUTION: ODBC Implementation
   Deployed Open Database Connectivity as universal database interface

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔧 TECHNICAL IMPLEMENTATION:

Issue 1: User Permissions
├─ Problem: MySQL default restricts root@localhost only
├─ Solution: GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
└─ Result: Enabled external application access

Issue 2: Server Resolution
├─ Problem: Computer name "DESKTOP-BTCBFM0" connection failed
├─ Solution: Used "localhost" for reliable local connection
└─ Result: Successful ODBC test connection

Issue 3: Driver Compatibility
├─ MySQL Server: 9.3 | ODBC Driver: 8.0/8.4
├─ Resolution: Backward compatibility maintained
└─ Result: Stable connection established

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💡 WHY ODBC SUCCEEDED:

┌─ Stability ───────────────────────────────────────────────────┐
│ Universal interface eliminates version-specific conflicts    │
└───────────────────────────────────────────────────────────────┘

┌─ Enterprise Standard ─────────────────────────────────────────┐
│ Production-grade connection method used across industries    │
└───────────────────────────────────────────────────────────────┘

┌─ Error Handling ──────────────────────────────────────────────┐
│ Superior connection management and diagnostic capabilities   │
└───────────────────────────────────────────────────────────────┘

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎓 TECHNICAL SKILLS DEVELOPED:

Database Administration:
├─ MySQL user permission management
├─ Network connection troubleshooting
└─ ODBC driver configuration

Integration Architecture:
├─ Enterprise database connectivity patterns
├─ Cross-platform compatibility resolution
└─ Production-ready connection implementation

Professional Development:
├─ Systematic problem-solving methodology
├─ Technical documentation practices
└─ Enterprise-grade solution deployment

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🚀 FINAL CONFIGURATION:

Data Source: BankLoanDB
Server: localhost:3306
Database: bank_loan_analysis_db
Authentication: Database (root)
Status: ✅ Production Ready

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📈 BUSINESS VALUE:
   Established reliable, scalable database connectivity enabling real-time
   analytics and automated reporting capabilities for loan portfolio management.

╚══════════════════════════════════════════════════════════════════════════════╝
*/















































