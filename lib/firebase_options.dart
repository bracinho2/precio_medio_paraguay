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
    apiKey: 'AIzaSyCK0a1-wQqE_TZcRn5pHb6kNiCblLjGBbA',
    appId: '1:631119579488:web:2a278c12623db253077605',
    messagingSenderId: '631119579488',
    projectId: 'preciomedioparaguay',
    authDomain: 'preciomedioparaguay.firebaseapp.com',
    storageBucket: 'preciomedioparaguay.appspot.com',
    measurementId: 'G-031TC7D9D1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSx7drcXFVzwqu8aeUx8k_T2W1XHeppOY',
    appId: '1:631119579488:android:650fdac9383579e0077605',
    messagingSenderId: '631119579488',
    projectId: 'preciomedioparaguay',
    storageBucket: 'preciomedioparaguay.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBaJmwneDpjVIPuQv_G4xafw4xj7m2CqtI',
    appId: '1:631119579488:ios:75c5edde0f9189e3077605',
    messagingSenderId: '631119579488',
    projectId: 'preciomedioparaguay',
    storageBucket: 'preciomedioparaguay.appspot.com',
    iosClientId: '631119579488-dr6ls1qfrbqr4scip824uho7lujbl3ka.apps.googleusercontent.com',
    iosBundleId: 'com.precioMedioParaguay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBaJmwneDpjVIPuQv_G4xafw4xj7m2CqtI',
    appId: '1:631119579488:ios:df0eed7d0f14c60d077605',
    messagingSenderId: '631119579488',
    projectId: 'preciomedioparaguay',
    storageBucket: 'preciomedioparaguay.appspot.com',
    iosClientId: '631119579488-q0oub8nesfdfi2qvn3rdc86ng1t09sfa.apps.googleusercontent.com',
    iosBundleId: 'com.example.precioMedioParaguay',
  );
}