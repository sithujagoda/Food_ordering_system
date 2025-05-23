const express = require("express");
const { getAllShops } = require("../controllers/shop-controller");

const router = express.Router();

router.get("/get", getAllShops);

module.exports = router;
