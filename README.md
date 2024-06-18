Overview of the Flutter App with SQLite Database

Project Description : 
  This Flutter app provides a simple and secure way for users to sign up and log in, with user details displayed on the home screen. The app uses an SQLite database to store user information, ensuring data persistence across sessions. The app focuses on user authentication (sign up and log in) and viewing user details on the home screen. Password reset functionality is intentionally excluded from this project.

#KeyFeatures

1. User Sign-Up:
  - New users can create an account by providing a username, email, and password.
  - User details are stored in the SQLite database.
  - Proper validation ensures that user inputs are valid (e.g., email format, password strength).

2. User Log-In:
  - Existing users can log in using their email and password.
  - Authentication checks if the provided credentials match any record in the database.
  - Successful login grants access to the home screen displaying user details.

3. Home Screen:
  - Displays a list of all registered users and their details (username and email).
  - Data is fetched from the SQLite database and displayed in a ListView.

4. Data Persistence:
  - Uses SQLite to persist user data locally on the device.
  - Ensures that user information remains available even after the app is closed or restarted.

#Technical Implementation

1. SQLite Database Setup:
  - A local SQLite database (userdataDB.db) is created and managed using the sqflite package.
  - A SqlHelper class handles database operations such as creating tables, inserting data, querying data, updating records, and deleting records.
  - The userdata table stores user details with fields: id (primary key), userName, email, and password.

2. User Interface:

  * Sign-Up Screen:
    - Form with fields for username, email, and password.
    - "Sign Up" button to submit the form and save data to the database.

  * Log-In Screen:
    - Form with fields for email and password.
    - "Log In" button to authenticate the user.

  * Home Screen:
    - Displays a list of all users' usernames and emails.
    - A CircularProgressIndicator shows while data is being loaded from the database.
3. State Management:
  - StatefulWidget is used to manage the state of screens.
  - setState is called to update the UI after database operations such as data retrieval or user authentication.

#User Flow
1. Sign Up:
  - User navigates to the sign-up screen.
  - Fills in the form with a username, email, and password.
  - Submits the form to create an account.
  - On successful account creation, the user may be redirected to the login screen.

2. Log In:
  - User navigates to the login screen.
  - Enters email and password to log in.
  - On successful authentication, the user is redirected to the home screen.

3. Home Screen:
  - Displays a list of all registered users.
  - User details (username and email) are shown in a scrollable list.

4. Exclusions
  - Password Reset: This feature is not included in the current scope of the project.

#Conclusion
  This Flutter app provides a foundational structure for user management with sign-up and log-in functionality, leveraging SQLite for local data storage. The clear separation of concerns between UI and data management ensures maintainability and scalability for future enhancements.
