const products = require('../models/products');


/* READ *****************************/

exports.getproducts = (req, res, next) => {
    products.fetchAll()
        .then(([rows]) => {

            console.log(JSON.stringify(rows));
            // res.send(JSON.stringify(rows));
            res.render('products', {
                data: rows,
                title: 'products List',
            });
        })
        .catch(err => console.log(err));
};

exports.productsAddPost = (req, res, next) => {

    products.add(req, res)
        .then(([rows]) => {
            res.redirect('/products');
        })
        .catch(err => console.log(err));
};
