import 'package:flutter/material.dart';
import 'package:product_list_task/authorization/controllers/login_controller.dart';
import 'package:provider/provider.dart';

class LoginFailedText extends StatelessWidget {
  const LoginFailedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        context.select(
          (LoginController controller) => controller.lastLoginAttemptFailed,
        )
            ? 'Login credentials are incorrect'
            : '',
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}
