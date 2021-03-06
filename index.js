const express = require('express');
const app = express();
const port = 3000;

const bodyParser = require('body-parser');
const ejs = require('ejs');
const path = require('path');
const routes = require('./routes');
// var session = require('express-session');

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(express.static(path.join(__dirname, 'public')));
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// app.set('trust proxy', 1); // trust first proxy
// app.use(session({
//   secret: 'keyboard cat',
//   resave: false,
//   saveUninitialized: true,
//   cookie: { secure: true }
// }));

app.use('/', routes);

/*
var test = require("crypto")
  .createHash("sha256")
  .update("#adminSuper1000")
  .digest("hex");
console.log(test);
*/

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});

//Registro de usuários
// const user = 'admin';
// const pass = '#adminSuper1000';
