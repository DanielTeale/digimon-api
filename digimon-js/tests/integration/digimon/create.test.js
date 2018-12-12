const supertest = require("supertest")
const app = require("./../../../app")
const DigimonModel = require("./../../../database/models/digimon_model")

describe("User can create new Digimon entry", () => {
  test("New entry is created in database", async () => {
    const digimonCount = await DigimonModel.count();
    const response = await supertest(app)
      .post("/digimons")
      .send({
        name: "Daniel",
        attacks: "Facesmash"
      })
      .expect(200)
    const newDigimonCount = await DigimonModel.count();

    expect(response.body.name).toEqual("Daniel")
    // expect(response.headers.location).toMatch(/^\/digimon\/.*$/)
    expect(newDigimonCount).toBe(digimonCount + 1)
  })
})