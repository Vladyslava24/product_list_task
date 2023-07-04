import 'package:flutter/material.dart';
import 'package:product_list_task/authorization/controllers/login_controller.dart';
import 'package:product_list_task/authorization/widgets/login_action_button.dart';
import 'package:product_list_task/authorization/widgets/login_failed_text.dart';
import 'package:product_list_task/authorization/widgets/password_field.dart';
import 'package:product_list_task/authorization/widgets/user_name_field.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    context.read<LoginController>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReactiveForm(
        formGroup: context.read<LoginController>().form,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'eComerce',
                style: TextStyle(
                  fontSize: 46,
                ),
              ),
              SizedBox(height: 50),
              UserNameField(),
              SizedBox(height: 20),
              PasswordField(),
              LoginFailedText(),
              SizedBox(height: 40),
              LoginActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}
