import 'package:crud_application_firebase/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //name: 'myApp',
      options: const FirebaseOptions(
          apiKey: "AIzaSyB8YMvvkUur-iXVCesCQlIbX6gt7dSQcFg",
          appId: '1:870069515508:android:3ae616130d662e23d91aa1',
          messagingSenderId: '870069515508',
          projectId: 'crud-application-d072d',
          storageBucket: "crud-application-d072d.appspot.com"));
  runApp(MaterialApp(
    color: Colors.orangeAccent[100],
    home: HomePage(),
  ));
}
