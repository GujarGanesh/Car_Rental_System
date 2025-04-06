# 🚗 Car Rental System

A web-based **Car Rental System** project built using **HTML, CSS, JavaScript, PHP**, and **MySQL**. This system allows customers to book vehicles and enables rental agencies (clients) to manage their car fleet, drivers, and bookings efficiently.

---

## 📋 Table of Contents

- [✨ Features](#-features)
- [🛠 Technologies Used](#-technologies-used)
- [🧱 Database Design](#-database-design)
- [📁 File Structure](#-file-structure)
- [🚀 Installation & Setup](#-installation--setup)
- [▶️ How to Run the Project](#️-how-to-run-the-project)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)

---

## ✨ Features

### 👥 User Panel
- Customer registration and login
- Client (Agency) registration and login
- Session-based authentication for users

### 🧾 Car Booking & Management
- View available cars
- Book cars (with/without drivers)
- Manage past and current bookings
- Print bill & payment processing
- Submit rental feedback

### 🧑‍💼 Admin/Client Panel
- Add/update/delete car details
- Add drivers to cars
- View and manage bookings
- Access and analyze customer feedback

---

## 🛠 Technologies Used

| Layer       | Technology              |
|-------------|--------------------------|
| **Frontend** | HTML, CSS, JavaScript    |
| **Backend**  | PHP                      |
| **Database** | MySQL                    |
| **Web Server** | Apache (via XAMPP/WAMP) |

---

## 🧱 Database Design

The system uses a normalized MySQL database with the following tables:

- `customers` – Customer information
- `clients` – Rental agency info
- `cars` – Car details (model, rate, availability)
- `drivers` – Driver records linked to cars
- `bookings` – Booking records with references to cars and users
- `feedback` – Customer feedback
- `payments` – Booking payment info

**Database is normalized up to 3NF** with:
- Primary and Foreign Keys
- NOT NULL and CHECK Constraints

---

## 📁 File Structure

```plaintext
Car_Rental_System/
├── DATABASE FILE/
├── assets/
├── faq/
├── feedback/
├── images/
├── action_page.php
├── booking.php
├── bookingconfirm.php
├── client_registered_success.php
├── clientlogin.php
├── clientsignup.php
├── clientview.php
├── connection.php
├── customer_registered_success.php
├── customerlogin.php
├── customersignup.php
├── entercar.php
├── entercar1.php
├── enterdriver.php
├── enterdriver1.php
├── feedback.php
├── index.php
├── insert_data.php
├── login_client.php
├── login_customer.php
├── logout.php
├── mybookings.php
├── payment.php
├── payment2.php
├── prereturncar.php
├── printbill.php
├── printbill1.php
├── returncar.php
├── session_client.php
├── session_customer.php
```
