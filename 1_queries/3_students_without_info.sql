SELECT name, id, cohort_id 
FROM students
WHERE (email IS null OR email='') or (phone IS null OR phone='');
