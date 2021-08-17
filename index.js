const express = require('express');
const app = express();
const port = 3000;
const bodyParser = require('body-parser');
const ejs = require('ejs');
const path = require('path');
const routes = require('./routes');
const bcrypt = require('bcrypt');

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(express.static(path.join(__dirname, 'public')));
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

//Registro de usuários
/*
const user = 'root';
const pass = '#adminSuper1000';
const hash = bcrypt.hashSync(pass, 10);
console.log(hash);
*/

app.use('/', routes);

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});