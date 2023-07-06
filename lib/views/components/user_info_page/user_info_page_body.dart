import 'package:flutter/material.dart';

class UserInfoPageBody extends StatelessWidget {
  const UserInfoPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const TextField(
                decoration: InputDecoration(
                  label: Text("ニックネーム"),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  label: Text("好きなお酒"),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  label: Text("自己紹介"),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("次へ"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
