const app = require("./app");
const port = 3000;
const mongoose = require("mongoose")

mongoose.connect("mongodb://localhost/digimon", { useNewUrlParser: true });
mongoose.Promise = global.Promise;

mongoose.connection.on("error", err => console.log(err));


app.listen(port, () => console.log(`Server is running on port ${port}`));