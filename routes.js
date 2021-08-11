const express = require('express');
const router = express.Router();
const IndexController = require('./controllers/IndexController');
const UserController = require('./controllers/UserController');


const multer  = require('multer');
const upload = multer({ dest: 'uploads/' });

router.get('/', IndexController.index);
router.get('/metas/qualitativas', IndexController.qualitativas);

router.post('/fileupload', upload.single('physycfile'), function (req, res, next) {
    res.send(req.body);
});

//Rotas de usuário
router.get('/login', UserController.login);
router.get('/logout', UserController.logout);

module.exports = router;

