# Xpresso

A Flutter coffee ordering app with onboarding, authentication UI, product browsing, cart management, favorites, and order history. Uses Provider for state management and SharedPreferences for local persistence.

## Features

- Onboarding carousel with progress indicators
- Login/signup screens (UI only, no backend integration)
- Coffee catalog with category filtering (Cappuccino, Espresso, Latte, Flat White) and search
- Product detail view with size selection (S, M, L)
- Cart system with persistent storage (add/remove items, quantity control)
- Favorites list with persistent storage
- Order history tracking
- Delivery tracking UI with map placeholder
- Profile screen with editable fields

## Tech Stack

- **Flutter SDK**: 3.10.4 (Dart 3.10.4)
- **State Management**: Provider (6.1.1)
- **Local Storage**: shared_preferences (2.2.0)
- **Key Packages**: google_fonts (6.1.0)

## Project Structure

```
lib/
├── main.dart
├── models/
│   ├── cart_item.dart
│   ├── coffee_model.dart
│   └── onboarding_item.dart
├── providers/
│   ├── cart_provider.dart
│   ├── favorites_provider.dart
│   └── order_provider.dart
├── repositories/
│   └── coffee_repository.dart
├── screens/
│   ├── cart_screen.dart
│   ├── delivery_screen.dart
│   ├── detail_screen.dart
│   ├── favorites_screen.dart
│   ├── home_screen.dart
│   ├── login_screen.dart
│   ├── main_wrapper.dart
│   ├── onboarding_screen.dart
│   ├── order_screen.dart
│   ├── profile_screen.dart
│   └── signup_screen.dart
├── services/
│   └── storage_service.dart
├── theme/
│   └── app_theme.dart
└── widgets/
    ├── auth/
    ├── cart/
    ├── delivery/
    ├── detail/
    ├── favorites/
    ├── home/
    ├── onboarding/
    ├── order/
    └── profile/
```

## Setup

```bash
git clone https://github.com/umernvd/Coffee-App-Flutter.git
cd Coffee-App-Flutter
flutter pub get
flutter run
```

## Architecture Notes

- **Singleton Services**: `StorageService` and `CoffeeRepository` use factory constructors
- **Providers**: Initialized in `main.dart` via `MultiProvider`, automatically load saved data on startup
- **Data Flow**: User actions → Provider methods → `notifyListeners()` → UI rebuild
- **Persistence**: Cart and favorites serialize to JSON strings in SharedPreferences

## License

MIT License
