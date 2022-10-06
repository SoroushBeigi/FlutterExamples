import 'package:flutter/material.dart';
import 'blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.fromLTRB(40, 60, 40, 20),
      child: Column(
        children: [
          emailField(),
          passwordField(),
          Container(
              margin: EdgeInsets.only(top: 30),
              child: SizedBox(width: 130, height: 45, child: button())),
        ],
      ),
    );
  }

  Widget emailField() => StreamBuilder(
    builder:(context,snapshot){
      return TextField(
        onChanged: bloc.changeEmail,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'you@xmail.com',
            labelText: 'Email Adress',
        errorText:  snapshot.error?.toString(),
        ),
      );
    },
  stream: bloc.email,
  );

  Widget passwordField() => StreamBuilder(
    builder: (context,snapshot){
    return TextField(
      onChanged: bloc.changePassword,
      decoration: InputDecoration(
        errorText:snapshot.error?.toString(),
        hintText: '********',
        labelText: 'password',
      ),
      obscureText: true,
    );
  },
  stream: bloc.password,

  );

  Widget button() => ElevatedButton(onPressed: () {},
      child: Text('Submit', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19),
  )
  );
}

// String errorHandler(Object? error){
//   if(error.toString()=='null'){
//     return '';
//   }
//   else{
//   return error.toString();
//   }
// }
