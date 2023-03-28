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
    apiKey: 'AIzaSyBUYMzMKDG1J9rTgYVFkbW32LCLi_q_wpc',
    appId: '1:822891640798:web:a00cda54eac666c68a4f4f',
    messagingSenderId: '822891640798',
    projectId: 'persons-b2044',
    authDomain: 'persons-b2044.firebaseapp.com',
    databaseURL: 'https://persons-b2044-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'persons-b2044.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATn2gNm4c3bMeHhs2M3rfS9waseI3hAn4',
    appId: '1:822891640798:android:897739182ca801a28a4f4f',
    messagingSenderId: '822891640798',
    projectId: 'persons-b2044',
    databaseURL: 'https://persons-b2044-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'persons-b2044.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCw6Lf39fHFRT2H9SbVdNkF8yz2SUWXc2Y',
    appId: '1:822891640798:ios:eb752854e3ae2a538a4f4f',
    messagingSenderId: '822891640798',
    projectId: 'persons-b2044',
    databaseURL: 'https://persons-b2044-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'persons-b2044.appspot.com',
    iosClientId: '822891640798-55ta0qaqhlsd9q0omk9phb8ipubcel4s.apps.googleusercontent.com',
    iosBundleId: 'com.example.kisilerUygulamasi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCw6Lf39fHFRT2H9SbVdNkF8yz2SUWXc2Y',
    appId: '1:822891640798:ios:eb752854e3ae2a538a4f4f',
    messagingSenderId: '822891640798',
    projectId: 'persons-b2044',
    databaseURL: 'https://persons-b2044-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'persons-b2044.appspot.com',
    iosClientId: '822891640798-55ta0qaqhlsd9q0omk9phb8ipubcel4s.apps.googleusercontent.com',
    iosBundleId: 'com.example.kisilerUygulamasi',
  );
}
