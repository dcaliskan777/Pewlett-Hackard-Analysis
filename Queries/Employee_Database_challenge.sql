-- DELIVERABLE 1: THE NUMBER OF RETIRING EMPLOYEES BY TITLE 

-- Creating retirement_title table
SELECT  e.emp_no,
        e.first_name,
		e.last_name,
        ti.title,
		ti.from_date,
        ti.to_date        
INTO retirement_titles
FROM employees AS e
    INNER JOIN titles AS ti
        ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
--Checking retirement_title table
SELECT*FROM retirement_titles


-- Use Dictinct with Orderby to remove duplicate rows
--Creating unique_titles table 
SELECT DISTINCT ON (rt.emp_no)
          rt.emp_no,
          rt.first_name,
		  rt.last_name,
		  rt.title
INTO unique_titles		  
FROM retirement_titles AS rt
WHERE to_date='9999-01-01'
ORDER BY rt.emp_no ASC,
         rt.to_date DESC;
--Checking unique_titles table
SELECT*FROM unique_titles 


--Creating retiring_titles table
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY count DESC;
--Checking retiring_titles table
SELECT*FROM retiring_titles

-- DELIVERABLE 2: THE EMPLOYEES ELIGIBLE FOR THE MENTORSHIP PROGRAM 
--Creating mentorship_eligibility table
SELECT DISTINCT ON (e.emp_no)
          e.emp_no,
          e.first_name,
		  e.last_name,
		  e.birth_date,
		  de.from_date,
		  de.to_date,
		  ti.title
INTO mentorship_eligibility		  
FROM employees AS e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (de.to_date='9999-01-01') 
     AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')     
ORDER BY e.emp_no;
--Checking the mentorship_eligibility table
SELECT*FROM mentorship_eligibility