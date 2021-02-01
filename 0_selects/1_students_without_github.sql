SELECT id, name, email, cohort_id
FROM students
WHERE github is NULL or github = ''
ORDER BY cohort_id;