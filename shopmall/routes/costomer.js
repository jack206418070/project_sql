var express = require('express');
var router = express.Router();

const costomerController = require('../controllers/costomer');

router.get('/', costomerController.getcostomer);
router.post("/add",costomerController.costomeraddPost);

module.exports = router;