const express = require('express');
const database = require('../database/database');

const login = (req, res) => {
  res.render('users/login', { get: req.query.access });
};

const tologin = (req, res) => {
  let { user, password } = req.body;

  database.connect(function (err) {
    database.query("SELECT CD_USUARIO, DS_LOGIN, DS_SENHA FROM usuarios WHERE DS_LOGIN = '" + user + "'", (err, user_list, fields) => {
      if(user_list != '') {

        var cryptpass = require("crypto")
        .createHash("sha256")
        .update(req.body.password)
        .digest("hex");

        if( cryptpass == user_list[0].DS_SENHA ) {
          //user_list[0].CD_USUARIO user_list[0].DS_LOGIN }
          res.redirect('/set/auth?userid=' + user_list[0].CD_USUARIO + '&username=' + user_list[0].DS_LOGIN);
        } else {
          res.redirect('/users/login?access=false');
        }

      } else {
        res.redirect('/users/login?access=false');
      }
      
    });
  });

  /*res.json(password);
  var token = jwt.sign({ foo: 'bar' }, password);
  console.log(token);
  var decoded = jwt.verify(token, pass);
  console.log(decoded);

  if(jwt.verify(token, '#wdaNew12')) {
    console.log("Senha válida");
  } else {
    console.log("Senha inválida");
  }*/
  
};

module.exports = {
  login,
  tologin
};

