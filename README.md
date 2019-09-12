# movies_review_app

A simple application which allows user to see the reviews of the movie. 

# Clean Coding Architecture

Primary focus of this project is to help you understand how to write clean, non-cluttered, maintainable and scalable code.
The approach followed is test driven approach. Learn more on flutter automated tests https://flutter.dev/docs/testing 
The architecture constitues of following layers
  ### Presentation Layer
  This layer contains all the UI code. UI code should be independent of the buisness logic of the application.It gives us the flexibility   of changing the UI if needed, without altering the business logic.
  ### Domain Layer
  Domain layer is the layer where all the buisness logic goes on and again its independent of data and presentation layer.
  Domain layer has dependency on data layer to get the data from. And it can be acheived by the different design patterns which i will be 
  making a dedicated project on.
  ### Data Layer
  Data layer is responsible for interfacing the application to other systems -i.e. Remote apis, Local storage, etc
  


## Getting Started

A few resources to get you started if you are new to Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
