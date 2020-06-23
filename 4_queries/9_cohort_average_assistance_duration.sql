SELECT AVG(sub.total_duration) AS average_total_duration
FROM (SELECT cohorts.name AS cohort, SUM(assistance_requests.completed_at - assistance_requests.started_at) AS total_duration
  FROM students
    JOIN cohorts ON students.cohort_id = cohorts.id
    JOIN assistance_requests ON students.id = assistance_requests.student_id
  GROUP BY cohorts.name) AS sub;
