import 'package:flutter/material.dart';

class success extends StatelessWidget {
  static const String id = 'success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text(
            'Account is Succesfully created :)',
            textAlign: TextAlign.center,
          ),
        ],
    ),
      ),
    );
  }
}
