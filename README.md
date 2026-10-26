#  Inventory and Stock Management System

A relational database project developed using MySQL to manage products, suppliers, purchases, sales, and inventory levels.

## 📌 About the Project

The Inventory and Stock Management System is designed to simplify inventory tracking for small businesses. It stores product and supplier information, records purchases and sales, and helps users identify products that need restocking.

The project demonstrates the practical implementation of Database Management System (DBMS) concepts using MySQL.

## 🎯 Objectives

* Maintain product and supplier records.
* Record purchases from suppliers.
* Record sales transactions.
* Update stock automatically using triggers.
* Prevent sales when sufficient stock is unavailable.
* Generate inventory and sales reports.
* Practice relational database design and SQL.

## 🛠️ Technologies Used

* MySQL
* SQL
* MySQL Workbench
* Git and GitHub

## 📂 Project Structure

```text
Inventory-Stock-Management-System/
├── README.md
├── database/
│   ├── schema.sql
│   ├── sample_data.sql
│   ├── triggers.sql
│   └── demo_transactions.sql
├── queries/
│   ├── basic_queries.sql
│   └── reports.sql
└── screenshots/
    └── .gitkeep
```

## 🗄️ Database Tables

| Table          | Description                           |
| -------------- | ------------------------------------- |
| Suppliers      | Stores supplier information           |
| Products       | Stores product and stock details      |
| Purchases      | Stores purchase transactions          |
| Purchase_Items | Stores products included in purchases |
| Sales          | Stores sales transactions             |
| Sale_Items     | Stores products included in sales     |

## ⚙️ Features

* Product management
* Supplier management
* Purchase recording
* Sales recording
* Automatic stock updates
* Low-stock identification
* Inventory valuation
* Sales and purchase reports
* Supplier-wise product reports
* SQL joins and aggregate queries

## 🚀 How to Run the Project

### Step 1: Install MySQL

Install MySQL Server and MySQL Workbench.

### Step 2: Open the Project

Clone this repository or download the project files.

### Step 3: Create the Database

Open `database/schema.sql` in MySQL Workbench and execute it.

### Step 4: Insert Sample Data

Execute `database/sample_data.sql`.

### Step 5: Create Triggers

Execute `database/triggers.sql`.

### Step 6: Test the Transactions

Execute `database/demo_transactions.sql` to demonstrate purchases, sales, and automatic stock updates.

### Step 7: Execute Queries

Run the SQL files inside the `queries/` folder to explore inventory data and generate reports.

Run the sample-data script only once on a fresh database to avoid duplicate records.

## 🧠 DBMS Concepts Demonstrated

* Relational database design
* Primary and foreign keys
* Data integrity constraints
* SQL CRUD operations
* INNER JOIN and LEFT JOIN
* Aggregate functions
* GROUP BY and ORDER BY
* Database views (planned extension)
* Triggers
* Transactions
* Inventory reporting

## 🔮 Future Enhancements

* Web-based user interface
* Administrator and staff login
* Automated stock notifications
* Product barcode support
* Advanced sales analytics
* Interactive dashboards using Power BI
* Improved transaction error handling

## ⚠️ Project Scope

This repository contains an educational database implementation. It does not yet provide a graphical user interface, authentication, or complete handling of edits and deletions to existing transactions.

## 👨‍🎓 Project Information

**Project Name:** Inventory and Stock Management System

**Category:** Database Management System (DBMS)

**Database:** MySQL

**Purpose:** Academic project and SQL learning

## 📄 License

This project is available for educational and learning purposes.

