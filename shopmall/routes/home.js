var express = require('express');
var router = express.Router();

const homeController = require('../controllers/home');

router.get('/', homeController.gethome);


module.exports = router;