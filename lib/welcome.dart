import 'package:assignment/login.dart';
import 'package:flutter/material.dart';
import 'package:assignment/registration.dart';
import 'package:provider/provider.dart';
import 'package:assignment/google.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class welcome extends StatefulWidget {
  static const String id = 'welcome';
  @override
  State<welcome> createState() => _welcomeState();
}
class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              Text('Welcome',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Text('Easiest Way Manage Your Money',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Finance is a gun. Politics is knowing when to pull the trigger',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 150),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                      provider.googleLogin();
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'SIGN IN WITH GOOGLE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Poppins-Bold',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, registration.id);
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'CREATE AN ACCOUNT',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins-Bold',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
