const mysql = require('mysql');

const localhost = {
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : "db_metas_sta",
  multipleStatements: true
};

const sta_casa = {
  host     : '10.10.10.5',
  user     : 'root',
  password : 'controle',
  database : "db_metas_sta",
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
