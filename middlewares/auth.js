const express = require('express');

const auth = (req, res, next) => {
  const authToken = req.headers['authorization'];
  console.log(authToken);
  if(authToken != undefined) {
    res.redirect('/');
  } else {
    res.redirect('/login');
  }
  next();
}

module.exports = auth;