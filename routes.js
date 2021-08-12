const express = require('express');
const router = express.Router();
const IndexController = require('./controllers/IndexController');
const UserController = require('./controllers/UserController');

const multer  = require('multer');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, 'uploads/')
    },
    filename: function (req, file, cb) {
      console.log(file);
      const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9)
      cb(null, file.fieldname + '-' + uniqueSuffix)
    }
  })

const upload = multer({ storage });
  
router.get('/', IndexController.fisicas);
router.get('/metas/qualitativas', IndexController.qualitativas);

router.post('/fileupload', upload.single('physycfile'), IndexController.file);

//Rotas de usuário
router.get('/login', UserController.login);
router.get('/logout', UserController.logout);

module.exports = router;

