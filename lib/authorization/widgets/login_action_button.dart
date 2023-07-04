import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginActionButton extends StatelessWidget {
  const LoginActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => context.go('/home'),
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFF158A8A),
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: const Text(
        'Log In',
        style: TextStyle(
          color: Color(0xFFF3F3F3),
          fontSize: 14,
        ),
      ),
    );
  }
}
