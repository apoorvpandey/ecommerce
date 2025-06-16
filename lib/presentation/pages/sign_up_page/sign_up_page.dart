import 'package:ecommerce/presentation/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 8,
          children: [
            TextFormField(decoration: InputDecoration(labelText: 'Email')),
            TextFormField(decoration: InputDecoration(labelText: 'Password')),

            Center(
              child: TextButton(onPressed: () {}, child: Text('Sign Up')),
            ),
            TextButton(
              onPressed: () {
                Utils.pushToNewRoute(context, LoginPage());
              },
              child: Text('Already have an account? Login now'),
            ),
          ],
        ),
      ),
    );
  }
}
