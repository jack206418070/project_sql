const store = require('../models/store');


/* READ *****************************/

exports.storeaddPost = (req, res, next) => {

    store.add(req, res)
        .then(([rows]) => {
            res.redirect('/store');
        })
        .catch(err => console.log(err));
};


exports.getstore = (req, res, next) => {
    store.fetchAll()
        .then(([rows]) => {

            console.log(JSON.stringify(rows));
            // res.send(JSON.stringify(rows));
            res.render('store', {
                data: rows,
                title: 'store List',
            });
        })
        .catch(err => console.log(err));
};

