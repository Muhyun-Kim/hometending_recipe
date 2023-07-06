import 'package:flutter/material.dart';
import 'package:hometending_recipe/views/components/create_account_page/create_account_page_body.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("アカウント作成"),
      ),
      body: CreateAccountPageBody(),
    );
  }
}
