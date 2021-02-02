SELECT students.name, AVG(assignment_submissions.duration) as average_assignment_duration, AVG(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON students.id = student_id
JOIN assignments ON assignment_submissions.assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY average_assignment_duration ASC;

-- SELECT students.name, AVG(assignment_submissions.duration) as average_assignment_duration, AVG(assignment.duration) as average_estimated_duration
-- FROM assignments
-- JOIN assignment_submissions ON assignments.id = assignment_id
-- JOIN students ON assignments_submissions