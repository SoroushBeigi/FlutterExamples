import 'package:flutter/material.dart';
import 'package:login/screens/login_form.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Login Form'),),
        body: Login()
      ),
    );
  }
}
