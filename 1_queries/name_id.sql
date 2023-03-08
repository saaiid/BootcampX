/* SELECT id, name
FROM students
WHERE cohort.id = cohort_id
ORDER BY name ASC; */

-- Get the names of all of the students from a single cohort.
-- Select their id and name.
-- Order them by their name in alphabetical order.
-- Since this query needs to work with any specific cohort, 
-- just use any number for the cohort_id.
-- 1
SELECT id, name 
FROM students 
WHERE cohort_id = 1
ORDER BY name;

-- Total Students in Cohorts
-- The admissions department wants to know the total number of 
-- students from any number of cohorts combined
-- Select the total number of students who were in the first 3 cohorts

/* SELECT COUNT(*) 
FROM students
WHERE cohort_id IN (1, 2, 3); */ -- we can use command or the one below
--2
SELECT count(id)
FROM students 
WHERE cohort_id IN (1,2,3);


-- Get all of the students that don't have an email or phone number.
-- Get their name, id, and cohort_id
-- 3
SELECT name, id, cohort_id
FROM students
WHERE email IS NULL
OR phone IS NULL;


--  make sure that student's without a gmail account have a phone number
-- Get all of the students without a gmail.com account and a phone number
-- 4
SELECT name, id, email, cohort_id
FROM students
WHERE email NOT LIKE '%@gmail.com' 
AND phone IS NULL;


--A student's end date will be NULL when they are currently enrolled 
--  in Bootcamp
-- Get all of the students currently enrolled.
-- Get their name, id, and cohort_id.
-- Order them by cohort_id.
-- 5
SELECT name, id, cohort_id
FROM students
WHERE end_date IS NULL
ORDER BY cohort_id;


--Get all graduates without a linked Github account.
--Get their name, email, and phone.
-- 6
SELECT name, email, phone
FROM students
WHERE github IS NULL
AND end_date IS NOT NULL;





