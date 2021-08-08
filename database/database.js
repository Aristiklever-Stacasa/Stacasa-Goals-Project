const mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : '10.10.10.5',
  user     : 'root',
  password : 'controle',
  database: "metas_sta"
});
 
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