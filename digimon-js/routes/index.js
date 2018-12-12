const express = require("express");
const router = express.Router();
const DigimonController = require('./../controllers/digimon_controller');
// const {validateCreate} = require("./../middleware/validation/digimon_validation_middleware")
const { celebrate, Joi } = require("celebrate");

router.get("/", (req, res) => res.send("Welcome"));

router.get("/digimons", DigimonController.index);

router.post("/digimons", DigimonController.create);

router.get("/digimons/:id", DigimonController.show);

router.patch("/digimons/:id", DigimonController.update);

router.put("/digimons/:id", DigimonController.update);

router.delete("/digimons/:id", DigimonController.destroy)

module.exports = router;