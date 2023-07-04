import 'package:flutter/foundation.dart';
import 'package:product_list_task/api/auth/auth_api.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginController extends ChangeNotifier {
  LoginController(this._authApi);

  final AuthApi _authApi;

  String? userName;
  String? password;

  bool lastLoginAttemptFailed = false;
  bool isLoading = false;

  void init() {
    lastLoginAttemptFailed = false;
    userName = null;
    password = null;
  }

  Future<void> login(Function? onLoggedIn) async {
    lastLoginAttemptFailed = false;
    notifyListeners();
    if (userName == null || password == null) return;
    final isSignedIn = await _authApi.signIn(userName!, password!);
    isSignedIn ? onLoggedIn?.call() : lastLoginAttemptFailed = true;
    notifyListeners();
  }

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
