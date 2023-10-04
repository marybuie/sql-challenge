CREATE TABLE IF NOT EXISTS Titles(
title_id VARCHAR (5) PRIMARY KEY, 
title VARCHAR (25) NOT NULL
);

CREATE TABLE IF NOT EXISTS Departments(
dept_no VARCHAR (4) PRIMARY KEY,
dept_name VARCHAR (25) NOT NULL
);

CREATE TABLE IF NOT EXISTS Salaries(
emp_no INT PRIMARY KEY,
salary INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Dept_Emp(
emp_no INT REFERENCES Salaries (emp_no),
dept_no VARCHAR (4) REFERENCES Departments (dept_no),
PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE IF NOT EXISTS Dept_manager(
dept_no VARCHAR (4) REFERENCES Departments (dept_no),
emp_no INT REFERENCES Salaries (emp_no),
PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE IF NOT EXISTS Employees(
emp_no INT REFERENCES Salaries (emp_no),
emp_title_id VARCHAR (5) REFERENCES Titles (title_id),
birth_date VARCHAR (10) NOT NULL,
first_name VARCHAR (20) NOT NULL,
last_name VARCHAR (20) NOT NULL,
sex VARCHAR (1) NOT NULL,
hire_date VARCHAR (10) NOT NULL,
PRIMARY KEY (emp_no, emp_title_id)
);

SELECT * from departments;
SELECT * from dept_emp;
SELECT * from dept_manager;
SELECT * from employees;
SELECT * from salaries;
SELECT * from titles;

SELECT Salaries.emp_no, last_name, first_name, sex, salary
FROM Salaries
INNER JOIN Employees ON Salaries.emp_no = Employees.emp_no;

SELECT first_name, last_name, hire_date
FROM Employees
WHERE EXTRACT(YEAR FROM hire_date::DATE) = 1986;

SELECT Dept_manager.dept_no, Departments.dept_name, Employees.emp_no, Employees.last_name, Employees.first_name
FROM Dept_manager
INNER JOIN Departments on Dept_manager.dept_no = Departments.dept_no
INNER JOIN Employees on Dept_manager.emp_no = Employees.emp_no;

SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT E.employee_number, E.last_name, E.first_name
FROM Employees AS E
INNER JOIN Departments AS D ON E.department_name = D.department_name
WHERE D.department_name = 'Sales';

Select Employees.emp_no, Employees.last_name, Employees.first_name
From Employees
JOIN Dept_emp ON Employees.emp_no = Dept_emp.emp_no
JOIN Departments ON Dept_emp.dept_no = Departments.dept_no
WHERE Departments.dept_name = 'Sales';

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
JOIN Dept_emp ON Employees.emp_no = Dept_emp.emp_no
JOIN Departments ON Dept_emp.dept_no = Departments.dept_no
WHERE Departments.dept_name IN ('Sales', 'Development');

SELECT last_name, COUNT(*) as last_name_count
FROM Employees
GROUP BY last_name
ORDER BY last_name_count DESC;