const express = require("express");
const morgan = require("morgan")
const app = express();
const {HTTPError} = require("./middleware/errors/http_error")

app.use(express.urlencoded({extended: true}));
app.use(express.json());

app.use(morgan("combined"))

app.use((err, req, res, next) => {
  console.log(req.body)
  next(err);
})

app.use(require("./routes"));

app.use(express.static("./public"));

app.use((err, req, res, next) => {
  switch (err.name) {
    case "HTTPError":
      return res.status(err.statusCode).send(err.message);
      break;
  }
  next(err);
})

module.exports = app;