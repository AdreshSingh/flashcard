# 📱 Flashcard App

A **Flutter-based Flashcard application** designed to help users create, update, and manage flashcards seamlessly. Built using **Clean Architecture**, it ensures scalability, testability, and maintainability.

---

## 🚀 Features

- **Create Flashcards**: Add new flashcards with a question and answer.
- **Update Flashcards**: Edit existing flashcards with ease.
- **Delete Flashcards**: Remove flashcards you no longer need.
- **Animations**: Smooth card flip animations for better user experience.
- **Responsive Design**: Fully optimized for both mobile and tablet devices.
- **Lightweight and Efficient**: Fast and efficient thanks to clean architecture.

---

## 📂 Project Structure

The project is organized using **Clean Architecture** for better scalability and maintainability:

lib/
├── data/ # Data layer (Repositories, Data sources)
│
├── models/ # Data models
│
├── repository/ # Repository implementations
├── domain/ # Domain layer (Business logic)
│
├── models/ # Core business models
│
├── repository/ # Abstract repository interfaces
├── presentation/ # Presentation layer (UI)
│
├── widgets/ # Reusable widgets
│
├── pages/ # Screens/pages
│ ├── state/ # State management
├── assets/ # Static assets (Images, fonts, etc.)
└── main.dart # Entry point

### Key Files:

- **`FlashcardHomepage`**: Displays flashcards in a grid with add/edit/delete functionality.
- **`FlashcardForm`**: Form to create or edit flashcards.
- **`FlashcardList`**: Manages flashcard storage and operations (add, update, delete).

---

## 🛠️ Technologies & Tools

- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: Built-in `StatefulWidget` (can integrate `Provider`/`Bloc` for complex apps)
- **Architecture**: Clean Architecture
- **Animations**: Flutter's `AnimatedContainer` for smooth transitions
- **Assets Management**: Custom backgrounds and icons stored in `assets/`

---

## 📷 Screenshots

| Home Screen                                 | Add/Edit Flashcard                           |
| ------------------------------------------- | -------------------------------------------- |
| ![Home Screen](assets/screenshots/home.png) | ![Add Flashcard](assets/screenshots/add.png) |

---

## 🚧 Installation & Setup

### Prerequisites:

1. Install [Flutter](https://flutter.dev/docs/get-started/install).
2. Ensure your development environment is set up for Flutter (Android Studio or VS Code).

### Steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/flashcard-app.git
   cd flashcard-app
   ```
2. **Install Dependecies**

   ```bash
   flutter pub get

   ```

3. **Run the App**

   ```bash
   flutter run
   ```

### 🖼️ Assets

Adding New Assets:

1. Images: Place your images in the assets/images folder.
2. Fonts: Add custom fonts to assets/fonts and configure in pubspec.yaml.

### 🧑‍💻 Contributions

Contributions are welcome! Follow these steps:

1. Fork the repository.
2. Create a feature branch (git checkout -b feature-name).
3. Commit your changes (git commit -m 'Add feature').
4. Push to your fork (git push origin feature-name).
5. Open a pull request.

---

### 🛡️ License

This project is licensed under the MIT License. See the LICENSE file for details.

---

### 📝 Todo

- Add unit tests for the data and domain layers.
- Integrate Provider or Riverpod for state management.
- Implement dark mode support.

---

### 🤝 Acknowledgments

- Flutter Team for the amazing framework.
- Inspired from Wyreflow.
