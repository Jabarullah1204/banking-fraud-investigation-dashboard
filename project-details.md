# Banking Fraud Investigation Dashboard

## 1. Project Overview

The Banking Fraud Investigation Dashboard is a data analytics and AI-assisted fraud investigation project designed to identify and analyze potentially high-risk banking transactions.

The project combines Snowflake for data storage and SQL analysis, n8n for workflow automation, Hugging Face for AI-assisted analysis, and Power BI for interactive dashboard visualization.

## 2. Project Objectives

* Analyze banking transaction data
* Identify high-risk transactions
* Automate fraud investigation workflows
* Use AI-assisted analysis for transaction risk investigation
* Create an interactive Power BI dashboard
* Provide useful insights for fraud investigation and monitoring

## 3. Technologies Used

* Snowflake
* SQL
* n8n
* Hugging Face
* Power BI
* JSON
* GitHub

## 4. Project Workflow

Banking Transaction Data
↓
Snowflake
↓
SQL Analysis
↓
n8n Automation
↓
Hugging Face AI Analysis
↓
Fraud Risk Information
↓
Power BI Dashboard

## 5. Snowflake

Snowflake is used to store and analyze the banking transaction data.

SQL queries are used to:

* Retrieve transaction records
* Analyze transaction amounts
* Identify risk levels
* Filter high-risk transactions
* Prepare data for dashboard reporting

## 6. n8n

n8n is used to automate the fraud investigation workflow.

The workflow connects the data processing and AI analysis steps and passes relevant information between the different services.

## 7. Hugging Face

Hugging Face is used for AI-assisted analysis of transaction information.

The AI component can help analyze transaction-related information and generate investigation-oriented output.

API credentials are stored securely and are not included in this repository.

## 8. Power BI Dashboard

Power BI is used to create an interactive dashboard for monitoring banking transactions.

Key dashboard information includes:

* Total Transactions
* Risk Level
* High Risk Transactions
* Transaction Details
* Fraud Investigation Insights

## 9. Repository Structure

Banking-Fraud-Investigation-Dashboard/

├── PowerBI/

│   └── Banking_Fraud_Investigation_Dashboard.pbix

├── Snowflake/

│   └── fraud_queries.sql

├── n8n/

│   └── banking-fraud-investigation-workflow.json

├── Screenshots/

│   ├── dashboard-overview.png

│   └── high-risk-transactions.png

└── Documentation/

```
└── project-details.md
```

## 10. Security

No passwords, API keys, access tokens, private keys, or other sensitive credentials are included in this repository.

## 11. Future Enhancements

* Add real-time transaction monitoring
* Improve fraud risk classification
* Add additional fraud detection rules
* Add more advanced AI-assisted investigation
* Add automated alerts for high-risk transactions
* Expand dashboard analytics
