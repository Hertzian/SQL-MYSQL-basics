const faker = require('faker');
const mysql = require('mysql');

// credentials for gorm
const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  database : 'join_us'
});

// let q = 'SELECT 1 + 1 AS solution';
// let q = 'SELECT CURDATE()';
let q = 'SELECT CURTIME() AS time, CURDATE() as date, NOW() AS now';

connection.query(q, function(err, results, fields){
    if(err){
        throw err;
    }

    // console.log('The solution is: ', results[0].solution);
    // console.log(results);//returns all the object
    console.log(results[0].time);
    console.log(results[0].date);
    console.log(results[0].now);
});

connection.end();