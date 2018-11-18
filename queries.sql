--Queries time

/* SELECTION and PROJECTION - selection gets the columns, student name and student email from the table Student
whilst projection is the checking of which student type, the student is */
select student_name, student_email from Student where (student_type like '%undergrad');

/* AGGREGATION with filters on aggregates - this query gets the different course codes there are from table Course and 
joins table Student to get the number of students studying each course code.
Aggregation can be seen in the count function which counts the number of students */
select course_code, count(student_name) Students from Course
left join Student using (course_code)
group by course_code;

-- UNION join to display all the emails used by people in the college, both lecturers and students.
select lecturer_email from Lecturer
UNION
select student_email from student;

-- MINUS query to find out who is a course coorinator but isn't a lecturer
select c_coordinator from Course
MINUS
select lecturer from Lecturer;


/* INNER JOIN to get the course name from the Course table and the student name from the table Student
using the primary key, course_code from Course and using the where clause to get students studying the course dt228*/
select course_name, student_name from Course 
inner join Student 
using (student_group, course_code)
where (course_code like '%dt228');

/* OUTER JOIN to get the course name from the Course table and the student name from the table Student,
despite Computer Science infastructure not having a corresponding student with the same course code,
it is displayed anyway, this is the purpose of a full outer join */
select course_name, student_name from Course 
full outer join Student 
using (course_code); 

-- SEMI JOIN which selects all rows from table Course if the course code from Course features as the course code from Student
select * from Course 
where course_code in (
    select course_code 
    from Student
);


-- ANTI JOIN to select all the rows from table course if the course code from Course DOES NOT features as the course code from Student
select * from Course 
where course_code not in (
    select course_code 
    from Student
);

-- CORRELATED SUBQUERY to find all rows in the Lecturer table where the value for lecturer does not feature as a value for lecturer in the Module table 
select * from Lecturer l
where l.lecturer =(
select m.lecturer from Module m
where m.lecturer = 'Damien Bourke');
