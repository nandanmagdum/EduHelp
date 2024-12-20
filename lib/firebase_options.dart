// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYvVuYESi9evSBQ9qi-yRlycSw-zw6F20',
    appId: '1:1006446736086:android:3560998ac3d68486430f77',
    messagingSenderId: '1006446736086',
    projectId: 'eduhelp-73352',
    storageBucket: 'eduhelp-73352.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXLrH6MFi2vrzfAJ0MI8Qutole3zV-WsY',
    appId: '1:1006446736086:ios:4484b1b9330e8304430f77',
    messagingSenderId: '1006446736086',
    projectId: 'eduhelp-73352',
    storageBucket: 'eduhelp-73352.firebasestorage.app',
    iosBundleId: 'com.gcek.eduHelp',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyArSr7pEOzhlDfyTWSWz2OUq-54Ewgq7A0',
    appId: '1:1006446736086:web:2197718666a07462430f77',
    messagingSenderId: '1006446736086',
    projectId: 'eduhelp-73352',
    authDomain: 'eduhelp-73352.firebaseapp.com',
    storageBucket: 'eduhelp-73352.firebasestorage.app',
  );

}