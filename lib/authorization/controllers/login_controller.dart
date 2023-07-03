import 'package:flutter/foundation.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginController extends ChangeNotifier {
  late final form = FormGroup({
    'userName': FormControl<String>(
      validators: [
        Validators.required,
        Validators.maxLength(250),
      ],
    ),
    'password': FormControl<String>(
      validators: [
        Validators.required,
        Validators.maxLength(250),
      ],
    ),
  });

  bool isObscure = true;

  void changeIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }
}
