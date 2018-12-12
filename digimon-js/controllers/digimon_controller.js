const DigimonModel = require("./../database/models/digimon_model");

async function create(req, res) {
  //logic for creating a resource
  let { name, attacks } = req.body;
  let digimon = await DigimonModel.create({ name, attacks })
    .catch(err => res.status(500).send(err));

  res.json(digimon);
}

async function index(req, res) {
  //showed a list of all the resources
  let digimons = await DigimonModel.find()
    .catch(err => res.status(500).send(err))
  res.json(digimons);
}

async function destroy(req, res) {
  //deletes the resource
  let { id } = req.params;
  await DigimonModel.findByIdAndRemove(id);
  res.json(req.body);
}

async function show(req, res) {
  //show a single resource
  let { id } = req.params;

  let digimon = await DigimonModel.findById(id).populate('digimon');

  res.render("digimon/show", { digimon });
}

async function update(req, res) {
  //updates the resource
  let { name, attacks } = req.body;
  let { id } = req.params;

  await DigimonModel.findByIdAndUpdate(id, { name, attacks });
  res.json(req.body);
}

module.exports = {
  create,
  index,
  destroy,
  show,
  update
}