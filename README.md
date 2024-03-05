# SQL Data exploration and analysis of Sakila database


## Summary of the project
#### This SQL Data Exploration Project focuses on analyzing data within the 'Sakila' sample database, a commonly used resource for practicing SQL queries and database operations. The project is divided into three main parts: film and inventory analysis, customer behavior, and actor analysis.

### A.The database used is sakila database, a sample database from MySQL (link: https://dev.mysql.com/doc/sakila/en/) 

#### 1.sakila_data file content below:
Sakila Sample Database Data
-- Version 1.3


-- Copyright (c) 2006, 2022, Oracle and/or its affiliates.

-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are
-- met:

-- * Redistributions of source code must retain the above copyright notice,
--   this list of conditions and the following disclaimer.
-- * Redistributions in binary form must reproduce the above copyright
--   notice, this list of conditions and the following disclaimer in the
--   documentation and/or other materials provided with the distribution.
-- * Neither the name of Oracle nor the names of its contributors may be used
--   to endorse or promote products derived from this software without
--   specific prior written permission.

-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
-- IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
-- CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
-- PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
-- LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
-- NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#### 2. About sakila database:
The Sakila sample database was initially developed by Mike Hillyer, a former member of the MySQL AB documentation team. It is intended to provide a standard schema that can be used for examples in books, tutorials, articles, samples, and so forth. The Sakila sample database also serves to highlight features of MySQL such as Views, Stored Procedures, and Triggers.

Additional information on the Sakila sample database and its usage can be found through the MySQL forums.

The Sakila sample database is the result of support and feedback from the MySQL user community and feedback and user input is always appreciated. Please direct all feedback using the http://www.mysql.com/company/contact/. For bug reports, use MySQL Bugs.

### B. Summary of each part: 
#### 1. Film and Inventory Analysis:
This part begins with basic data retrieval from the film table to understand the range of film lengths and characteristics such as title, release year, and rating.
It categorizes films based on their lengths: under one hour, between one and two hours, and over two hours, and performs a count within these categories.
Views are created for these categories to make future analyses more accessible.
Additionally, this section explores the inventory by calculating the number of copies available for each film and the average rental duration, providing insights into inventory size and rental patterns.
#### 2. Customer Behavior:
This segment identifies the top 10 customers based on their rental activity, offering a glimpse into the most active users within the system.
It examines rental frequency by month and year to uncover any trends, such as peak rental times.
There's a specific analysis on the most popular film categories among customers in two Romanian cities, Bucuresti and Botosani, providing localized insights into customer preferences.
#### 3. Actor Analysis:
The focus shifts to analyzing actors within the Sakila database, listing them by the number of films they've appeared in. This helps identify the most prolific actors.
It includes a query to list all films for a specific actor, providing a detailed view of an actor's work within the database.

### C. Tools used:
#### 1. MySQL 8.0 (server + workbench)
#### 2. Git Bash (creating the repository, adding the SQL file to the repository)
#### 3. Tableau 2024.1 for data visualization (direct connection from Tableau Desktop to MySQL)

