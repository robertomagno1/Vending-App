const express = require("express");
const admin = require("firebase-admin");
const router = express.Router();

const serviceAccount = require("../firebase-service-account.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

router.post("/send", async (req, res) => {
  const { token, title, body } = req.body;

  try {
    const message = {
      token,
      notification: {
        title,
        body,
      },
    };

    await admin.messaging().send(message);
    res.json({ success: true, message: "Notifica inviata" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
