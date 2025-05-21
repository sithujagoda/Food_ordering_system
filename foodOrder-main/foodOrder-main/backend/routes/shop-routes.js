const express = require("express");
const { getAllShops } = require("../controllers/shop-controller");

const router = express.Router();

//get All the shops from the database
router.get("/get", getAllShops);

module.exports = router;
