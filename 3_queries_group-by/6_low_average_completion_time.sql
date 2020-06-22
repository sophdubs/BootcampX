SELECT students.name AS student, AVG(assignment_submissions.duration) AS average_assignment_duration, AVG(assignments.duration) AS average_estimated_duration
FROM assignment_submissions
JOIN assignments ON assignment_submissions.assignment_id = assignments.id
JOIN students ON assignment_submissions.student_id = students.id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY average_assignment_duration;