

import 'package:flutter/Material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class FormViewModel extends ChangeNotifier {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  var showPassword=true;

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if(!RegExp('[a-zA-Z]').hasMatch(value)){
      return 'Enter valid name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if(!RegExp(r'[a-z]+@[a-z]+.[a-z]+').hasMatch(value)){
      return 'Enter valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
      return 'Password should be 8 characters long, one uppercase, \n one lowercase, one digit and one special character';
    }
    return null;
  }

  bool? toggle(){
    showPassword=!showPassword;
    notifyListeners();
  }

  void submitForm() {
    if (formKey.currentState!.saveAndValidate()) {
      // Do something with the form data
      print(formKey.currentState!.value);
    }
  }
}