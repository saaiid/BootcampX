/* SELECT * 
FROM students 
WHERE github IS NULL; */   -- we can use also this command and the one  below


SELECT id, name, email, cohort_id
FROM students
WHERE github IS NULL
ORDER BY cohort_id 

