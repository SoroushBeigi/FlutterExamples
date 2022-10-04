import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login>{
  var myKey = new GlobalKey<FormState>();
  String email='', password='';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(100),
      child: SingleChildScrollView(
        child: Form(
          key: myKey,
          child:Column(
            children: [
              emailField(),
             passwordField(),
             button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText:'Email Address',
        hintText: 'yourEmail@mail.com'
      ),
      validator: (value){
        if(!value!.contains('@') || !value.contains('.')){
          return "Please Enter a valid email.";
        } else return null;
      },
      onSaved: (value){
        email=value!;
      },
    );
  }
   Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText:'Password',
            hintText: '********',
      ),
      validator: (value){
        if(!isPasswordFine(value)) return "It must be long and secure enough";
      },
      onSaved: (value){
        password=value!;
      },
    );

  }

  Widget button(){
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ElevatedButton(

          onPressed: (){
            if(myKey.currentState!.validate()){
              myKey.currentState!.save();
              print(email + password);
            }
          },
          child: Text('Submit')
      ),
    );
  }
  bool isPasswordFine(String? password){

      if (password == null || password.isEmpty) {
        return false;
      }

      bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
      bool hasDigits = password.contains(new RegExp(r'[0-9]'));
      bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
      bool hasSpecialCharacters = password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      bool hasMinLength = password.length > 8;

      return hasDigits & hasUppercase & hasLowercase & hasSpecialCharacters & hasMinLength;

  }

}