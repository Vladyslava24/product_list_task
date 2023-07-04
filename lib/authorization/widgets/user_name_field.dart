import 'package:flutter/material.dart';
import 'package:product_list_task/authorization/controllers/login_controller.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: 'userName',
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        hintText: 'User name',
        hintStyle: TextStyle(
          color: Color(0xFF9D9D9D),
          fontSize: 14,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF158A8A),
            width: 1.5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF158A8A),
            width: 1.5,
          ),
        ),
      ),
      validationMessages: {
        ValidationMessage.required: (_) => 'User name is required',
        ValidationMessage.maxLength: (_) =>
            'User name cannot have more than 250 symbols',
      },
      onChanged: (control) {
        context.read<LoginController>().userName = control.value.toString();
        control.markAsTouched();
      },
    );
  }
}
