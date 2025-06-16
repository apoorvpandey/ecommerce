import 'package:ecommerce/presentation/pages/forgot_password_page/forgot_password_page.dart';
import 'package:ecommerce/presentation/pages/sign_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 8,
          children: [
            TextFormField(decoration: InputDecoration(labelText: 'Email')),
            TextFormField(decoration: InputDecoration(labelText: 'Password')),

            Center(
              child: ElevatedButton(onPressed: () {}, child: Text('Login')),
            ),
            Center(
              child: TextButton(
                onPressed: () => Utils.pushToNewRoute(context, SignUpPage()),
                child: Text('Register'),
              ),
            ),
            TextButton(
              onPressed: () =>
                  Utils.pushToNewRoute(context, ForgotPasswordPage()),
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}
