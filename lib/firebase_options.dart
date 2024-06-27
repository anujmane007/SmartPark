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
    apiKey: 'Rplace With your Api key',
    appId: '1:505234543952:web:69cc6839153b366ad48855',
    messagingSenderId: '505234543952',
    projectId: 'dipex-ba431',
    authDomain: 'dipex-ba431.firebaseapp.com',
    databaseURL: 'https://dipex-ba431-default-rtdb.firebaseio.com',
    storageBucket: 'dipex-ba431.appspot.com',
    measurementId: 'G-KFSZHVF8BV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_lT29mjWEmeDokU30Z6of1iUvqm5DwnE',
    appId: '1:505234543952:android:2aa594d627b8e4b6d48855',
    messagingSenderId: '505234543952',
    projectId: 'dipex-ba431',
    databaseURL: 'https://dipex-ba431-default-rtdb.firebaseio.com',
    storageBucket: 'dipex-ba431.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1qQy4gurvX-d2w_whpaXzeyWjYelUti4',
    appId: '1:505234543952:ios:164e475c5b874033d48855',
    messagingSenderId: '505234543952',
    projectId: 'dipex-ba431',
    databaseURL: 'https://dipex-ba431-default-rtdb.firebaseio.com',
    storageBucket: 'dipex-ba431.appspot.com',
    iosBundleId: 'com.example.flutterApplicationStreetParking',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1qQy4gurvX-d2w_whpaXzeyWjYelUti4',
    appId: '1:505234543952:ios:9961b6b00b349ed8d48855',
    messagingSenderId: '505234543952',
    projectId: 'dipex-ba431',
    databaseURL: 'https://dipex-ba431-default-rtdb.firebaseio.com',
    storageBucket: 'dipex-ba431.appspot.com',
    iosBundleId: 'com.example.flutterApplicationStreetParking.RunnerTests',
  );
}
