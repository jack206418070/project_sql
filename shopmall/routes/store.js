var express = require('express');
var router = express.Router();

const storeController = require('../controllers/store');

router.get('/', storeController.getstore);
router.post("/add",storeController.storeaddPost);

module.exports = router;