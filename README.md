# Laravel API Course — Flutter Client

A Flutter app consuming the [Laravel 13 API](https://github.com/omereroglu1923/04-laravel-api-course), built to explore Sanctum token authentication from a mobile-first framework outside the JavaScript ecosystem.

## Why this project

The other clients in this series are all JavaScript-based (Vue, Next.js, Nuxt). This one steps outside that world entirely to see how the same token-based authentication flow looks in Flutter/Dart — and how state management, secure storage, and API calls differ from their JS counterparts.

## What's inside

- Register/login screens with a shared `AuthProvider`
- Token stored via `flutter_secure_storage` (the platform-appropriate secure storage equivalent of `localStorage`)
- A protected home screen that fetches the current user via `/api/user` using the stored token
- Runs on the Chrome web target — a practical choice for iterating quickly without an Android/iOS emulator

## Concepts learned / practiced

The Provider state management pattern (`ChangeNotifierProvider`, `ChangeNotifier`, `notifyListeners()`), Dart's async/await and `Future` types, `http` package for REST calls, secure token storage on non-web platforms, and Flutter's named-route navigation.

## Tech stack

- Flutter, Dart
- Packages: `provider`, `flutter_secure_storage`, `http`, `device_info_plus`

## Setup

```bash
git clone https://github.com/omereroglu1923/04-laravel-api-course-flutter-app.git
cd 04-laravel-api-course-flutter-app
flutter pub get
flutter run -d chrome
```

Requires the [Laravel API](https://github.com/omereroglu1923/04-laravel-api-course) running locally (default: `http://127.0.0.1:8000`).

## Part of a larger roadmap

Part of a full-stack learning path: [`01-weather-cli-app`](https://github.com/omereroglu1923/weather-cli-app) → [`02-chirper`](https://github.com/omereroglu1923/chirper) → [`03-blog-crm`](https://github.com/omereroglu1923/03-blog-crm) → [`04-laravel-api-course`](https://github.com/omereroglu1923/04-laravel-api-course) (backend) → **this client**, alongside [Vue](https://github.com/omereroglu1923/04-laravel-api-course-vue-client), [Next.js](https://github.com/omereroglu1923/04-laravel-api-course-nextjs-client), [Nuxt](https://github.com/omereroglu1923/04-laravel-api-course-nuxt-client), and [Expo/React Native](https://github.com/omereroglu1923/04-laravel-api-course-expo-app) clients consuming the same API.
