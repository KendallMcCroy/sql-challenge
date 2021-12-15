-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/UO08Bi
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

select * from departments


CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL,
	
select * from dept_emp
	
CREATE TABLE "dept_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL
);

select * from dept_manager

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

select * from employees 

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

select * from salaries

CREATE TABLE "titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

select * from titles



ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");
	

--------------------------------------------------------------------------------------------
---------------------------------- Queries--------------------------------------------------
--------------------------------------------------------------------------------------------
	
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
-- select employees.emp_no as  employee_number, employees.last_name, employees.first_name, employees.sex, salaries.salary
-- FROM employees
-- join salaries on employees.emp_no = salaries.emp_no
	
	
--2. List first name, last name, and hire date for employees who wer hired in 1986
-- SELECT employees.first_name, employees.last_name, employees.hire_date
-- FROM employees
-- WHERE extract(year from hire_date)= '1986'
	
	
--3. List the manager of each department with the following information: employee number, last name, first name, and department name
-- SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no,employees.last_name, employees.first_name
-- FROM dept_manager
-- JOIN departments
-- ON dept_manager.dept_no = departments.dept_no
-- JOIN employees
-- ON dept_manager.emp_no = employees.emp_no;
	
-- 4. List the department of each employee with the followig information: employee number, last name, first name, and department name
-- SELECT departments.dept_name, employees.last_name, employees.first_name, employees.emp_no
-- FROM dept_emp
-- JOIN departments
-- ON dept_emp.dept_no = departments.dept_no
-- JOIN employees
-- ON dept_emp.emp_no = employees.emp_no
	
-- 5. List first nae, last name and sex for employees whose first name is "Hercules" and last names begin with "B"
-- SELECT employees.first_name, employees.last_name, employees.sex
-- FROM employees
-- WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
	
-- 6. List all employees in the Sales department, includingg their employee number, last name, first name, and department name
SELECT departments.dept_name, employees.last_name, employees.first_name, employees.emp_no
FROM dept_emp
JOIN departments
ON dept_emp.dept_no = departments.dept_no
JOIN employees	
ON dept_emp.emp_no = employees.emp_no	
WHERE departments.dept_name = 'Sales'
	
	
	
	
	