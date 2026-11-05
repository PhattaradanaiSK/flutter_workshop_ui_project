# Orange ส้ม — Flutter UI workshop project

A Flutter/Dart mobile implementation of the six 360 × 800 screens in the supplied Figma file. The Android app starts on `E01PageUI`, uses the provided fruit and social-icon PNGs, and bundles the Roboto and Poppins typefaces used in the design. It keeps the design frame proportional on smaller or larger Android phone viewports.

## Screens and navigation

The app contains `E01PageUI` (welcome), `E02PageUI` (login), `E03PageUI` (register), `E04PageUI` (forgot password), `E05PageUI` (OTP verification), and `E06PageUI` (create new password) in separate Dart files under `lib/screens/`.

The confirmed primary prototype path is E01 → E02 → E04 → E05 → E06 → E01: tap **Explore Now**, **Forgot Password ?**, **Send code**, **Verify**, then **Submit**. The login screen’s **Create Account** link opens E03; the register screen also provides a way back to login.

## Requirements

- Flutter stable 3.47.9 or a compatible newer Flutter SDK
- Android SDK and a device/emulator, or Android Studio

## Install and run

From this directory:

```sh
flutter pub get
flutter run
```

Select an Android emulator or connected Android device. To check the available devices, run `flutter devices`.

## Test and build

```sh
flutter analyze
flutter test
flutter build apk --debug
```

The debug APK is written to `build/app/outputs/flutter-apk/app-debug.apk`. `test/previews/` contains 360 × 800 golden captures of all six app screens, rendered by Flutter's widget renderer with the bundled fonts and supplied images. These are UI snapshots, not screenshots of Android system chrome or a physical device. Regenerate them with:

```sh
flutter test --update-goldens test/preview_capture_test.dart
```

## Prototype scope

The design is a UI workshop prototype; there is no backend, authentication provider, email/SMS delivery, password persistence, or social sign-in service in the supplied project. The login and registration buttons therefore do not create a real account or authenticate. The fields remain editable for UI testing. Policy labels are reproduced as visual links because no policy destination/content was supplied. OTP and password-submit buttons follow the prototype’s screen transitions only; they do not validate a live code or save a password.

## Assets and font licenses

The PNG assets are copied from the supplied `resource1` archive into `assets/images/`. Bundled Poppins files are from Google Fonts and covered by `assets/fonts/OFL.txt`. Bundled Roboto files are from the Google Fonts Roboto repository and covered by `assets/fonts/Roboto-LICENSE.txt`.
