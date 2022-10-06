import 'dart:async';
import 'validator.dart';

class Bloc extends Object with Validator{
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();


  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  dispose(){
    _emailController.close();
    _passwordController.close();
  }

}

final bloc = Bloc();