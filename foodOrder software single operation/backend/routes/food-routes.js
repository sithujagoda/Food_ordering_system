const express = require("express");
const { getAllFoods } = require("../controllers/food-controller");

const router = express.Router();

router.get("/get/:shopId", getAllFoods);

module.exports = router;
