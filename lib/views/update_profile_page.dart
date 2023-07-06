import 'package:flutter/material.dart';
import 'package:hometending_recipe/views/components/update_profile_page/update_profile_page_body.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール'),
      ),
      body: const UpdateProfilePageBody(),
    );
  }
}
