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
        return windows;
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
    apiKey: 'AIzaSyD1QvQhpvfzsk_jZGEETNaFt999xbmI784',
    appId: '1:954839568658:web:184d46abf22690fad263cb',
    messagingSenderId: '954839568658',
    projectId: 'attendace-management-system',
    authDomain: 'attendace-management-system.firebaseapp.com',
    storageBucket: 'attendace-management-system.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHfQVjKstm2y1n8DgQPCZh_nbIYPepmdA',
    appId: '1:954839568658:android:c53d13660fb1d5add263cb',
    messagingSenderId: '954839568658',
    projectId: 'attendace-management-system',
    storageBucket: 'attendace-management-system.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBENBoAiBGBbvSPHzKgQ9raMm3QUu943-A',
    appId: '1:954839568658:ios:680c3d77b6ba3d59d263cb',
    messagingSenderId: '954839568658',
    projectId: 'attendace-management-system',
    storageBucket: 'attendace-management-system.appspot.com',
    iosClientId: '954839568658-hgsrfgaegr9tglgjk75cn3kjnsi3m47i.apps.googleusercontent.com',
    iosBundleId: 'com.example.attsys',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBENBoAiBGBbvSPHzKgQ9raMm3QUu943-A',
    appId: '1:954839568658:ios:680c3d77b6ba3d59d263cb',
    messagingSenderId: '954839568658',
    projectId: 'attendace-management-system',
    storageBucket: 'attendace-management-system.appspot.com',
    iosClientId: '954839568658-hgsrfgaegr9tglgjk75cn3kjnsi3m47i.apps.googleusercontent.com',
    iosBundleId: 'com.example.attsys',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD1QvQhpvfzsk_jZGEETNaFt999xbmI784',
    appId: '1:954839568658:web:184d46abf22690fad263cb',
    messagingSenderId: '954839568658',
    projectId: 'attendace-management-system',
    authDomain: 'attendace-management-system.firebaseapp.com',
    storageBucket: 'attendace-management-system.appspot.com',
  );
}
