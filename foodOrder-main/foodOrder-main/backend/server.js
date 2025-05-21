require("dotenv").config();
const express = require("express");
const { connectToDB } = require("./database/db");
const cors = require("cors");
const shopRoutes = require("./routes/shop-routes");
const foodRoutes = require("./routes/food-routes");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.use("/api/shops", shopRoutes);
app.use("/api/foods", foodRoutes);

(async () => {
  await connectToDB(); // ✅ wait for DB to connect

  app.listen(PORT, () => {
    console.log(`Server started on port ${PORT}`);
  });
})();
