# Sales Analysis and Customer Insights

This repository contains SQL queries for analyzing customer data and sales figures.

## Table of Contents

1. [Customer Analysis](#customer-analysis)
2. [Sales Reporting](#sales-reporting)

## Customer Analysis

### Detailed Customer Overview

Retrieves top 200 customers with:
- **Identity Info**: CustomerId, FullName, addressing_title
- **Contact Info**: Email, phone, account number, CustomerType
- **Location**: City, State, Country, address
- **Sales Data**: Number of orders, total amount (with Tax), last order date

### Inactive Customer Segmentation

Finds the top 200 customers (by total amount) who haven’t ordered in the last 365 days.

### Customer Activity Status

Adds a column to mark customers as 'active' or 'inactive' based on their order history in the last 365 days. Returns top 500 rows.

### North American Active Customers

Lists active North American customers with:
- Orders totaling $2500+ (with Tax) or
- 5+ orders

Splits address into AddressLine1, address_no, Address_st. Orders by country, state, and last order date.

## Sales Reporting

### Monthly Sales Numbers

Shows monthly sales figures by Country and Region:
- Orders count
- Customers count
- Salespersons count
- Total amount with tax

### Cumulative Sales and Ranking

Calculates cumulative sales and ranks regions by total amount (with tax).

### Sales Tax Analysis

Includes:
- **Mean Tax Rate**: Average tax rate per country
- **Percentage of Provinces with Tax Rates**


1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/sales-analysis.git
