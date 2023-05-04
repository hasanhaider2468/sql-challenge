DROP TABLE if EXISTS departments CASCADE;
DROP TABLE if EXISTS dept_emp CASCADE;
DROP TABLE if EXISTS employees CASCADE;
DROP TABLE if EXISTS dept_manager CASCADE;
DROP TABLE if EXISTS titles CASCADE;
DROP TABLE if EXISTS salaries CASCADE;

create TABLE departments(
	dept_no varchar(20) PRIMARY KEY,
	dept_name varchar(20) NOT NULL
);
create TABLE titles
(
	title_id varchar PRIMARY KEY,
	title varchar NOT NULL
);
create TABLE employees
(
	emp_no int PRIMARY KEY,
	emp_title_id varchar(20) NOT NULL,	
	birth_date DATE NOT NULL,
	first_name varchar(20) NOT NULL,
	last_name varchar(20) NOT NULL,
	sex	varchar(20) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) references titles(title_id)
);
create TABLE salaries(
	emp_no int PRIMARY KEY,
	salary int NOT NULL,
	FOREIGN KEY (emp_no) references employees(emp_no)
);
create TABLE dept_emp(
	emp_no int NOT NULL,
	dept_no varchar NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (dept_no) references departments(dept_no),
	FOREIGN KEY (emp_no) references employees(emp_no)
);

create TABLE dept_manager
(
	dept_no varchar NOT NULL,
	emp_no int PRIMARY KEY,
	FOREIGN KEY (emp_no) references employees(emp_no),
	FOREIGN KEY (dept_no) references departments(dept_no)
);