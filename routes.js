const express = require('express');
const router = express.Router();
const IndexController = require('./controllers/IndexController');
const UserController = require('./controllers/UserController');

router.get('/', IndexController.index);

router.get('/metas/qualitativas', IndexController.qualitativas);

//Rotas de usuário
router.get('/login', UserController.login);

module.exports = router;

