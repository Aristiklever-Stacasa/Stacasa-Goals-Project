const express = require('express');
const router = express.Router();
const IndexController = require('./controllers/IndexController');
const UserController = require('./controllers/UserController');

const multer = require('multer');

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/')
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9)
    cb(null, file.originalname)
  }
})

const upload = multer({ storage });

router.get('/', IndexController.fisicas);
router.get('/metas/qualitativas', IndexController.qualitativas);

router.post('/insertFisicas', upload.array('physycfile'), IndexController.fisicDataInsert);
router.post('/insertQualit', upload.array('physycfile'), IndexController.qualitDataInsert);

//Rotas de usuário
router.get('/login', UserController.login);
router.get('/logout', UserController.logout);
router.post('/tologin', UserController.tologin);

module.exports = router;

