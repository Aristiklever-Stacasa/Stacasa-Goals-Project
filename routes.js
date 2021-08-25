const express = require('express');
const router = express.Router();
const FisicaController = require('./controllers/FisicaController');
const QualitController = require('./controllers/QualitController');
const UserController = require('./controllers/UserController');
const fs = require('fs');

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

const auth = (req, res, next) => {
  if (fs.existsSync('userdata.txt')) {
    fs.readFile('userdata.txt', 'utf8', (err, data) => {
      if (err) {
        console.error(err);
        return
      }
      var userid = data.split(',')[0].split(':')[1];
      var username = data.split(',')[1].split(':')[1];
      next();
    });
  } else {
    res.redirect('/users/login');
  }
};

router.get('/:date?', auth, FisicaController.indexFisicas);
router.get('/metas/qualitativas/:date?', auth, QualitController.indexQualit);

router.post('/insertFisicas', auth, upload.array('physycfile'), FisicaController.fisicaManagementData);
router.post('/insertQualit', auth, upload.array('physycfile'), QualitController.qualitDataManagement);

//Rotas de usuário
router.get('/users/login', UserController.login);
//Destruir sessão
router.get('/users/logout', (req, res) => {
  if (fs.existsSync('userdata.txt')) {
    fs.unlink('userdata.txt', function (err) {
      if (err) throw err;
    });
    res.redirect('/users/login');
  }
});
//Fazer login
router.post('/users/tologin', UserController.tologin);
router.get('/set/auth', (req, res) => {
  var { userid, username } = req.query;

  fs.writeFile('userdata.txt', 'userid:' + userid + ', username:' + username, function (err) {
    if (err) throw err;
    res.redirect('/');
  }); 
});

router.get('/generate/document', auth, (req, res) => {
  res.render('pdf');
});


// router.get('/get/auth', (req, res) => {
//   if (fs.existsSync('userdata.txt')) {
//     fs.readFile('userdata.txt', 'utf8', (err, data) => {
//       if (err) {
//         console.error(err);
//         return
//       }
//       var userid = data.split(',')[0].split(':')[1];
//       var username = data.split(',')[1].split(':')[1];
//       res.send(username);
//     });
//   } else {
//     // res.send('DOES NOT exist:');
//     res.redirect('/users/login');
//   }
// });

module.exports = router;

