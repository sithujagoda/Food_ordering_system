const { getDB } = require("../database/db");

const getAllShops = async (req, res) => {
  try {
    const db = getDB();

    const [results] = await db.query("SELECT * FROM `Shop`");

    res.status(200).json({
      success: true,
      data: results,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      success: false,
      data: "Something went wrong! Please try again",
    });
  }
};

module.exports = {
  getAllShops,
};
