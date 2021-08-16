const express = require('express');
const database = require('../database/database');
const jwt = require('jsonwebtoken');

const login = (req, res) => {
  res.render('users/login');
};

const logout = (req, res) => {
  res.render('users/login');
};

const tologin = (req, res) => {
  let user = req.body.user;
  let pass = req.body.password;
  res.json(user);
  /*
  var token = jwt.sign({ foo: 'bar' }, pass);
  console.log(token);
  var decoded = jwt.verify(token, pass);
  console.log(decoded);

  if(jwt.verify(token, '#wdaNew12')) {
    console.log("Senha válida");
  } else {
    console.log("Senha inválida");
  }
  */
};

module.exports = {
  login,
  logout,
  tologin
};

