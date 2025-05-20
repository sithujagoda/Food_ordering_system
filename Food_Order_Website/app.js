const express = require('express');
const bodyParser = require('body-parser');
const db = require('./db');
const app = express();

app.use(bodyParser.json());
app.use(express.static('.'));

app.post('/order', (req, res) => {
  const { fooditem, quantity } = req.body;
  const orderId = 'O' + Date.now(); // simple order ID generation
  const studentId = '21456'; // assume hardcoded student for now

  const insertOrder = `INSERT INTO foodorder (OrderID, OrderDate, Status, ST_ID) VALUES (?, CURDATE(), 'Pending', ?)`;
  const insertDetail = `INSERT INTO orderdetails (OrderID, FooditemID, Quantity) VALUES (?, ?, ?)`;

  db.query(insertOrder, [orderId, studentId], (err) => {
    if (err) return res.status(500).send("Error placing order.");
    db.query(insertDetail, [orderId, fooditem, quantity], (err2) => {
      if (err2) return res.status(500).send("Error adding order details.");
      res.send("✅ Order placed successfully!");
    });
  });
});

app.listen(3000, () => {
  console.log("Server running on http://localhost:3000");
});
