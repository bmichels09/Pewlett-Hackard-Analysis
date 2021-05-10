-- Get titles of retiring employees
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM titles as t
	JOIN employees as e
		ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Use Distinct with Order By to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Find number of retiring employees with each title
SELECT COUNT(emp_no) AS count,
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;


-- Get list of employees eligible for mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
	JOIN dept_emp as de
		ON de.emp_no = e.emp_no
	JOIN titles as t
		ON t.emp_no = e.emp_no
WHERE de.to_date = '9999-01-01'
	AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
	AND t.to_date = '9999-01-01'	--Get the employees' current titles
ORDER BY e.emp_no;