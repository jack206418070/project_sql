var express = require('express');
var router = express.Router();

const productsController = require('../controllers/products');

router.get('/', productsController.getproducts);
router.post('/add', productsController.productsAddPost);

module.exports = router;