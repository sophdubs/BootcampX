SELECT sum(assignment_submissions.duration) AS total_duration
FROM students
JOIN assignment_submissions on students.id = assignment_submissions.student_id
JOIN cohorts on students.cohort_id = cohorts.id
WHERE cohorts.name = 'FEB12';