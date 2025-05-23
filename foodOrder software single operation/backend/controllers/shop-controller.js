const { getDB } = require("../database/db");

const getAllShops = async (req, res) => {
  try {
    const db = getDB();

    // Make sure db is initialized
    if (!db) {
      return res.status(500).json({
        success: false,
        data: "Database connection is not initialized",
      });
    }

    const [results] = await db.query("SELECT * FROM shop");

    res.status(200).json({
      success: true,
      data: results,
    });
  } catch (error) {
    console.error("Error fetching shops:", error);
    res.status(500).json({
      success: false,
      data: "Something went wrong! Please try again",
    });
  }
};

module.exports = {
  getAllShops,
};
