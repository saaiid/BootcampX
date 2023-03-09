-- Instruction
-- Get the total amount of time that a student has spent on all assignments.
-- This should work for any student but use 'Ibrahim Schimmel' for now.
-- Select only the total amount of time as a single column.

SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';


-- Cohort's Total Assignment Duration
--Instruction
--  Get the total amount of time that all students from a specific cohort have spent on all assignments.
--  This should work for any cohort but use FEB12 for now.
--  Select only the total amount of time as a single column.
--  You can write as many JOIN statements as you need in a single query. Expected Result:

SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'FEB12';


-- If we want to calculate the total number of assignment_submissions for all students, 
-- the count aggregate function is perfect.

SELECT count(assignment_submissions.*) as total_submissions
FROM assignment_submissions;

/* But what if we wanted to calculate the total number of assignment_submissions for each student 
individually, and output the totals next to the student's name?
We want to apply the count() function to groups of data, rather than the entire query. The groups 
in this case are the names of students. We want to apply the count() function for each students.name. */

SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id;

-- Now we just need to tell SQL that we want count(assignment_submissions.*) to be run for each 
-- students.name, instead of the entire query. To do this, we use the GROUP BY clause.

SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
GROUP BY students.name;

-- Alter the query slightly to only return currently enrolled students.
-- A currently enrolled student has a null end_date.

SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name;

-- HAVING
-- Now that we know how to get the total submissions for currently enrolled students, 
-- let's refine the query a bit more. Let's only return currently enrolled students 
-- who's total submissions  are less than 100;

SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING count(assignment_submissions.*) < 100;

