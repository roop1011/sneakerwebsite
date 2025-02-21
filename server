const express = require("express");
const mysql = require("mysql");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "Sunitha@02", // Change as per your MySQL credentials
    database: "sneaker_store"
});

db.connect(err => {
    if (err) {
        console.error("Database connection failed: " + err.stack);
        return;
    }
    console.log("Connected to database");
});

app.get("/products", (req, res) => {
    db.query("SELECT * FROM products", (err, result) => {
        if (err) {
            return res.status(500).json({ error: err });
        }
        res.json(result);
    });
});

app.post("/purchase", (req, res) => {
    const { customer_name, phone, address, product_id } = req.body;
    const query = "INSERT INTO orders (customer_name, phone, address, product_id) VALUES (?, ?, ?, ?)";
    db.query(query, [customer_name, phone, address, product_id], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err });
        }
        res.json({ message: "Order placed successfully", orderId: result.insertId });
    });
});

const PORT = 5000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
