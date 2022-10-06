import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'blocs/bloc.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      home: Scaffold(
        appBar: AppBar(title: Text('Login Form'),),
        body: LoginScreen(),
      ),
    );
  }
}
