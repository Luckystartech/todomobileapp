# TodoApp Mobile Application

## Overview

TodoApp is a mobile application developed using Flutter, designed to help users manage their daily tasks efficiently. The app leverages Riverpod for state management and Firebase Firestore as the backend to store and sync user data seamlessly across devices.

## Features

- **Task Management**: Add, edit, delete, and mark tasks as complete.
- **Real-time Sync**: Tasks are synced in real-time across all user devices using Firebase Firestore.
- **State Management**: State management with Riverpod.
- **User Authentication**: Sign-in Users Anonymously.

## Technologies Used

- **Flutter**: For building the cross-platform mobile application.
- **Riverpod**: For state management.
- **Firebase Firestore**: For backend database.
- **Firebase Authentication**: For user authentication.

## Installation

1. **Clone the repository**:
    ```bash
    git clone https://github.com/yourusername/todoapp.git
    cd todoapp
    ```

2. **Install dependencies**:
    ```bash
    flutter pub get
    ```

3. **Configure Firebase**:
    - Create a new project in the [Firebase Console](https://console.firebase.google.com/).
    - Add an Android and/or iOS app to your Firebase project.
    - Download the `google-services.json` (for Android) and/or `GoogleService-Info.plist` (for iOS) and place them in the respective directories:
        - `android/app` for `google-services.json`
        - `ios/Runner` for `GoogleService-Info.plist`
    - Enable Firestore and Authentication in the Firebase Console.

4. **Run the app**:
    ```bash
    flutter run
    ```

## Configuration

- **Riverpod Providers**:
    - The app uses Riverpod for state management. Providers are defined in the `lib/providers` directory.

## Folder Structure

lib/
├── main.dart # Entry point of the application
├── models/ # Data models
├── providers/ # Riverpod providers
├── views/ # UI screens
├── service/ # Firebase service classes
├── widgets/ # Reusable widgets
└── common/ # common app styling
└── data_layer # exports of dir

yaml
Copy code

## Contributing

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.


## Contact

If you have any questions or suggestions, feel free to reach out to me at **luckyekpebe123@gmail.com**.