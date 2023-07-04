import 'package:flutter/material.dart';
import 'package:product_list_task/authorization/controllers/login_controller.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final isObscure =
        context.select((LoginController controller) => controller.isObscure);
    return ReactiveTextField(
      formControlName: 'password',
      keyboardType: TextInputType.visiblePassword,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: const TextStyle(
          color: Color(0xFF9D9D9D),
          fontSize: 14,
        ),
        counterText: 'Forgot password',
        counterStyle: const TextStyle(
          color: Color(0xFF158A8A),
          fontSize: 12,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF158A8A),
            width: 1.5,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF158A8A),
            width: 1.5,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility_off_rounded : Icons.visibility_rounded,
          ),
          onPressed: context.read<LoginController>().changeIsObscure,
        ),
        suffixIconColor: const Color(0xFF9D9D9D),
      ),
      validationMessages: {
        ValidationMessage.required: (_) => 'Password is required',
        ValidationMessage.maxLength: (_) =>
            'Password cannot have more than 250 symbols',
      },
      onChanged: (control) {
        context.read<LoginController>().password = control.value.toString();
        control.markAsTouched();
      },
    );
  }
}
