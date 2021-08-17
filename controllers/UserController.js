const express = require('express');
const database = require('../database/database');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

const JWTsecret = "asdldskfnlsdmfklasdmflksdmnbvjhbuihregretwre";

const login = (req, res) => {
  res.render('users/login');
};

const logout = (req, res) => {
  res.render('users/login');
};

const tologin = (req, res) => {
  let { user, password } = req.body;

  database.connect(function (err) {
    database.query("SELECT CD_USUARIO, DS_LOGIN, DS_SENHA FROM usuarios WHERE DS_LOGIN = '" + user + "'", (err, user_list, fields) => {
      //res.json(user_list);
      if(bcrypt.compareSync(password, user_list[0].DS_SENHA)) {

        jwt.sign({ id: user_list[0].CD_USUARIO, login: user_list[0].DS_LOGIN }, JWTsecret, { expiresIn: '1h' }, (err, token) => {
          if(err) {
            //res.status(400);
            //res.json('Falha interna');
            res.redirect('back');
          } else {
            res.redirect('/');
          }
        });

        //res.send("Senha válida");
      } else {
        res.redirect('back');
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
  logout,
  tologin
};

