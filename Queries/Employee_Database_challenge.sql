------------------- CHALLENGE 7 & DELIVERABLE #1------------------------------
---------------------------------------------------------------------------
--Display employees table
SELECT * FROM employees;

-- RETRIEVE emp_no, first_name & last_name 
SELECT emp_no, first_name, last_name
FROM employees;

-- show titles table
SELECT * FROM titles;
-- Retrieve title, from & to_date
SELECT title, from_date, to_date
FROM titles;

-- Create a new table using INTO & join the tables on the primary key emp_no
SELECT emp_no, first_name, last_name, birth_date
INTO emp_data
FROM employees;
-- SHOW EMP_DATA
SELECT * FROM emp_data;
-- DROP emp_data
DROP TABLE emp_data;
-- join the tables emp_data and titles
SELECT ed.emp_no,
	 ed.first_name,
	 ed.last_name,
     ti.title,
     ti.from_date,
     ti.to_date
INTO retirement_titles
FROM titles as ti
INNER JOIN emp_data as ed
ON ti.emp_no = ed.emp_no
WHERE (ed.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY ed.emp_no;
--VIew retirement titles
SELECT * FROM retirement_titles;
-- drop retirement_titles
DROP  TABLE retirement_titles;
---- 10-14
-- Retrieve the emp_no, firsy & last_name, and titles from retirement_titles
SELECT emp_no, first_name, last_name, title
FROM retirement_titles;
-- Use Dictinct with Orderby to remove duplicate rows #10-14
SELECT DISTINCT ON (emp_no) emp_no,
first_name, 
last_name, 
title
INTO retired_updated
FROM retirement_titles
ORDER BY emp_no, to_date ASC;
-- View updated
SELECT * FROM retired_updated;
-- Drop Table retired_updated
DROP TABLE retired_updated;
-- 15-20
-- Retrieve the emp_no, first& last_name, and titles from retirement_titles
SELECT emp_no, first_name, last_name, title
FROM retirement_titles;
-- Use Dictinct with Orderby to remove duplicate rows #10-14
SELECT DISTINCT ON (emp_no) emp_no,
first_name, 
last_name, 
title
INTO retired_updated
FROM retirement_titles
ORDER BY emp_no, to_date ASC;
-- View updated
SELECT * FROM retired_updated;
-- Drop Table retired_updated
DROP TABLE retired_updated;

SELECT * FROM retirement_titles;
-- Retrieve number of employees by recent job title who are going to retire
SELECT COUNT(title) , title
INTO retired_titles
FROM retired_updated
GROUP BY title
ORDER BY COUNT(title) DESC;
--SHOW & DROP TITLES
SELECT * FROM retired_titles;
DROP TABLE retired_titles;
SELECT * FROM titles;

----------------------- CHALLENGE 7 & DELIVERABLE #2 -----------------------------

-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
SELECT emp_no, first_name, last_name, birth_date
FROM employees;
-- Retrieve the from_date and to_date columns from the Department Employee table.
SELECT from_date, to_date
FROM dept_emp;
-- Retrieve the title column from the Titles table.
SELECT title
FROM titles;
-- Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (em.emp_no)
em.emp_no,
em.first_name,
em.last_name,
em.birth_date,
de.from_date,
ti.to_date,
ti.title
INTO mentorship_el
FROM employees AS em
INNER JOIN dept_emp AS de
ON (em.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (ti.to_date ='9999-01-01')
ORDER BY em.emp_no;
-- View Table
SELECT * FROM mentorship_el;
---DROP TABLE
DROP TABLE mentorship_el;
-- Current employee
SELECT * FROM current_emp;
-- DISPLAY EMPOYEES & TITLES
SELECT*FROM employees;
SELECT*FROM dept_emp;
SELECT*FROM titles;