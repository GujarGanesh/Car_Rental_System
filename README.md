﻿# Car_Rental_System
The Car Rental System is a web-based application designed to facilitate the process of renting cars. It provides functionalities for both customers and clients (car rental agencies) to manage their interactions efficiently.

Features
For Customers
User Registration and Authentication: Customers can sign up and log in to their accounts to access the system's features.​

Car Booking: Browse available cars and make bookings based on preferences.​

Booking Management: View and manage current and past bookings.​

Payment Processing: Securely process payments for car rentals.​

Feedback Submission: Provide feedback regarding the rental experience.​

For Clients (Car Rental Agencies)
Client Registration and Authentication: Agencies can register and log in to manage their fleet and bookings.​

Car Management: Add, update, and remove cars from the system.​

Driver Management: Manage driver information associated with the cars.​

Booking Management: View and manage bookings made by customers.​

Feedback Review: Access feedback provided by customers to improve services.​

File Structure
index.php: The main landing page of the application.​

customerlogin.php: Customer login page.​

customersignup.php: Customer registration page.​

clientlogin.php: Client (agency) login page.​

clientsignup.php: Client registration page.​

booking.php: Page where customers can book cars.​

mybookings.php: Customers can view their bookings.​

entercar.php: Clients can add new cars to the system.​

enterdriver.php: Clients can add driver details.​

feedback.php: Page for customers to submit feedback.​

connection.php: Handles database connections.​

logout.php: Ends user sessions and logs them out.​

Database
The system uses a MySQL database to store information about users, cars, bookings, and feedback. The database schema includes tables for:​

Users: Stores customer and client information.​

Cars: Details of cars available for rent.​

Drivers: Information about drivers associated with the cars.​

Bookings: Records of car bookings made by customers.​

Feedback: Customer feedback on their rental experience.​

Setup Instructions
Clone the Repository:

bash
Copy
Edit
git clone https://github.com/GujarGanesh/Car_Rental_System.git
Database Configuration:

Import the provided database file (DATABASE FILE) into your MySQL server.​

Update the connection.php file with your database credentials.​

Run the Application:

Deploy the project files on a local or remote server with PHP and MySQL support.​

Access the application through the server's URL.​

Technologies Used
Frontend: HTML, CSS, JavaScript​

Backend: PHP​

Database: MySQL​

Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your enhancements.
