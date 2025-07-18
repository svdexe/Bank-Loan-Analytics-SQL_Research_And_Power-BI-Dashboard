# 🏦 Bank Loan Analytics Dashboard

<div align="center">

![Summary Dashboard](https://github.com/svdexe/BankLoanAnalytics_SQL_Research_And_PowerBI_Dashboard/blob/main/Dash%20P1.png)
*Executive Summary - KPIs, Good vs Bad Loan Analysis & Performance Metrics*

<br>

![Summary Dashboard](https://github.com/svdexe/BankLoanAnalytics_SQL_Research_And_PowerBI_Dashboard/blob/main/Dash%20P2.png)
*Executive Summary - KPIs, Good vs Bad Loan Analysis & Performance Metrics*

<br>


![Summary Dashboard](https://github.com/svdexe/BankLoanAnalytics_SQL_Research_And_PowerBI_Dashboard/blob/main/Dash%20P3.png)
*Executive Summary - KPIs, Good vs Bad Loan Analysis & Performance Metrics*
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/power_bi-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![SQL](https://img.shields.io/badge/SQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![ODBC](https://img.shields.io/badge/ODBC-FF6C37?style=for-the-badge&logo=microsoft&logoColor=white)

**📊 Enterprise-grade loan portfolio analytics platform using MySQL 9.3 and Power BI**

</div>

---

## 🎯 **Project Overview**

Comprehensive banking analytics solution analyzing **38.6K loan applications** with **$435.8M in funded amounts** across multiple risk categories, geographic regions, and borrower demographics. Features real-time KPI monitoring, risk assessment, and predictive insights for data-driven lending decisions.

### **Key Business Insights**
- 💰 **Portfolio Performance**: 86.2% good loans, 13.8% bad loans with detailed risk profiling
- 📈 **Growth Metrics**: 6.9% MoM increase in applications, 13.0% funding growth
- 🌍 **Geographic Analysis**: State-wise lending distribution with risk concentration mapping
- 📊 **Risk Intelligence**: Interest rate trends (12.0% avg) and DTI analysis (13.3% avg)

---

## 🚀 **Quick Start**

1. **🗃️ Database Setup** - Import `financial_loan.csv` using MySQL 9.3
2. **📊 Dashboard Access** - Open `Bank_Loan_Analytics.pbix` in Power BI Desktop
3. **🔌 Connection** - ODBC configuration for enterprise-grade connectivity
4. **📈 Analysis** - Explore 3 interactive dashboard pages with 15+ KPIs

*📋 Refer to `SQL_Documentation.sql` for complete database setup and `Technical_Notes.md` for ODBC configuration*

---

## 🛠️ **Technical Architecture**

### **Database Layer (MySQL 9.3)**
- **Optimized Schema** - Strategic indexing on loan_status, grade, issue_date
- **Data Types** - DECIMAL for financial precision, DATE for temporal analysis
- **Performance** - Sub-second query response with 38K+ records

### **Integration Layer (ODBC)**
- **Enterprise Connectivity** - Universal database interface
- **Connection Resilience** - Handles version compatibility issues
- **Authentication** - Secure credential management with role-based access

### **Visualization Layer (Power BI)**
- **Interactive Dashboards** - 3-page executive reporting suite
- **Advanced DAX** - 15+ calculated measures for dynamic KPIs
- **Real-time Filtering** - State, grade, purpose, and temporal slicers

---

## 🔧 **ODBC Configuration & Technical Solutions**

### **Connection Challenge Solved**
```
🚨 Problem: Power BI native MySQL connector failed
💡 Solution: ODBC universal interface implementation
✅ Result: Stable, enterprise-grade connectivity
```

### **Technical Implementation**
```sql
-- User Permission Configuration
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- ODBC Connection String
Server: localhost:3306
Database: bank_loan_analysis_db
Authentication: Database credentials
Status: ✅ Production Ready
```

### **Why ODBC Succeeded**
- **Universal Interface** - Eliminates version-specific conflicts
- **Enterprise Standard** - Production-grade reliability
- **Error Handling** - Superior diagnostic capabilities

---

## 📊 **Dashboard Features**

### **Page 1: Executive Summary**
- 🎛️ **KPI Cards** - Total applications, funding, interest rates with MoM tracking
- 🟢 **Good Loan Analysis** - 86.2% portfolio quality with $370.2M funding
- 🔴 **Bad Loan Monitoring** - 13.8% risk exposure with $65.5M impact
- 📋 **Status Breakdown** - Charged Off, Current, Fully Paid performance matrix

### **Page 2: Overview Analytics**
- 📈 **Monthly Trends** - Seasonal lending patterns and growth trajectories
- 🗺️ **Geographic Heatmap** - State-wise distribution with risk concentration
- 🏢 **Employment Analysis** - Lending by employment length and job stability
- 🎯 **Purpose Segmentation** - Debt consolidation vs other loan categories
- 🏠 **Home Ownership** - Mortgage, rent, own status impact analysis

### **Page 3: Detailed Data View**
- 📊 **Transaction Table** - Complete loan records with filtering capabilities
- 🔍 **Multi-dimensional Slicing** - State, grade, purpose cross-filtering
- 📋 **Record-level Insights** - Individual loan performance tracking
- 📈 **Custom Metrics** - User-defined KPI calculations

---

## 📁 **Repository Structure**

```
bank-loan-analytics/
├── 📊 Bank_Loan_Analytics.pbix          # Main Power BI dashboard
├── 🗄️ financial_loan.csv               # Clean dataset (38.6K records)
├── 📄 SQL_Documentation.sql            # Complete query library
├── 📋 Technical_Notes.md               # ODBC setup & optimization
├── 📷 Dashboard_Summary.png            # Executive summary view
├── 📷 Dashboard_Overview.png           # Analytics overview
├── 📷 Dashboard_Details.png            # Detailed data view
├── 📁 SQL_Queries/                     # Modular query files
│   ├── 01_Database_Setup.sql
│   ├── 02_KPI_Calculations.sql
│   ├── 03_Risk_Analysis.sql
│   └── 04_Geographic_Analytics.sql
└── 📖 README.md                        # This file
```

---

## 🎯 **Key Performance Metrics**

| **KPI Category** | **Current** | **MTD** | **MoM Change** |
|------------------|-------------|---------|----------------|
| 📋 **Total Applications** | 38.6K | 4.3K | **+6.9%** |
| 💰 **Funded Amount** | $435.8M | $54.0M | **+13.0%** |
| 💵 **Amount Received** | $473.1M | $58.1M | **+15.8%** |
| 📊 **Interest Rate** | 12.0% | 12.4% | **+3.5%** |
| 📈 **DTI Ratio** | 13.3% | 13.7% | **+2.7%** |

### **🏆 Risk Distribution**
- **✅ Good Loans**: 33.2K applications (86.2%) - $370.2M funded
- **❌ Bad Loans**: 5.3K applications (13.8%) - $65.5M funded
- **💼 Portfolio Health**: Strong performance with controlled risk exposure

### **🌟 Top Insights**
- **🥇 Peak Funding**: 10+ years employment length ($116M total)
- **🥈 Geographic Leader**: CA, TX, NY drive highest application volumes
- **🥉 Purpose Analysis**: Debt consolidation dominates at $0.23B

---

## 💾 **Data Engineering & Quality**

### **Import Optimization Challenge**
```
🚨 Issue: MySQL Workbench import wizard extremely slow (7,800 rows = 6+ minutes)
💡 Solution: LOAD DATA INFILE bulk import (38.6K rows = seconds)
📈 Performance Gain: 100x faster data loading
```

### **Data Quality Assurance**
- **🧹 Data Cleaning** - Standardized date formats (YYYY-MM-DD)
- **✅ Validation** - Referential integrity across all dimensions
- **🎯 Type Optimization** - DECIMAL for financial accuracy, proper indexing
- **📊 Completeness** - Zero missing values in critical KPI calculations

### **Technical Optimizations**
```sql
-- Strategic Indexing for Performance
INDEX idx_loan_status (loan_status),     -- Risk analysis queries
INDEX idx_grade (grade),                 -- Credit scoring filters  
INDEX idx_issue_date (issue_date),       -- Temporal analytics
INDEX idx_state (address_state),         -- Geographic analysis
INDEX idx_purpose (purpose)              -- Purpose segmentation
```

---

<div align="center">

**⭐ Star this repo if you found it valuable for your banking analytics needs!**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/shivam-dali-86b0a1201)
[![Portfolio](https://img.shields.io/badge/Portfolio-FF5722?style=for-the-badge&logo=todoist&logoColor=white)](https://portfolio-svd-v1.vercel.app/)
[![Medium](https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/@SVD.exe)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:shivamdali@gmail.com)

*Built with 🏦 using MySQL 9.3, Power BI & ODBC | Financial Analytics Portfolio Project*

</div>
