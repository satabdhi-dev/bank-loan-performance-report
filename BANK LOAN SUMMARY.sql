---A.BANK LOAN REPORT | SUMMARY 

--KPIs
select * from financial_loan

--Total Loan Applications
SELECT COUNT(id) AS Total_Applications FROM financial_loan

--MTD Loan Applications
SELECT COUNT(id) AS MTD_Loan_Applications FROM financial_loan
WHERE MONTH(issue_date) = 12

--PMTD Loan Applications
SELECT COUNT(id) AS PMTD_Loan_Applications FROM financial_loan
WHERE MONTH(issue_date) = 11

--Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan

--MTD Total Funded Amount
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date) = 12

--PMTD Total Funded Amount
SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date) = 11

--Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Received FROM financial_loan

--MTD Total Amount Received
SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM financial_loan
WHERE MONTH(issue_date) = 12

--PMTD Total Amount Received
SELECT SUM(total_payment) AS PMTD_Total_Amount_Collected FROM financial_loan
WHERE MONTH(issue_date) = 11

--Average Interest Rate
SELECT round(AVG(int_rate),4)*100 AS Avg_Interest_Rate FROM financial_loan

--MTD Average Intrest Rate
SELECT round(AVG(int_rate),4)*100 AS MTD_Avg_Interest_Rate FROM financial_loan
where MONTH(issue_date) =12

--PMTD Average Intrest Rate
SELECT round(AVG(int_rate),4)*100 AS PMTD_Avg_Interest_Rate FROM financial_loan
where MONTH(issue_date) =11

--Avg DTI
SELECT AVG(dti)*100 AS Avg_DTI FROM financial_loan

--MTD Avg DTI
SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM financial_loan
WHERE MONTH(issue_date) = 12

--PMTD Avg DTI
SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM financial_loan
WHERE MONTH(issue_date) = 11

--B.GOOD LOAN ISSUED
--Good Loan Percentage
select loan_status from financial_loan
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM financial_loan


--Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--BAD LOAN ISSUED
--Bad Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM financial_loan

--Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM financial_loan
WHERE loan_status = 'Charged Off'

--Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM financial_loan
WHERE loan_status = 'Charged Off'

--Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM financial_loan
WHERE loan_status = 'Charged Off'

--LOAN STATUS
SELECT
        loan_status,
        COUNT(id) AS Total_Loan_Applications,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        financial_loan
    GROUP BY
        loan_status

--MTD_Total_Amount_Received
SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM financial_loan
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

