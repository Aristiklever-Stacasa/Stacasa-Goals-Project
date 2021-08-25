const express = require('express');

const auth = (req, res, next) => {
  if(req.session.user == undefined) {
    console.log(req.session.user);
    res.redirect('/users/login');
  }
  next();
}

module.exports = auth;