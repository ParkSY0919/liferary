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
    apiKey: 'AIzaSyDnwhdozXIZm_3src_z3IKLB75CXI84IvE',
    appId: '1:1008728904046:web:270364a561349fc998717f',
    messagingSenderId: '1008728904046',
    projectId: 'liferary-091999',
    authDomain: 'liferary-091999.firebaseapp.com',
    storageBucket: 'liferary-091999.appspot.com',
    measurementId: 'G-M170WG7QVZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbKJ1IHmFaGSS6S1quog7_w-aA75GWo9Q',
    appId: '1:1008728904046:android:437db3d01e741b9298717f',
    messagingSenderId: '1008728904046',
    projectId: 'liferary-091999',
    storageBucket: 'liferary-091999.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBYKm38296s-73sNmGbL7KpJdcFdMPHkLc',
    appId: '1:1008728904046:ios:28091203fd1f79d898717f',
    messagingSenderId: '1008728904046',
    projectId: 'liferary-091999',
    storageBucket: 'liferary-091999.appspot.com',
    iosClientId: '1008728904046-n0s1kb7a95frfsqqtddadh57gkvhg8ck.apps.googleusercontent.com',
    iosBundleId: 'com.example.liferary',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBYKm38296s-73sNmGbL7KpJdcFdMPHkLc',
    appId: '1:1008728904046:ios:28091203fd1f79d898717f',
    messagingSenderId: '1008728904046',
    projectId: 'liferary-091999',
    storageBucket: 'liferary-091999.appspot.com',
    iosClientId: '1008728904046-n0s1kb7a95frfsqqtddadh57gkvhg8ck.apps.googleusercontent.com',
    iosBundleId: 'com.example.liferary',
  );
}
