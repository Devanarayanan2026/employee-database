CREATE SCHEMA employee;

use employee;


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
  SELECT * FROM employees;  
   



