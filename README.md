# Stars

The purpose of this repository to share the idea of how to structuring the application
in a nice way.
In my opinion, flutter_redux and redux_epics is a great combination to setup base for
flutter application.

Note: You can have a look in [flutter_redux](https://pub.dev/packages/flutter_redux),
and [redux_epics](https://pub.dev/packages/redux_epics).

[Nihad Delic](https://nihad-delic91.medium.com) also wrote a small application to understand how to use `flutter_redux`
with `redux_epics` in the following
URL [Redux and epics for better-organized code in Flutter apps](https://nihad-delic91.medium.com/reduce-duplication-achieve-flexibility-means-success-for-the-flutter-app-e5e432839e61)

---

### App directory structure

![High level diagram](./images/architecture_directories.png)

### High level diagram

![High level diagram](./images/Redux-epic-architecture-High-level-diagram.png)

### Low level diagram

![Low level diagram](./images/Redux-epic-architecture-Low-level-diagram.png)

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the
following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Stars works on iOS, Android, and Web._

---