# Complaint Management System (CMS) - JSP Based

## Project Overview

This project is a Web-Based Complaint Management System (CMS) built using JSP, Jakarta EE, and MySQL. It is developed as part of the IJSE Graduate Diploma in Software Engineering (GDSE) Individual Assignment. The system is designed for internal employees and administrative staff to submit, track, and resolve complaints. All backend interactions are handled through synchronous HTML form submissions using standard GET and POST methods, strictly without AJAX.

## Technologies Used

Frontend: JSP, HTML, CSS, JavaScript (for validation only)  
Backend: Jakarta EE (Servlets), Apache Commons DBCP  
Database: MySQL (via DBCP connection pooling)  
Deployment: Apache Tomcat (local environment)

## System Features

**Authentication Module**

- User login with session handling
- Role-based access: Employee and Admin

**Complaint Management**

For Employees:
- Submit new complaints
- View submitted complaints
- Edit or delete complaints (if not resolved)

For Admins:
- View all complaints
- Update complaint status and add remarks
- Delete any complaint

## Architecture

The project is structured using the Model-View-Controller (MVC) pattern.

- JSP files are used for the View
- Servlets handle the Controller logic
- JavaBeans and DAO classes serve as the Model

All read operations use HTTP GET and all write/update/delete operations use HTTP POST via HTML forms. No asynchronous technologies like AJAX or fetch are used.

## Setup Instructions

1. Clone the repository:
git clone :https://github.com/NandikaKW/ComplaintManagementSystem_Maven.git


2. Import the project into your preferred IDE (such as IntelliJ IDEA or Eclipse) as a Maven project.

3. Create a MySQL database named `complaint_db`.

4. Run the SQL scripts provided in the `db` folder to set up the database schema and sample data.

5. Update the database configuration in your project (e.g., `DBConnection.java`) with your local MySQL credentials.

6. Build the project and deploy the WAR file to your local Apache Tomcat server.



## Directory Structure

The project source is organized into:

- `controller`: contains Servlets
- `model`: contains JavaBeans and utility classes
- `dao`: contains data access logic
- `views`: contains JSP files
- `resources`: contains database scripts and configuration

## Demonstration

A technical demonstration video of the system showcasing login, complaint submission, admin management, and more has been submitted separately as required.

## Author

Developed by :Nandika Kaweesha Fernando  
Student ID: 241711041
IJSE GDSE - Advanced API Development (Individual Assignment)

