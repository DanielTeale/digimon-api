const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const DigimonSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  attacks: {
    type: String,
    required: true
  },
});


module.exports = DigimonSchema;