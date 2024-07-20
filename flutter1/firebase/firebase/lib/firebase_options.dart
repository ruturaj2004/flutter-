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
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAAOmXvf8NBiFFV-KCdZ4Vn6kOHK2Won4o',
    appId: '1:600628717081:web:c268aea272f84c81c7ec88',
    messagingSenderId: '600628717081',
    projectId: 'example-7d740',
    authDomain: 'example-7d740.firebaseapp.com',
    storageBucket: 'example-7d740.appspot.com',
    measurementId: 'G-68E7XTXB7G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiE6-b1cr9RLWxU40CmeuuqtJ4VBJtRPo',
    appId: '1:600628717081:android:9d434b1077b4a76fc7ec88',
    messagingSenderId: '600628717081',
    projectId: 'example-7d740',
    storageBucket: 'example-7d740.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdXGtaAdXGaKmXMIcNCD9Jyd9Klb7ZUss',
    appId: '1:600628717081:ios:f542949c6df51b0fc7ec88',
    messagingSenderId: '600628717081',
    projectId: 'example-7d740',
    storageBucket: 'example-7d740.appspot.com',
    iosBundleId: 'com.example.firebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDdXGtaAdXGaKmXMIcNCD9Jyd9Klb7ZUss',
    appId: '1:600628717081:ios:f542949c6df51b0fc7ec88',
    messagingSenderId: '600628717081',
    projectId: 'example-7d740',
    storageBucket: 'example-7d740.appspot.com',
    iosBundleId: 'com.example.firebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAAOmXvf8NBiFFV-KCdZ4Vn6kOHK2Won4o',
    appId: '1:600628717081:web:b03e255bc18d7cf8c7ec88',
    messagingSenderId: '600628717081',
    projectId: 'example-7d740',
    authDomain: 'example-7d740.firebaseapp.com',
    storageBucket: 'example-7d740.appspot.com',
    measurementId: 'G-CK52TGMV7L',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'AIzaSyAAOmXvf8NBiFFV-KCdZ4Vn6kOHK2Won4o',
    appId: '1:600628717081:web:f65450913e24e502c7ec88',
    messagingSenderId: '600628717081',
    projectId: 'example-7d740',
    authDomain: 'example-7d740.firebaseapp.com',
    storageBucket: 'example-7d740.appspot.com',
    measurementId: 'G-ZRRV18L57F',
  );
}