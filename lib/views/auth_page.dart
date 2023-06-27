import 'package:flutter/material.dart';
import 'package:hometending_recipe/views/components/auth_page/auth_page_body.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthPage'),
      ),
      body: const AuthPageBody(),
    );
  }
}
