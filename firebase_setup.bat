@echo off
firebase login
dart pub global activate flutterfire_cli
flutterfire configure
flutter pub add firebase_core
flutterfire configure
