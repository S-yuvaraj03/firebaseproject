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
    apiKey: 'AIzaSyAvTZXCJy3csx56qQuaGyU5fXVH_2Wqins',
    appId: '1:741049263259:web:c8f60aa01f48583de1123e',
    messagingSenderId: '741049263259',
    projectId: 'fir-0309',
    authDomain: 'fir-0309.firebaseapp.com',
    storageBucket: 'fir-0309.appspot.com',
    measurementId: 'G-MCFXEL9696',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3UxuTJalQ3gKLw6Z1bLxH3R8H8BJIFOs',
    appId: '1:741049263259:android:fb008a7352a8f1d1e1123e',
    messagingSenderId: '741049263259',
    projectId: 'fir-0309',
    storageBucket: 'fir-0309.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwZTb3P_FMscOX5-dHz7f6eTRtdXkN67c',
    appId: '1:741049263259:ios:6cbadaca73397ae9e1123e',
    messagingSenderId: '741049263259',
    projectId: 'fir-0309',
    storageBucket: 'fir-0309.appspot.com',
    iosBundleId: 'com.example.firebaseproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCwZTb3P_FMscOX5-dHz7f6eTRtdXkN67c',
    appId: '1:741049263259:ios:64817ef2ca025191e1123e',
    messagingSenderId: '741049263259',
    projectId: 'fir-0309',
    storageBucket: 'fir-0309.appspot.com',
    iosBundleId: 'com.example.firebaseproject.RunnerTests',
  );
}
