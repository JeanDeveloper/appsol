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
    apiKey: 'AIzaSyCw1jMgQLEJDwho0OQFBKG3nisqxjM-J_w',
    appId: '1:421984983217:web:f0811fce18ca38eac2aa90',
    messagingSenderId: '421984983217',
    projectId: 'appsol-95fc5',
    authDomain: 'appsol-95fc5.firebaseapp.com',
    storageBucket: 'appsol-95fc5.appspot.com',
    measurementId: 'G-7FLEQS48PY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDE_QbLOJ4Wz2MLwm9UBTI8lWwNHZjQOQo',
    appId: '1:421984983217:android:eed0ed7f8a13509bc2aa90',
    messagingSenderId: '421984983217',
    projectId: 'appsol-95fc5',
    storageBucket: 'appsol-95fc5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAeVqwlQQoX1phqoJ0kKyKj3is1f2WJATs',
    appId: '1:421984983217:ios:23333f50149fb70dc2aa90',
    messagingSenderId: '421984983217',
    projectId: 'appsol-95fc5',
    storageBucket: 'appsol-95fc5.appspot.com',
    iosClientId: '421984983217-e31och1amuussmcbtuce8a88fm1h515s.apps.googleusercontent.com',
    iosBundleId: 'com.example.solgis',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAeVqwlQQoX1phqoJ0kKyKj3is1f2WJATs',
    appId: '1:421984983217:ios:23333f50149fb70dc2aa90',
    messagingSenderId: '421984983217',
    projectId: 'appsol-95fc5',
    storageBucket: 'appsol-95fc5.appspot.com',
    iosClientId: '421984983217-e31och1amuussmcbtuce8a88fm1h515s.apps.googleusercontent.com',
    iosBundleId: 'com.example.solgis',
  );
}
