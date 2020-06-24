const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT distinct teachers.name AS teacher, cohorts.name AS cohort
FROM assistance_requests
  JOIN students ON students.id = assistance_requests.student_id
  JOIN teachers ON teachers.id = assistance_requests.teacher_id
  JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE '${process.argv[2] || 'JUL02'}'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
`)
  .then(res => {
    res.rows.forEach(row => {
      console.log(`${row.cohort}: ${row.teacher}`);
    });
  })
  .catch(err => console.error('query error', err.stack));