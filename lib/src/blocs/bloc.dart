import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  final _nameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Add data to stream
  Stream<String> get name => _nameController.stream.transform(validateName);
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream <bool> get submitValid => Observable.combineLatest2(email, password, (e,p) => true);
  Stream<bool> get registerButton => Observable.combineLatest2(email, password, (e,p) => true);

//change data
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  submit() {
    final validName = _nameController.value;
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    print('Your Name is $validName, Email is $validEmail, and password is $validPassword');
  }

  dispose() {
    _nameController.close();
    _emailController.close();
    _passwordController.close();
  }
}
