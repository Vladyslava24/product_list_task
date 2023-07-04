import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthApi {
  Future<bool> signIn(String userName, String password) async {
    final response = await http.post(
      Uri.https(
        'fakestoreapi.com',
        '/auth/login',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'username': userName,
          'password': password,
        },
      ),
    );
    final isSignIn = response.statusCode == 200;
    return isSignIn;
  }
}
