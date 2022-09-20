import 'package:assignment/google.dart';
import 'package:assignment/login.dart';
import 'package:assignment/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class registration extends StatefulWidget {
  static const String id = 'registration';

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  final _auth = FirebaseAuth.instance;
  var check = false;
  late String email;
  late String password;
  late String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('SIGN UP',
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('HELLO BEAUTIFUL.!',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Poppins-Bold',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Enter your information to create an account ',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Mulish',
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('UserName*',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),),
                    TextField(

                      onChanged: (value) {
                        username = value;
                      },
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your Username',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Email ID*',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        email = value;
                      },
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your email',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Password*',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),),
                    TextField(
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your password',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Checkbox(value: check, onChanged: (newValue){
                  setState(() {
                    check = !check;
                  });
                }),
                Text('I agree to the',
                  style: TextStyle(
                    fontFamily: 'Poppins-Bold',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text('Terms and Conditions, Privacy Policy',
                  style: TextStyle(
                    fontFamily: 'Poppins-Bold',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () async {
                    try {
                      final newuser = await _auth
                          .createUserWithEmailAndPassword(
                          email: email, password: password);
                      if (newuser != null){
                        Navigator.pushNamed(context, login.id);
                      }
                    }
                    catch (e) {
                      print(e);
                    }
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'SIGN UP',
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
            SizedBox(height: 10,),
            Text('Or you can Join with',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 7,),
            Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new GestureDetector(
                    onTap :(){
                      final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                      provider.googleLogin();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.cyanAccent,
                      backgroundImage: AssetImage('images/google.png'),
                    ),
                  ),
                  SizedBox(width: 15,),
                  CircleAvatar(
                    backgroundColor: Colors.cyanAccent,
                    backgroundImage: AssetImage('images/facebook.png'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Already have an Account?",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(width: 4,),
                new GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, login.id);
                  },
                child: Text('Login',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
