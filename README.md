# Task Manager App

## Overview
This Flutter app serves as a task manager, empowering users to efficiently organize their tasks. It incorporates robust user authentication, seamless task management functionalities, efficient pagination, state management, local storage for persistent data, and comprehensive unit tests to ensure reliability.

## Instructions for Building and Running the App

This project is a starting point for a Flutter application. To get started:

1. Clone this repository to your local machine.
2. Ensure you have Flutter installed. If not, follow the installation instructions here.
3. Open the project directory in your preferred IDE or text editor.
4. Run flutter pub get to install dependencies.
5. Connect your device or start an emulator.
6. Run flutter run to build and launch the app on your device/emulator.

   
## Design Decisions
* Explain key design choices, such as the selection of state management pattern and local storage method.
* Justify the use of specific libraries or packages for certain functionalities.

## Challenges Faced
* Describe any hurdles encountered during the development process and how they were addressed.
* Highlight any particularly tricky aspects of implementation.

## Additional Features Implemented
* List any extra features beyond the specified requirements that were added to enhance the app's functionality or user experience.


## Additional Resources
* Flutter Documentation: Offers tutorials, samples, guidance on mobile development, and a full API reference.
* Flutter Cookbook: Provides useful Flutter samples for various tasks and scenarios.
* Flutter Codelab: Step-by-step guide to writing your first Flutter app.
* Feel free to explore these resources to enhance your understanding of Flutter development.
  
## Splash Screen
<img src="screen/Screenshot_1.png"  height="1000em">

## Login Screen
User Authentication: Secure user login via email and password using the /api/login endpoint from reqres.in.

example email: eve.holt@reqres.in 
password: Aa@12345

<img src="screen/Screenshot_2.png"  height="1000em">
<img src="screen/Screenshot_3.png"  height="1000em">


## Users Screen 
 Full CRUD functionality (Create, Read, Update, Delete) for tasks. Utilizes reqres.in endpoints such as /api/users for managing task data.
 Efficient pagination for handling a large number of tasks, leveraging the /api/users?page={page_number} endpoint.
 
<img src="screen/Screenshot_4.png"  height="1000em">
<img src="screen/Screenshot_5.png"  height="1000em">

## User Task Screen
Tasks are persisted locally using Flutter's shared preferences to ensure accessibility even when the app is closed and reopened.

<img src="screen/Screenshot_6.png"  height="700em"><img src="screen/Screenshot_8.png"  height="700em"><img src="screen/Screenshot_10.png"  height="700em">



## Add and Update Task Screen

<img src="screen/Screenshot_7.png"  height="1000em">
<img src="screen/Screenshot_11.png"  height="1000em">
