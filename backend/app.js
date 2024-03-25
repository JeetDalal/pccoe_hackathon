const express = require('express')
const authController = require('./routers/auth/auth.router.js')
// const predictRouter = require('./routers/predict/predict.router.js')

const app = express()

app.use(express.json())

app.use('/auth',authController)
// app.use('/model',predictRouter)
module.exports = app;