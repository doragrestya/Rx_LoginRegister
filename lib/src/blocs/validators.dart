import 'dart:async';
import 'dart:math';

import 'package:rx_logreg/src/screens/register_screen.dart';

class Validators{
  final validateEmail =
  StreamTransformer<String, String>.fromHandlers(handleData:
  (email, sink) {
    if(email.contains('@')){
      sink.add(email);
    } else{
      sink.addError('Isilah email anda dengan benar');
    }
  });
  final validatePassword = StreamTransformer<String,
      String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length <= 6){
        sink.add(password);
  } else {
        sink.addError('maksimal password 6 karakter');
  }
  });
  final validateName = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink){
      if(name.isEmpty){
        sink.addError('Nama Lengkap Harus Diisi');
      } else{
        sink.add(name);
      }
    }
  );

}