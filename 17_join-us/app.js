const express = require('express')
const mysql = require('mysql')
const app = express()
const PORT = process.env.PORT || 5000

app.set('view engine', 'ejs')
app.use(express.urlencoded({ extended: true }))
app.use(express.static(`${__dirname}/public`))

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
    //return res.send(`We have ${count} users in our DB`)
    //return res.render('home', { count: count, favColour: 'blue' })
    return res.render('home', { count })
  })
})

app.post('/register', (req, res) => {
  //const query = `INSERT INTO users(email) VALUES ('${req.body.email}')`
  const person = { email: req.body.email }
  connection.query('INSERT INTO users SET ?', person, (err, result) => {
    if (err) throw err
    return res.redirect('/')
    //return res.send('Thanks for joining our wait list')
  })
  //connection.query(query, (err, results) => {
  //if (err) throw err
  //return res.redirect('/')
  //})
})

app.get('/joke', (req, res) => {
  const joke =
    '<strong>What do youll a dog that does magic tricks?</strong> <em>A labracadabrador.</em>'
  res.send(joke)
})

app.get('/random-num', (req, res) => {
  const num = Math.floor(Math.random() * 10 + 1)
  res.send(`Your lucky number is ${num}`)
})

app.listen(PORT, console.log(`Server running on http://localhost:${PORT}`))
