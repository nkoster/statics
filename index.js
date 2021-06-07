const express = require('express')
const app = express()
const port = 5555

app.use(express.static('public'))

app.listen(port, _ => console.log('Statics at port', port))
