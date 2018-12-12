const supertest = require("supertest")
const app = require("./../../../app")
const DigimonModel = require("./../../../database/models/digimon_model")

describe("Index returns list of all digimon", () => {
  test("Returns JSON list of all digmon", async() => {
    const post = await supertest(app)
      .post("/digimons")
      .send({
        name: "Daniel",
        attacks: "big hit"
      })
    const response = await supertest(app)
      .get("/digimons")
    
    expect(await DigimonModel.find().json).toEqual(response.body.json)
  })
})
