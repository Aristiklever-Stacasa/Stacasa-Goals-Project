const express = require('express');
const database = require('../database/database');

const login = (req, res) => {
  res.render('users/login');
};

const logout = (req, res) => {
  //
};

module.exports = {
  login,
  logout
};

