SELECT cohorts.name as name, AVG(assistance_requests.completed_at - assistance_requests.started_at) AS average_assistance_time
FROM students
  JOIN cohorts ON students.cohort_id = cohorts.id
  JOIN assistance_requests on students.id = assistance_requests.student_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;
