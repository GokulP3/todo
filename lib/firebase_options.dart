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
    apiKey: 'AIzaSyD0mws0ZQQIiwUMox-93rqRLvoEPjJpTjs',
    appId: '1:996386699083:web:933b0e1f12fefed4d7dace',
    messagingSenderId: '996386699083',
    projectId: 'todo-b0014',
    authDomain: 'todo-b0014.firebaseapp.com',
    storageBucket: 'todo-b0014.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUR-CAaImijzQ8P4sS0PXqjMzzF_ROsq0',
    appId: '1:996386699083:android:2bf38a3596e7c33ad7dace',
    messagingSenderId: '996386699083',
    projectId: 'todo-b0014',
    storageBucket: 'todo-b0014.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7zio-hhOS225yfAIIjicYWbfcptL1qVQ',
    appId: '1:996386699083:ios:9e38829209aad2f3d7dace',
    messagingSenderId: '996386699083',
    projectId: 'todo-b0014',
    storageBucket: 'todo-b0014.appspot.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7zio-hhOS225yfAIIjicYWbfcptL1qVQ',
    appId: '1:996386699083:ios:25f9fef08b717e5cd7dace',
    messagingSenderId: '996386699083',
    projectId: 'todo-b0014',
    storageBucket: 'todo-b0014.appspot.com',
    iosBundleId: 'com.example.todo.RunnerTests',
  );
}