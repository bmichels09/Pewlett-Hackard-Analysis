# Pewlett Hackard Retirement Analysis

## Overview of Analysis
The purpose of this analysis is to find the number of employees nearing retirement for each role, and to find current employees that can mentor the new generation of employees.

## Results
- 90,398 employees are expected to retire soon.
- Most of the expected retirees are Senior Engineers and Senior Staff.
- 2 of the 9 department managers are set to retire.
- 1,549 employees are eligible for the mentorship program.

## Summary
About 90,000 roles will need to be filled during the "silver tsunami".  The number of retirement-ready employees is much higher than the number of employees that are eligible for mentorship, so we should have an adequate number of mentors.

The following query compares the number of retiring employees with each title to the total number of employees with the title.  This will show if any titles are more heavily affected by the "silver tsunami".

    SELECT t.title AS "Title",
      r.count AS "Retiring",
      COUNT(t.emp_no) AS "All"
    FROM titles AS t
      JOIN retiring_titles AS r
        ON r.title = t.title
    WHERE t.to_date = '9999-01-01'
    GROUP BY t.title, r.count
    ORDER BY "All" DESC;

Staff and Assistant Engineer seem to be the most heavily affected.

![Retiring Employees vs. All](/Images/retiring_vs_all.png)


The following query shows the number of retiring employees by department.

    SELECT d.dept_name AS "Department",
      COUNT(u.emp_no) AS "Count"
    FROM unique_titles AS u
      JOIN dept_emp AS de
        ON de.emp_no = u.emp_no
      JOIN departments AS d
        ON d.dept_no = de.dept_no
    WHERE de.to_date = '9999-01-01'
    GROUP BY "Department"
    ORDER BY "Count" DESC;

The highest number of retirees come from Development, followed by Production and Sales.
	
![Retiring Employees by Department](/Images/department.png)