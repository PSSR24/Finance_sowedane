import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'welcome.dart';
import 'login.dart';
import 'registration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:assignment/google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
     child: MaterialApp(
    initialRoute: welcome.id,
    routes: {
      welcome.id : (context) => welcome(),
      login.id : (context) => login(),
      registration.id : (context) =>registration(),

    },
     ),
    );


}