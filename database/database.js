const mysql      = require('mysql');

const localhost = {
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : "metas_sta",
  multipleStatements: true
};

const sta_casa = {
  host     : '10.10.10.5',
  user     : 'root',
  password : 'controle',
  database : "db_metas_sta",
  multipleStatements: true
};

var connection = mysql.createConnection(localhost);
 
connection.connect(function(err) {
  if (err) {
    console.error('error connecting: ' + err.stack);
    return;
  }
 
  console.log('connected as id ' + connection.threadId);
});

module.exports = connection;





/*
const mysql      = require('mysql');
var con = mysql.createConnection({
  host     : '10.10.10.5',
  user     : 'root',
  password : 'controle',
  database: "metas_sta"
});

con.connect(function(err) {
  if (err) throw err;
  con.query("SELECT * FROM setores", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
});
*/
