SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility 
FROM employees AS e
	INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
	INNER JOIN titles AS t
	ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31');
SELECT * FROM mentorship_eligibility

SELECT DISTINCT ON (me.emp_no) me.emp_no,
me.first_name,
me.last_name,
me.birth_date,
me.from_date,
me.to_date,
me.title
INTO mentors
FROM mentorship_eligibility AS me
WHERE me.to_date = ('9999-01-01')
ORDER BY me.emp_no, me.to_date DESC;
SELECT * FROM mentors

