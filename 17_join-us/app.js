const express = require('express')
const mysql = require('mysql')
const app = express()
const PORT = process.env.PORT || 5000

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'lalo',
  password: 'password',
  database: 'join_us'
})

app.get('/', (req, res) => {
  //Find count of users in DB
  const query = 'SELECT COUNT(*) AS count FROM users'
  connection.query(query, (err, results) => {
    if (err) throw err
    //console.log(results[0])
    const count = results[0].count
    //Respond with that count
    return res.send(`We have ${count} users in our DB`)
  })
})

app.get('/joke', (req, res) => {
  const joke = 'What do youll a dog that does magic tricks? A labracadabrador.'
  res.send(joke)
})

app.get('/random-num', (req, res) => {
  const num = Math.floor(Math.random() * 10 + 1)
  res.send(`Your lucky number is ${num}`)
})

app.listen(PORT, console.log(`Server running on http://localhost:${PORT}`))
