const stores = require("../models/store");
const products = require("../models/products");
const costomer = require("../models/costomer");


exports.gethome = async (req, res, next) => {
    let store;
    let storeCount;
    let productsCount;
    let costomerCount;

    try {
        const getStores = await stores.fetchAll()
            .then(([rows]) => {
                store = rows;
            })

        const getStoreCount = await stores.getCount()
            .then(([rows]) => {
                storeCount = rows[0].count;
            })


        const getProductsCount = await products.getCount()
            .then(([rows]) => {
                productsCount = rows[0].count;
            })

        const getCostomerCount = await costomer.getCount()
            .then(([rows]) => {
                costomerCount = rows[0].count;
            })

        let data = {
            store : store,
            storeCount: storeCount,
            productsCount: productsCount,
            costomerCount: costomerCount
        }

        console.log(JSON.stringify(data));
        //res.send(JSON.stringify(data));

        res.render('home', {
            title: 'home',
            color: 'btn-primary',
            icon: 'fa-cog',
            store: store,
            storeCount: storeCount,
            productsCount: productsCount,
            costomerCount: costomerCount
        });

    } catch (err) {
        console.log(err);
    };

};