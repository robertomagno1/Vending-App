
require("dotenv").config();

const express = require("express");
const cors = require("cors");
const { Pool } = require("pg");

// Configurazione del database
const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

const app = express();
app.use(cors());
app.use(express.json());

// Test API
app.get("/", (req, res) => {
  res.send("API is running...");
});
const paymentRoutes = require("./routes/payment");
const notificationRoutes = require("./routes/notifications");

// updeted for notifications
app.use("/api/payment", paymentRoutes);
app.use("/api/notifications", notificationRoutes);

// Avvio del server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

