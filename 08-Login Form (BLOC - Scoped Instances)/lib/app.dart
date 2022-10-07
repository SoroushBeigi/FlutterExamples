import 'package:flutter/material.dart';
import 'package:login_bloc/blocs/provider.dart';
import 'LoginScreen.dart';
import 'blocs/bloc.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Login App',
        home: Scaffold(
          appBar: AppBar(title: Text('Login Form'),),
          body: LoginScreen(),
        ),
      ),
    );

  }
}
