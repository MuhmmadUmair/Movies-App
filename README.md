## 🎬 MovieMatrix App

**MovieMatrix** is a Flutter-based movie rating and discovery application built to explore and understand different **state management techniques** in Flutter.
The app was initially developed using **setState()**, and later refactored with **Provider**, **Riverpod**, and finally **BLoC**, to deeply understand how each approach manages app state efficiently.

---

## 🚀 Project Overview

The main goal of **MovieMatrix** is to **learn, implement, and compare** different state management approaches in a real-world app scenario.

In each version of the app, I restructured core functionalities like:

* Toggling between **Dark and Light themes**
* **Fetching movies** from the TMDB API
* Adding and removing movies from the **Favorites list**
* **Persisting app data** (theme mode & favorites) using **SharedPreferences**

This hands-on experience helped in gaining a clear and practical understanding of how **different state management techniques** handle reactivity, scalability, and performance in Flutter.

---

## 🧠 State Management Journey

### 1. 🟢 **SetState (Basic Version)**

* The initial version was developed purely with `setState()`.
* It managed UI updates locally without any external state management.
* Helped to understand how Flutter’s widget tree rebuild mechanism works.

### 2. 🟡 **Provider**

* Migrated the entire app to **Provider** for global state handling.
* Improved code scalability and reduced rebuilds.
* Data flow became easier to maintain between widgets.

### 3. 🔵 **Riverpod**

* Refactored using **Riverpod** for cleaner architecture.
* Eliminated dependency on `BuildContext` for accessing providers.
* Provided better testing capabilities and state isolation.

### 4. 🔴 **BLoC**

* Final version implemented with **BLoC (Business Logic Component)**.
* Achieved clear separation of business logic and UI.
* Introduced reactive state updates through **Streams** and **Events**.
* Enhanced maintainability and modularity for larger applications.

---

## ⚙️ Core Features

### 🎥 Movie Fetching

* Fetches movie data dynamically using **HTTP API calls**.
* Displays movie posters, titles, and ratings using **cached_network_image** for performance.

### ❤️ Favorites Management

* Add or remove movies from the **Favorites List**.
* Favorites persist locally using **SharedPreferences**.

### 🌗 Theme Toggling

* Switch between **Dark and Light modes**.
* User preference is stored locally, ensuring the theme persists after app restarts.

### 💾 Local Data Storage

* Used **SharedPreferences** for:

  * Storing user-selected theme (Dark/Light)
  * Storing the list of favorite movies

---

## 🛠️ Technologies & Packages Used

| Package                                     | Description                                              |
| ------------------------------------------- | -------------------------------------------------------- |
| **flutter_bloc: ^9.1.1**                    | State management for BLoC architecture                   |
| **bloc: ^9.1.0**                            | Core BLoC package for event-driven logic                 |
| **provider**                                | (Previous version) Simple and efficient state management |
| **flutter_riverpod**                        | (Previous version) Modern, compile-safe state management |
| **cached_network_image: ^3.4.1**            | Efficient image loading and caching                      |
| **http: ^1.5.0**                            | Used to fetch movie data from the API                    |
| **shared_preferences: ^2.5.3**              | Persistent local storage for theme and favorites         |
| **get_it: ^8.2.0**                          | Dependency injection for cleaner architecture            |
| **equatable: ^2.0.7**                       | Simplified equality checks for BLoC states               |
| **flutter_dotenv: ^6.0.0 / dotenv: ^4.2.0** | Environment variable management (for API keys)           |
| **cupertino_icons: ^1.0.8**                 | Default iOS-style icons                                  |
| **flutter_launcher_icons: ^0.14.4**         | Used to generate custom app launcher icons               |

---

## 📸 App Screenshots

| Home Screen                                                             | Movie Details                                                                 | Favorites Screen                                                                  | Theme Toggle                                                              |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| ![Home](https://github.com/MuhmmadUmair/Movies-App/blob/a8558933e1fb70b145ef755d9506edfb19d49830/assets/images/1.png) | ![Details](https://github.com/MuhmmadUmair/Movies-App/blob/a8558933e1fb70b145ef755d9506edfb19d49830/assets/images/2.png) | ![Favorites](https://github.com/MuhmmadUmair/Movies-App/blob/a8558933e1fb70b145ef755d9506edfb19d49830/assets/images/3.png) | ![Theme](https://github.com/MuhmmadUmair/Movies-App/blob/a8558933e1fb70b145ef755d9506edfb19d49830/assets/images/4.png) |

## 🧩 Project Structure (BLoC Version)

```
lib/
│
├── main.dart
├── service/
│   ├── init_getit.dart
│   └── api_service.dart
│
├── models/
│   ├── movies_model.dart
│   └── movie_genres.dart
│
├── view_models/
│   ├── favourites/
│   │   └── favourite_bloc.dart
│   ├── theme/
│   │   └── theme_bloc.dart
│   └── movies/
│       └── movies_bloc.dart
│
├── widgets/
│   ├── movies/
│   │   └── movies_widget.dart
│   └── my_error_widget.dart
│
└── views/
    ├── home_screen.dart
    ├── favourites_screen.dart
    └── movie_detail_screen.dart
```

---

## 🧰 How to Run the Project

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/yourusername/MovieMatrixApp.git
```

### 2️⃣ Install Dependencies

```bash
flutter pub get
```

### 3️⃣ Add Environment Variables

Create a `.env` file in the project root and add your TMDB API key:

```
TMDB_API_KEY=your_api_key_here
```

### 4️⃣ Run the App

```bash
flutter run
```

---

## 🌐 Connect with Me

If you liked this project or want to collaborate, let’s connect on **LinkedIn** 👇
🔗 [Muhammad Umair – LinkedIn](https://www.linkedin.com/in/muhmmadumair3233)

Would you like me to **add actual image links** (using placeholders or example GitHub asset links) so it’s ready for upload on your repository?
