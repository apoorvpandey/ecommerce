import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 8,
          children: [
            TextFormField(decoration: InputDecoration(labelText: 'Email')),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Send reset link'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
