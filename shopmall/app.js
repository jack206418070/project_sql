var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var dashboardRouter = require('./routes/dashboard');
var usersRouter = require('./routes/users');

const postRouter = require('./routes/post');
const idRouter = require("./routes/product");
//start
const homeRouter = require("./routes/home")
const storeRouter = require("./routes/store");
const productsRouter = require("./routes/products");
const costomerRouter = require("./routes/costomer");

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/dashboard', dashboardRouter);
app.use('/post', postRouter);
app.use('/users', usersRouter);
app.use("/1071_206418070", idRouter);
//start
app.use("/",homeRouter)
app.use("/store",storeRouter);
app.use("/products",productsRouter);
app.use("/costomer",costomerRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});

module.exports = app;