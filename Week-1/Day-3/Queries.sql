--Joins
--Q1
--Display all students and the courses they are enrolled in. Include students who are not enrolled in any course
select students.student_name,
       courses.course_name
from students
left join enrollments
on students.student_id = enrollments.student_id
left join courses
on enrollments.course_id = courses.course_id;

--Q2
--Find all courses that currently have no students enrolled
select courses.course_name
from courses
left join enrollments
on courses.course_id = enrollments.course_id
where enrollments.student_id is null;

--Q3
--Display all instructors and the courses they teach, including instructors who are not assigned to any course
select instructors.instructor_name,
       courses.course_name
from instructors
left join courses
on instructors.instructor_id = courses.instructor_id;

--Q4
--Find all courses that do not have an instructor assigned
select course_name
from courses
where instructor_id is null;

--Q5
--Display all students and enrollment information using a RIGHT JOIN
select students.student_name,
       enrollments.course_id
from students
right join enrollments
on students.student_id = enrollments.student_id;

--Q6
--Find students who are not enrolled in any course
select students.student_id,students.student_name from students left join enrollments on students.student_id=enrollments.student_id where enrollment_id is null;

--Q7
--Use a FULL OUTER JOIN to display all students and enrollments, including unmatched rows from both tables
select students.student_name,
       enrollments.course_id
from students
left join enrollments
on students.student_id = enrollments.student_id

union

select students.student_name,
       enrollments.course_id
from students
right join enrollments
on students.student_id = enrollments.student_id;

--Q8
--Find all courses that have never appeared in the enrollments table
select courses.course_name
from courses
left join enrollments
on courses.course_id = enrollments.course_id
where enrollments.course_id is null;

--Q9
--Display all instructors and courses using a FULL OUTER JOIN and identify unmatched rows
select instructors.instructor_name,
       courses.course_name
from instructors
left join courses
on instructors.instructor_id = courses.instructor_id

union

select instructors.instructor_name,
       courses.course_name
from instructors
right join courses
on instructors.instructor_id = courses.instructor_id;

--Q10
--Create a report showing: student name, course name, and instructor name. Include rows even if course or instructor information is missing
select students.student_name,
       courses.course_name,
       instructors.instructor_name
from students
left join enrollments
on students.student_id = enrollments.student_id
left join courses
on enrollments.course_id = courses.course_id
left join instructors
on courses.instructor_id = instructors.instructor_id;
