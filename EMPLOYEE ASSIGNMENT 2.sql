CREATE SCHEMA employee;

USE employee;

CREATE TABLE departments(
	department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
    );
    
CREATE TABLE location(
	location_id INT PRIMARY KEY,
    location VARCHAR(30)
    );
    
    
CREATE TABLE employees(
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender enum('M','F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2)
    );
    
ALTER TABLE employees ADD COLUMN email VARCHAR(100);
SELECT * FROM employees;

ALTER TABLE employees MODIFY COLUMN designation VARCHAR(200);

ALTER TABLE employees DROP COLUMN age;

ALTER TABLE employees RENAME COLUMN hire_date TO date_of_joining;

RENAME TABLE departments TO departments_info;

RENAME TABLE location TO locations;

TRUNCATE TABLE employees;

DROP TABLE employees;

DROP SCHEMA employee;



CREATE SCHEMA employee;
USE employee;

CREATE TABLE departments(
	department_id INT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL
    );
    
CREATE TABLE location(
    location_id INT PRIMARY KEY AUTO_INCREMENT,
	location VARCHAR(30) UNIQUE NOT NULL
    ); 
    
CREATE TABLE employees(
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
	gender enum('M','F'),
    age INT CHECK (age>=18),
    hire_date DATE DEFAULT (current_date),
    designation VARCHAR(100),
    department_id INT,
   FOREIGN KEY (department_id) references departments(department_id),
   location_id INT,
	FOREIGN KEY (location_id) references location(location_id),
    salary DECIMAL(10,2)
    );
    
    
SELECT DISTINCT salary from employees;    

SELECT age AS employee_age ,
 salary AS employee_salary from employees;



SELECT * FROM employees;

SELECT * FROM employees WHERE salary>50000 AND hire_date < '2016-01-01';
  

SELECT * FROM employees WHERE designation IS NULL;
UPDATE employees SET designation = 'Data Scientist' WHERE designation = null;


select * from employees order by department_id ,salary desc;

SELECT *
FROM employees
WHERE hire_date >= '2018-01-01'
  AND hire_date < '2019-01-01'
ORDER BY hire_date
LIMIT 5;



SELECT SUM(salary) AS total_salary
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM departments
    WHERE department_name = 'Finance'
);



SELECT MIN(age) AS min_age from employees;

SELECT location_id, MAX(salary) AS max_salary
FROM employees
GROUP BY location_id;


SELECT avg(salary) as avg_salary FROM employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) < 3;


SELECT location_id, AVG(age) AS avg_age
FROM employees
WHERE gender = 'F'
GROUP BY location_id
HAVING AVG(age) < 30;



SELECT e.employee_name,e.designation,d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id=d.department_id;



SELECT d.department_name,COUNT(e.employee_id)AS total_employees 
FROM departments d
LEFT JOIN employees e ON d.department_id=e.department_id
GROUP BY d.department_id,d.department_name;



SELECT l.location, e.employee_name
FROM employees e
RIGHT JOIN location l ON e.location_id = l.location_id;