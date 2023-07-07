import 'package:flutter/material.dart';
import 'package:hometending_recipe/views/components/add_user_name_page/add_display_name_page_body.dart';

class AddDisplayNamePage extends StatelessWidget {
  const AddDisplayNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add display name page'),
      ),
      body: const AddDisplayNamePageBody(),
    );
  }
}
