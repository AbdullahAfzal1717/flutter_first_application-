import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: const Center(
        child: Text(
          'Contact the Lab 6 team at lab6@example.com.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
