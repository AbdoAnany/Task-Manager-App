# Task Manager App

## Overview
This Flutter app serves as a task manager, empowering users to efficiently organize their tasks. It incorporates robust user authentication, seamless task management functionalities, efficient pagination, state management, local storage for persistent data, and comprehensive unit tests to ensure reliability.

## Instructions for Building and Running the App

This project is a starting point for a Flutter application. To get started:

1. Clone this repository git clone https://github.com/AbdoAnany/Task-Manager-App.git .
2. Ensure you have Flutter installed. If not, follow the installation instructions here.
3. Open the project directory in your preferred IDE or text editor.
4. Run flutter pub get to install dependencies.
5. Connect your device or start an emulator.
6. Run flutter run to build and launch the app on your device/emulator.

   
## Design Decisions

Design Decisions
* flutter_screenutil: Utilizing the flutter_screenutil package for responsive UI design was a deliberate choice. By using flutter_screenutil, the application can dynamically adjust its layout based on the screen size and resolution of the device. This ensures a consistent and visually appealing user experience across various devices, including smartphones and tablets.

* iconsax: The decision to use the iconsax icon library was made to enhance the visual aesthetics of the application. iconsax offers a wide range of modern and stylish icons that can be seamlessly integrated into the user interface. Leveraging this icon library helps in creating a visually appealing and cohesive design language throughout the application.

* table_calendar: Integrating the table_calendar package provides a robust solution for implementing a calendar view within the application. The table_calendar package offers customizable calendar widgets with features such as event highlighting, date selection, and month switching. By incorporating table_calendar, the application can effectively display and manage tasks or events in a calendar format, improving user productivity and organization.



## Additional Features Implemented

1. **cached_network_image**: A Flutter package to load and cache network images efficiently.
2. **table_calendar**: A Flutter package to create customizable calendar widgets.
3. **flutter_svg**: A Flutter package to render SVG (Scalable Vector Graphics) images.
4. **freezed_annotation**: A Dart package used for code generation, primarily for immutable data models.
5. **get_it**: A service locator package for Dart and Flutter projects, facilitating dependency injection.
6. **json_serializable**: A Dart package for generating code to serialize/deserialize JSON data.
7. **easy_localization**: A Flutter package for easy internationalization (i18n) and localization of app content.
8. **mockito**: A Dart package for creating mock objects for testing.

  
## Logo
 <img src="https://github.com/AbdoAnany/Task-Manager-App/assets/60886012/7b459c59-80de-472b-a40d-198e1e87d45d"  height="200em"> 

## Splash Screen && Login Screen
User Authentication: Secure user login via email and password using the /api/login endpoint from reqres.in.

example email: eve.holt@reqres.in 
password: Aa@12345

<img src="screen/Screenshot_1.png"  height="700em">   <img src="screen/Screenshot_2.png"  height="700em">    <img src="screen/Screenshot_3.png"  height="700em">



## Users Screen 
 Full CRUD functionality (Create, Read, Update, Delete) for tasks. Utilizes reqres.in endpoints such as /api/users for managing task data.
 Efficient pagination for handling a large number of tasks, leveraging the /api/users?page={page_number} endpoint.
 
<img src="screen/Screenshot_4.png"  height="1000em">  <img src="screen/Screenshot_5.png"  height="1000em">


## User Task Screen
Tasks are persisted locally using Flutter's shared preferences to ensure accessibility even when the app is closed and reopened.

<img src="screen/Screenshot_6.png"  height="1000em">   <img src="screen/Screenshot_8.png"  height="1000em">  <img src="screen/Screenshot_10.png"  height="1000em">



## Add and Update Task Screen

<img src="screen/Screenshot_7.png"  height="1000em">  <img src="screen/Screenshot_11.png"  height="1000em">

