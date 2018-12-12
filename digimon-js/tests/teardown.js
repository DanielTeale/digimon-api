module.exports = async() => {
  await DigimonModel.deleteMany({})
  mongoose.connection.close();
}