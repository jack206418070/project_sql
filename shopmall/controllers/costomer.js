const costomer = require('../models/costomer');


/* READ *****************************/

exports.getcostomer = (req, res, next) => {
    costomer.fetchAll()
        .then(([rows]) => {

            console.log(JSON.stringify(rows));
            // res.send(JSON.stringify(rows));
            res.render('costomer', {
                data: rows,
                title: 'costomer List',
            });
        })
        .catch(err => console.log(err));
};

exports.costomeraddPost = (req, res, next) => {

    costomer.add(req, res)
        .then(([rows]) => {
            res.redirect('/');
        })
        .catch(err => console.log(err));
};