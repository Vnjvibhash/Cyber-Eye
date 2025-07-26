# Cyber Eye 👁️

<p align="center">
  <img src="assets/images/logo.png?raw=true" alt="Cyber Eye Logo" height="400"/>
</p>

A sleek, modern Flutter application designed for digital identity analysis and safety scoring. Cyber Eye provides users with tools to evaluate online profiles, assess credit scores, and stay safe online, all wrapped in a beautiful, responsive UI with light and dark modes.

---

## 📸 Screenshots

A showcase of the key screens within the Cyber Eye application.

| Splash Screen                                      | Onboarding Screen                                          | Login Screen                                       |
| -------------------------------------------------- | ---------------------------------------------------------- | -------------------------------------------------- |
| <!-- Add your splash screen screenshot here -->     | <!-- Add your onboarding screen screenshot here -->         | <!-- Add your login screen screenshot here -->      |
| <img src="" width="250">                            | <img src="" width="250">                                   | <img src="" width="250">                            |

| Forgot Password                                    | Home Screen                                                | Reports Screen                                     |
| -------------------------------------------------- | ---------------------------------------------------------- | -------------------------------------------------- |
| <!-- Add your forgot password screenshot here -->   | <!-- Add your home screen screenshot here -->               | <!-- Add your reports screen screenshot here -->   |
| <img src="" width="250">                            | <img src="" width="250">                                   | <img src="" width="250">                            |

| Profile Screen                                     | Navigation Drawer                                          |
| -------------------------------------------------- | ---------------------------------------------------------- |
| <!-- Add your profile screen screenshot here -->    | <!-- Add your navigation drawer screenshot here -->         |
| <img src="" width="250">                            | <img src="" width="250">                                   |


---

## ✨ Key Features

-   **📊 Tweet Analyzer:** Understand Twitter users through comprehensive tweet evaluation.
-   **💳 Credit Scoring:** Receive tailored credit scores for account authenticity.
-   **🛡️ Safety Indicator:** Stay protected with instant risk assessments.
-   **🎨 Custom Theming:** A centralized theme file (`app_theme.dart`) with full support for **Light and Dark Modes** using Material 3.
-   **📱 Responsive UI:** Screens are designed to adapt beautifully to different device sizes.
-   **🚀 Smooth Onboarding:** A beautiful, animated onboarding experience for first-time users.
-   **🔐 Secure & Persistent Login:** A complete authentication flow with session management using `shared_preferences`.
-   **🔑 Password Reset:** A full-featured "Forgot Password" flow with a confirmation page.
-   **🌊 Elegant Navigation:** A stylish `CurvedNavigationBar` for primary navigation.
-   **Drawer Menu:** A fully integrated and state-synchronized navigation drawer for secondary actions and user profile access.
-   **Reusable Components:** Modular widgets for buttons, search bars, and list items for clean and maintainable code.

---

## 🛠️ Tech Stack & Key Packages

-   **Framework:** [Flutter](https://flutter.dev/)
-   **Language:** [Dart](https://dart.dev/)
-   **Key Packages:**
    -   [`google_fonts`](https://pub.dev/packages/google_fonts): For beautiful, custom typography (`Lato`, `Inter`).
    -   [`shared_preferences`](https://pub.dev/packages/shared_preferences): For persistent login sessions and first-launch checks.
    -   [`fl_chart`](https://pub.dev/packages/fl_chart): For creating the interactive credit score bar chart on the home screen.
    -   [`curved_navigation_bar`](https://pub.dev/packages/curved_navigation_bar): For the beautiful, animated bottom navigation.

---

## 📂 Project Structure

The project follows a clean and scalable architecture, separating UI, logic, models, and reusable components.

```
cybereye/
├── lib/
│ ├── main.dart
│ ├── theme.dart
│ ├── models/
│ │ ├── onboarding_content.dart
│ │ └── report_item.dart
│ ├── screens/
│ │ ├── splash_screen.dart
│ │ ├── onboarding_screen.dart
│ │ ├── login_screen.dart
│ │ ├── home_screen.dart
│ │ ├── reports_screen.dart
│ │ └── profile_screen.dart
│ └── widgets/
│ ├── bottom_navigation_bar.dart
│ ├── credit_score_chart.dart
│ ├── custom_button.dart
│ ├── custom_drawer.dart
│ ├── custom_input_field.dart
│ ├── custom_search_bar.dart
│ ├── drawer_menu_item.dart
│ ├── drawer_profile_header.dart
│ ├── home_header_clipper.dart
│ ├── login_header_painter.dart
│ ├── profile_header_painter.dart
│ └── report_list_item.dart
└── assets/
  └── images/
    └── cybereye.png
```

---

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

-   Flutter SDK (version 3.0.0 or higher)
-   An IDE like VS Code or Android Studio with the Flutter plugin.

### Installation

1.  **Clone the repository:**
    ```
    git clone https://github.com/Vnjvibhash/Cyber-Eye.git
    ```
2.  **Navigate to the project directory:**
    ```
    cd Cyber-Eye
    ```
3.  **Install dependencies:**
    ```
    flutter pub get
    ```
4.  **Run the app:**
    ```
    flutter run
    ```

---

## 💡 Application Flow & Architecture

-   **Launch & Routing:** The app starts with `SplashScreen`, which checks `SharedPreferences` for two flags: `is_logged_in` and `is_first_time`. Based on these, it intelligently navigates the user to the `MainScreen`, `LoginScreen`, or `IntroScreen`.
-   **State Management (Navigation):** The `MainScreen` acts as a stateful parent widget. It holds the state for the current navigation index (`_selectedIndex`) and passes it down to both the `CurvedNavigationBar` and the `CustomDrawer`. This ensures both components are always in sync. Callbacks from these widgets are passed back up to the `MainScreen` to update the state.
-   **Reusable Widgets:** The UI is composed of small, single-responsibility widgets (e.g., `GradientActionButton`, `CustomSearchBar`). This makes the code highly reusable, readable, and easy to maintain.

---

## 📜 License

This project is licensed under the MIT License - see the `LICENSE` file for details.


