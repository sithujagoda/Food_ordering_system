const { getDB } = require("../database/db");

const getAllFoods = async (req, res) => {
  try {
    const db = getDB();
    const { shopId } = req.params;

    //? -> placeHolder value
    const [results] = await db.query(
      "SELECT * FROM `FoodItem` WHERE `shopID` = ?",
      [shopId]
    );

    if (results?.length > 0) {
      res.status(200).json({
        success: true,
        data: results,
      });
    } else {
      res.status(404).json({
        success: false,
        data: `No foodItems found in the shop ${shopId}`,
      });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({
      success: false,
      data: "Something went wrong! Please try again",
    });
  }
};

module.exports = {
  getAllFoods,
};
