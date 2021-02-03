const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: 'Vagrant1!',
  host: 'localhost',
  port: 5432,
  database: 'bootcampx'
});



pool.query(`
  SELECT students.id, students.name, cohorts.name as cohort_name
  FROM students
  JOIN cohorts ON students.cohort_id = cohorts.id
  WHERE cohorts.name LIKE '%${process.argv[2]}%'
  LIMIT ${process.argv[3]};
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
  })
})
.catch(err => console.error('query error', err.stack));