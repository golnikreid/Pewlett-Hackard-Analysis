-- Deliverable 1

select emp_no, first_name, last_name from Employees

select title, from_date, to_date from Titles

-- Create new table for retiring employee titles
SELECT e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees e
INNER JOIN titles ti ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');
-- Check the table
SELECT * FROM retirement_titles order by emp_no;


-- Creating the unique_titles table
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;
select * from unique_titles;

-- Create retiring_titles table
SELECT COUNT(title) title_count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title

select * from retiring_titles



-- Deliverable 2
select * from employees
select * from dept_emp
select * from titles

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, ti.title
INTO mentorship_eligibility
FROM Employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN titles ti ON e.emp_no = ti.emp_no
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no

select * from mentorship_eligibility














