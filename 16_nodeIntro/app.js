const faker = require('faker');
const mysql = require('mysql');

// credentials for gorm
const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  database : 'join_us'
});

// selecting data
// let q = 'SELECT 1 + 1 AS solution';
// let q = 'SELECT CURDATE()';
// let q = 'SELECT CURTIME() AS time, CURDATE() as date, NOW() AS now';
// let q = 'SELECT * FROM users';
// let q = 'SELECT COUNT(*) AS total FROM users';

// connection.query(q, function(err, results, fields){
//   if(err){
//     throw err;
//   }
//   console.log(results[0].total);

  // console.log('The solution is: ', results[0].solution);
  // console.log(results);//returns all the object
  // console.log(results[0].time);
  // console.log(results[0].date);
  // console.log(results[0].now);
// });

// inserting data
// let person = {email:faker.internet.email};
// let q = `INSERT INTO users (email) VALUES ("${email}")`;

// connection.query('INSERT INTO users SET ?', person, function(err, results, fileds){
//   if(err){
//     throw err;
//   }

//   console.log(results)
// });

// insert data take 2
// let person = {
//   email:'Jenny 456@gmail.com',
// };
// let person = {
//   email: faker.internet.email(),
//   created_at: faker.date.past()
// };

// let end_result = connection.query('INSERT INTO users SET ?', person, function(err, result){
//   if(err) throw err;
//   console.log(result);
// });

// console.log(end_result);


// this date format doesn`t work:
// 2019-07-29T14:10:05.449Z
// the library makes it work

// bulk insert
let data = [];
for (let i = 0; i < 500; i++) {
  data.push([
    faker.internet.email(),
    faker.date.past()
  ]);
}
console.log(data);

let q = 'INSERT INTO users (email, created_at) VALUES ?';

connection.query(q, [data], function(err, result){
  if(err){
    console.log(err);
    throw err;
  }
  console.log(result);
});

connection.end();

// excercises
