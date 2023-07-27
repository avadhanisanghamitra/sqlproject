CREATE TABLE students(
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    date_of_birth DATE,
    address VARCHAR(100),
    contact_number VARCHAR(15)
);
CREATE TABLE courses(
    course_id INT PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(200),
    credits INT
);
CREATE TABLE grades(
    student_id INT,
    course_id INT,
    grade FLOAT,
    PRIMARY KEY (student_id,course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
CREATE TABLE enrollments(
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id,course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
-- Adding new Student data
INSERT INTO students (student_id,name,date_of_birth,address,contact_number) VALUES (1,'John Doe','1995-07-15','123 Main Street','555-1234');
INSERT INTO students (student_id,name,date_of_birth,address,contact_number) VALUES (2,'San Miller','1999-05-01','25 Church Street','251-3568');
INSERT INTO students (student_id,name,date_of_birth,address,contact_number) VALUES (3,'Jessy Paul','1998-06-13','52 Cabin Street','534-5621');
INSERT INTO students (student_id,name,date_of_birth,address,contact_number) VALUES (4,'Joe Ammster','1995-03-24','12 Garden Cup','152-6524');
INSERT INTO students (student_id,name,date_of_birth,address,contact_number) VALUES (5,'Ryan Ligertwood','1996-08-09','03 Star wall','5234-3652');
INSERT INTO students (student_id,name,date_of_birth,address,contact_number) VALUES (6,'Reese Cooper','1995-09-12','56 Moon road','9589-3215');
INSERT INTO students (student_id,name,date_of_birth,address,contact_number) VALUES (7,'Jude stephen','1998-01-05','18 Matt way','945-2145');

-- Retrieving student information
SELECT * FROM students WHERE student_id=1;
SELECT * FROM students WHERE student_id=7;
SELECT * FROM students WHERE student_id=2;
SELECT * FROM students;
-- Adding course into course management
INSERT INTO courses(course_id,name,description,credits) VALUES (101,'Mathematics','Introduction to Calculus',3);
INSERT INTO courses(course_id,name,description,credits) VALUES (102,'Physics','Introduction to Fluid Mechanics',3);
INSERT INTO courses(course_id,name,description,credits) VALUES (103,'Chemistry','Introduction to Organic Chemistry',3);

-- Retrieving course information
SELECT * FROM courses WHERE course_id=101;
SELECT * FROM courses WHERE course_id=102;
SELECT * FROM courses WHERE course_id=103;
SELECT * FROM courses;
-- Adding grades into Grademanagement
INSERT INTO grades (student_id,course_id,grade) VALUES(1,101,85.5);
INSERT INTO grades (student_id,course_id,grade) VALUES(2,102,95.5);
INSERT INTO grades (student_id,course_id,grade) VALUES(3,103,65.4);
INSERT INTO grades (student_id,course_id,grade) VALUES(4,101,67.9);
INSERT INTO grades (student_id,course_id,grade) VALUES(5,101,85);
INSERT INTO grades (student_id,course_id,grade) VALUES(6,102,65);
INSERT INTO grades (student_id,course_id,grade) VALUES(7,103,92.8);
-- updating students grade for a course
UPDATE grades SET grade=90.0 WHERE student_id=1 AND course_id =101;
UPDATE grades SET grade=59.0 WHERE student_id=6 AND course_id =102;

-- Enrolling a student in a course
INSERT INTO enrollments(student_id,course_id,enrollment_date) VALUES (1,101,'2023-01-01');
INSERT INTO enrollments(student_id,course_id,enrollment_date) VALUES (2,102,'2023-01-12');
INSERT INTO enrollments(student_id,course_id,enrollment_date) VALUES (3,103,'2023-01-01');
INSERT INTO enrollments(student_id,course_id,enrollment_date) VALUES (4,101,'2023-01-25');
INSERT INTO enrollments(student_id,course_id,enrollment_date) VALUES (5,101,'2023-01-05');
INSERT INTO enrollments(student_id,course_id,enrollment_date) VALUES (6,102,'2023-02-15');
INSERT INTO enrollments(student_id,course_id,enrollment_date) VALUES (7,103,'2023-01-11');
-- Retrieving enrolled courses
SELECT course.* FROM courses JOIN enrollments ON courses.course_id=enrollments.course_id;

-- creating report
SELECT AVG(grade) FROM grades WHERE student_id=1;

-- Top performing students 
SELECT students.*,AVG(grades.grade) AS average_grade FROM students JOIN grades ON students.student_id = grades.student_id GROUP BY students.student_id ORDER BY average_grade DESC LIMIT 10;
