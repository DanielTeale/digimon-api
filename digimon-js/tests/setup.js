module.exports = () => {
  const mongoose = require("mongoose")

  mongoose.connect("mongodb://localhost/digimon_test", { useNewUrlParser: true });
  mongoose.Promise = global.Promise;

  mongoose.connection.on("error", err => console.log(err));
};
