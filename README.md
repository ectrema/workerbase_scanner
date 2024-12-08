# QR Code Reader App

This Flutter project is a **QR Code Reader** mobile application built using **MVVM (Model-View-ViewModel)** architectural pattern and adhering to the **SOLID principles**. The application is designed to provide a seamless experience for scanning and managing QR codes while maintaining clean and scalable code.

---

## Features

- **Scan QR Codes** using the camera.
- Store and manage scanned QR codes in a local database.
- **Multilingual support** with localization.
- **Add events** to the calendar via QR codes.
- Launch URLs and other actions embedded in QR codes.
- **Access device settings** for permissions and adjustments.
- Manage contacts extracted from QR codes.

---

## Table of Contents

1. [Project Architecture](#project-architecture)
2. [Technologies & Libraries](#technologies--libraries)
3. [Usage](#usage)

---

## Project Architecture

This project follows the **MVVM architecture** pattern to ensure a clean separation of concerns:

- **Model**: Handles the business logic and data layer (e.g., fetching, storing data).
- **ViewModel**: Manages the app's state and exposes it to the UI using `flutter_riverpod`.
- **View**: Represents the UI and listens to changes from the ViewModel.

**Dependency Injection** is implemented using `get_it` and `injectable` to manage and inject dependencies efficiently across the app.

---

## Technologies & Libraries

The following packages are used in the project:

### State Management
- `flutter_riverpod: 2.6.1`
- `riverpod_annotation: 2.6.1`

### Dependency Injection
- `get_it: 8.0.2`
- `injectable: 2.5.0`

### Routing
- `go_router: 14.6.2`

### Utilities
- `equatable: 2.0.5`
- `copy_with_extension: 6.0.0`
- `path_provider: 2.1.5`
- `path: 1.9.0`
- `collection: 1.18.0`
- `url_launcher: 6.3.1`

### Local Database
- `sembast: 3.8.0+1`

### Localization
- `easy_localization: 3.0.7`

### Camera & QR Code Handling
- `mobile_scanner: 6.0.2`
- `pretty_qr_code: 3.3.0`

### Device Settings
- `open_settings_plus: 0.4.0`

### JSON
- `json_annotation: 4.9.0`

### Calendar Integration
- `add_2_calendar: 3.0.1`

### Contacts Management
- `flutter_contacts: 1.1.9+2`

---

## Usage

### QR Code Scanning
- Open the app and **Scan QR Code** using the camera.
- Allow camera permissions if prompted.
- Point your camera at the QR code to scan.

### QR Code Generation
- Navigate to the **Generate QR Code** tab.

### Manage QR Codes
- View and delete scanned/generated QR codes in the **History** section.

---