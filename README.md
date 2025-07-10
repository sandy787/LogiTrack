```markdown
# LogiTrack Lite

## Description

LogiTrack Lite is an iOS application that simulates a lightweight logistics and delivery tracking platform for field agents. Built entirely with SwiftUI and Firebase (free tier), the app enables delivery agents to view assigned orders, update delivery statuses, share their live location, and visualize routes using Apple-native services.

The app uses Firebase Authentication for login, Firestore for real-time delivery data, Firebase Cloud Messaging (FCM) for push notifications, and CoreLocation + MapKit for GPS tracking and route visualization. Designed with modular UI components and a reactive data layer, LogiTrack Lite is a fully functional, scalable base for mobile logistics workflows without relying on paid APIs or services.

This project demonstrates proficiency in mobile architecture, Firebase integration, real-time databases, CoreLocation, MapKit, and accessibility-aware SwiftUI design.

## Features

-   **Order Management:** View assigned delivery orders.
-   **Status Updates:** Update the delivery status of orders (e.g., "In Transit," "Delivered").
-   **Live Location Sharing:** Share live location with the platform for tracking.
-   **Route Visualization:** Visualize delivery routes using Apple Maps.
-   **Authentication:** Secure user authentication using Firebase Authentication.
-   **Real-time Data:** Utilizes Firestore for real-time delivery data updates.
-   **Push Notifications:** Receive push notifications via Firebase Cloud Messaging (FCM).

## Technologies Used

-   SwiftUI
-   Firebase
    -   Firebase Authentication
    -   Firestore
    -   Firebase Cloud Messaging (FCM)
-   CoreLocation
-   MapKit

## Installation

1.  **Clone the repository:**

    ```bash
    git clone <repository_url>
    cd <project_directory>
    ```

2.  **Install dependencies (if any, e.g., using CocoaPods or Swift Package Manager):**

    *(Assuming Swift Package Manager is used)*

    Open the project in Xcode. Xcode will automatically download and install the Swift Package dependencies.

3.  **Configure Firebase:**

    -   Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
    -   Add an iOS app to your Firebase project.
    -   Download the `GoogleService-Info.plist` file and add it to your Xcode project.
    -   Enable Authentication, Firestore, and Cloud Messaging in the Firebase Console.
    -   Configure Authentication methods (e.g., Email/Password).
    -   Set up Firestore rules according to your security requirements.

## Usage

1.  **Open the project in Xcode.**
2.  **Build and run the app on a simulator or a physical iOS device.**
3.  **Log in using Firebase Authentication.**
4.  **Start simulating delivery tasks, updating statuses, and sharing your location.**
5.  **Observe the real-time data updates in the app.**

## License

MIT License
```
