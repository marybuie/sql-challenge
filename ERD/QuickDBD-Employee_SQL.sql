-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/fy5vBh
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Titles" (
    "Title_id" string   NOT NULL,
    "Title" string   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Title_id","Title"
     )
);

CREATE TABLE "Departments" (
    "Dept_no" string   NOT NULL,
    "Dept_name" string   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Dept_no","Dept_name"
     )
);

CREATE TABLE "Dept_Emp" (
    "Emp_no" int   NOT NULL,
    "Dept_no" string   NOT NULL
);

CREATE TABLE "Salaries" (
    "Emp_no" int   NOT NULL,
    "Salary" string   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "Dept_manager" (
    "Dept_no" string   NOT NULL,
    "Emp_no" int   NOT NULL
);

CREATE TABLE "Employees" (
    "Emp_no" int   NOT NULL,
    "Title_id" string   NOT NULL,
    "Birth_date" string   NOT NULL,
    "First_name" string   NOT NULL,
    "Last_name" string   NOT NULL,
    "Sex" string   NOT NULL,
    "Hire_date" string   NOT NULL
);

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Salaries" ("Emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Departments" ("Dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Departments" ("Dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Salaries" ("Emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Dept_Emp" ("Emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Title_id" FOREIGN KEY("Title_id")
REFERENCES "Titles" ("Title_id");

