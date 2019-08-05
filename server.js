var express = require('express');
var cookieParser = require('cookie-parser');
var os = require('os');
var hostname = os.hostname();

var app = express();
app.use(cookieParser());

app.get('/', function (req, res) {
    var out = {
        host: hostname,
        cookies: req.cookies,
        customerNamespace: process.env.POD_NAMESPACE || 'local',
        podIP: process.env.POD_IP || 'localIP'
    };

    res.status(200).json(out);
});

app.listen(8080);