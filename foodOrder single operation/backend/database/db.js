const mysql = require("mysql2/promise");

let foodOrderDB;

const connectToDB = async () => {
  try {
    foodOrderDB = await mysql.createConnection({
      host: "localhost",
      user: "root",
      password: "root",
      database: "food_order", 
    });
    console.log(" MySQL connected successfully!");
  } catch (error) {
    console.log(" MySQL connection failed:", error.message);
  }
};

const getDB = () => foodOrderDB;

module.exports = { connectToDB, getDB };
