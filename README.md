# 🏪 Vending App - Real-Time Vending Machine Inventory 📍

## 📌 Overview
Vending App is a Flutter-based mobile application that allows users to find vending machines near them and check the availability of products in real-time. It integrates **WebSockets**, **Stripe for payments**, **Google Maps API**, and **Firebase for push notifications**.

---

## 🚀 Features
- 🔍 **Locate nearby vending machines** using Google Maps API.
- 📦 **View available products** in vending machines in real-time via WebSocket.
- 💳 **Make purchases online** via Stripe integration.
- 🔔 **Receive push notifications** when favorite products are available.

Sure! Let’s simplify it and see if it displays correctly for you. Here’s a minimal version of your project structure:



vending-app/
├── backend/
│   ├── routes/
│   │   ├── auth.js
│   │   ├── vending.js
│   │   ├── payment.js
│   │   ├── notifications.js
│   ├── models/
│   │   ├── userModel.js
│   │   ├── vendingMachineModel.js
│   │   ├── productModel.js
│   ├── config/
│   │   ├── db.js
│   ├── server.js
│   ├── database.sql
│
├── mobile/
│   ├── lib/
│   │   ├── models/
│   │   ├── services/
│   │   ├── screens/
│   │   ├── widgets/
│   │   ├── main.dart
│
├── firebase/
│   ├── google-services.json
│   ├── GoogleService-Info.plist
│
├── README.md
├── .env
├── .gitignore
├── LICENSE



This keeps only the essential structure while using proper Markdown formatting.

Next Steps
	•	Copy this into your README.md
	•	Ensure you use triple backticks (```) at the start and end
	•	Try committing and checking it on GitHub

Let me know if it still doesn’t display correctly! 🚀


---


## 📦 Backend Setup (Node.js & Express)

### 🔹 Prerequisites
- Install **Node.js** and **PostgreSQL**.
- Set up a **Firebase** project.
- Create a `.env` file in the `backend/` folder:

PORT=5000
DB_USER=postgres
DB_PASSWORD=yourpassword
DB_HOST=localhost
DB_PORT=5432
DB_NAME=vending_db
JWT_SECRET=supersecuresecret
STRIPE_SECRET_KEY=sk_test_xxx
GOOGLE_MAPS_API_KEY=xxx

### 🔹 Install Dependencies
```sh
cd backend
npm install

🔹 Start the Server

node server.js

📱 Mobile Setup (Flutter)

🔹 Install Flutter Dependencies

cd mobile
flutter pub get

🔹 Run the App

For Android:

flutter run

For iOS:

flutter build ios --release

🔗 API Endpoints

Authentication

Method	Endpoint	Description
POST	/api/auth/register	Register a new user
POST	/api/auth/login	User login and token generation

Vending Machines

Method	Endpoint	Description
GET	/api/vending	Get all vending machines
GET	/api/vending/:id/products	Get products for a vending machine
GET	/api/vending/nearby?lat=xx&lon=yy&radius=5	Find vending machines near a location

Payments

Method	Endpoint	Description
POST	/api/payment/create-payment-intent	Initiate a Stripe payment

Notifications

Method	Endpoint	Description
POST	/api/notifications/send	Send a push notification

🛠️ Features to be Added
	•	📊 Admin Dashboard for monitoring vending machine stock.
	•	🚀 Machine Learning Predictions for product demand analysis.
	•	🛒 Subscription Model for vending product refills.

📜 License

This project is licensed under the MIT License.

🤝 Contribution

Want to contribute? Fork the repo and submit a pull request!

git clone https://github.com/robertomagno1/Vending-App.git
cd vending-app

📞 Contact
	•	Developer: [Roberto Magno Mazzotta]
	•	Email: robertomagnomazzotta@gmail.com
	•	GitHub: github.com/robertomagno1

🚀 Happy coding!

---

This `README.md` provides:
✅ **Project structure**  
✅ **Installation & setup instructions**  
✅ **API documentation**  
✅ **Future improvements**  

