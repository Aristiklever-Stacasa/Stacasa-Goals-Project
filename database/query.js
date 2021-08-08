const database = require('./database');

setores = database.connect(function(err) {
  //if (err) throw err;
  database.query("SELECT * FROM setores", function (err, result, fields) {
    //if (err) throw err;
    //res.send(result);
    return result;
  });
});

module.exports = setores;
