import 'dart:async';

class Validator{
  final emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
      if(email.contains('@')){
        sink.add(email);
      }
      else{
        sink.addError('not valid');
      }
    }
  );
  final passwordValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (pass,sink){
      if(pass.length>5){
        sink.add(pass);
      }
      else{
      sink.addError('too short');
      }
    }
  );
}