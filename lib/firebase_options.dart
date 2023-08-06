// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDX9_0dpNmaMrAlhaHj29bWPrjgBP5CbrM',
    appId: '1:381219327086:web:bba087f1327400adfa2a7f',
    messagingSenderId: '381219327086',
    projectId: 'ili-ximmingbase-weather-app',
    authDomain: 'ili-ximmingbase-weather-app.firebaseapp.com',
    storageBucket: 'ili-ximmingbase-weather-app.appspot.com',
    measurementId: 'G-EC8BG0LE0X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAj2Gc4ApQhIesZmCBKZMavifQUdblW5MA',
    appId: '1:381219327086:android:4fe85fecdba7692afa2a7f',
    messagingSenderId: '381219327086',
    projectId: 'ili-ximmingbase-weather-app',
    storageBucket: 'ili-ximmingbase-weather-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwBiqKeGf6j0xNDDXrPcNvvtqwTGHxxQY',
    appId: '1:381219327086:ios:12d3f38e3501d2cffa2a7f',
    messagingSenderId: '381219327086',
    projectId: 'ili-ximmingbase-weather-app',
    storageBucket: 'ili-ximmingbase-weather-app.appspot.com',
    iosClientId: '381219327086-5hjk63sd83hodgah8kt6lqmnqt0u27em.apps.googleusercontent.com',
    iosBundleId: 'tw.arfiligol.ximmingBasePracticeWhetherApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwBiqKeGf6j0xNDDXrPcNvvtqwTGHxxQY',
    appId: '1:381219327086:ios:aed188a56d0bdc44fa2a7f',
    messagingSenderId: '381219327086',
    projectId: 'ili-ximmingbase-weather-app',
    storageBucket: 'ili-ximmingbase-weather-app.appspot.com',
    iosClientId: '381219327086-v6tf0hs02c0d45af0h16co5k1ame2vjm.apps.googleusercontent.com',
    iosBundleId: 'com.example.ximmingBasePracticeWhetherApp.RunnerTests',
  );
}