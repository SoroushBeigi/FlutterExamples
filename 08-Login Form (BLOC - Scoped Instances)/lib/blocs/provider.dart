import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  Provider({required Key key, required Widget child})
      : super(key: key, child: child);

  final bloc = Bloc();

  @override
  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(aspect: Provider)
            as Provider)
        .bloc;
  }
}
