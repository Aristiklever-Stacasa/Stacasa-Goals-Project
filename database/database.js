const mysql = require('mysql');

const localhost = {
<<<<<<< HEAD
  host: 'localhost',
  user: 'root',
  password: '',
  database: "db_metas_sta",
=======
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : "db_metas_sta",
>>>>>>> 8e7365f292e8f399aeb393b51826439b9ab343bc
  multipleStatements: true
};

const sta_casa = {
<<<<<<< HEAD
  host: '10.10.10.5',
  user: 'root',
  password: 'controle',
  database: "db_metas_sta",
=======
  host     : '10.10.10.5',
  user     : 'root',
  password : 'controle',
  database : "db_metas_sta",
>>>>>>> 8e7365f292e8f399aeb393b51826439b9ab343bc
  multipleStatements: true
};

var connection = mysql.createConnection(sta_casa);

connection.connect(function (err) {
  if (err) {
    console.error('error connecting: ' + err.stack);
    return;
  }

  console.log('connected as id ' + connection.threadId);
});

module.exports = connection;
