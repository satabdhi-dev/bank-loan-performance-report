# 🏦 Bank Loan Report & Dashboard

A complete SQL-powered analytics and Power BI dashboard project that explores loan issuance trends, performance metrics, and portfolio quality based on a fictional financial institution's loan data.

---

## 📁 Project Structure

```
📂 Bank-Loan-Report/
│
├── 📄 BANK LOAN SUMMARY.sql         # SQL queries for KPIs and loan health summary
├── 📄 BANK LOAN REPORT.sql          # SQL queries for detailed loan analysis by category
├── 📊 summary.pbix                  # Power BI summary dashboard file
├── 📊 Details.pbix                  # Power BI detailed report file
├── 📊 Review.pbix                   # Power BI review/insights dashboard
└── 📄 README.md                     # This documentation
```

---

## 📌 Overview

This project focuses on analyzing the performance of a bank's loan portfolio using **SQL** and **Power BI**.

Key objectives:
- Understand trends in loan issuance by month, state, term, and other attributes.
- Measure the health of the loan portfolio using KPIs such as:
  - Total Loan Applications
  - Funded Amounts
  - Amounts Received
  - Interest Rates and DTI (Debt-to-Income) Ratios
- Segment loans into **Good** (Fully Paid, Current) and **Bad** (Charged Off) for quality assessment.
- Build dynamic, interactive dashboards to communicate insights clearly to stakeholders.

---

## 🧠 Features

- 📅 **Month-wise Trends**: Loan issuance, funding, and payments by month
- 🗺️ **State Analysis**: Distribution and performance of loans across states
- 🧾 **Loan Terms**: Breakdown by 36 vs 60 months
- 🏠 **Home Ownership Analysis**: Impact of ownership status on loans
- 👔 **Employment Length Analysis**: Loan metrics by borrower experience
- 🎯 **Purpose-Based Analysis**: Loan performance based on stated loan purpose
- 📈 **KPI Summary Dashboard** (Power BI): Track key performance indicators with month-to-month comparisons

---

## ⚙️ Technologies Used

| Tool         | Purpose                        |
|--------------|--------------------------------|
| SQL Server   | Data querying and aggregation  |
| Power BI     | Visualization and dashboarding |
| DAX / M Query| Power BI calculations          |

---

## 📊 Dashboard Previews

**Summary.pbix**
- High-level KPIs with dynamic monthly comparisons

**Details.pbix**
- In-depth breakdown by state, purpose, and loan status

**Review.pbix**
- Loan quality comparison and trend analysis

> 📌 _To view the dashboards, open the `.pbix` files in [Power BI Desktop](https://powerbi.microsoft.com/desktop/)._  

---

## 📄 Key SQL Queries (Highlights)

### Total Applications and Funding
```sql
SELECT COUNT(id) AS Total_Applications FROM financial_loan;
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan;
```

### Good vs Bad Loan Percentage
```sql
-- Good Loans
SELECT (COUNT(CASE WHEN loan_status IN ('Fully Paid', 'Current') THEN id END) * 100.0) / COUNT(id) AS Good_Loan_Percentage FROM financial_loan;

-- Bad Loans
SELECT (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / COUNT(id) AS Bad_Loan_Percentage FROM financial_loan;
```

### Loan Distribution by State
```sql
SELECT address_state, COUNT(id), SUM(loan_amount), SUM(total_payment)
FROM financial_loan
GROUP BY address_state;
```

---

## 🚀 Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/bank-loan-report.git
   cd bank-loan-report
   ```

2. Open `.sql` files in SQL Server / Azure Data Studio and run against your database.

3. Open `.pbix` files in Power BI Desktop to explore dashboards.

---

## ✅ Future Enhancements

- Integration with live SQL Server database
- Monthly auto-refresh in Power BI Service
- Drill-through details for individual loan records
- Advanced ML-based risk prediction layer

---

## 📬 Contact

For any queries or collaborations:

**Satabdhi Priyadarsani**  
[LinkedIn](https://www.linkedin.com/in/satabdhi-priyadarsani-98093226b/) • [Email](satabdhi73@gmail.com) • [GitHub](https://github.com/satabdhi-dev)

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

