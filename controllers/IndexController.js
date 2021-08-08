const express = require('express');
const database = require('../database/database');

const index = (req, res) => {
  database.connect(function(err) {
    database.query("SELECT * FROM setores", function (err, result, fields) {
      res.render('metasfisicas/index', {result: result});
    });
  });
};

const qualitativas = (req, res) => {
  res.render('metasqualitativas/index');
};

module.exports = {
  index,
  qualitativas
};

