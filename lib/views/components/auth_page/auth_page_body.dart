import 'package:flutter/material.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 240,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(320, 40),
                  ),
                ),
                child: const Text("mail login"),
              ),
              const Text("又は"),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(320, 40),
                  ),
                ),
                child: const Text("login with google"),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(320, 40),
                  ),
                ),
                child: const Text("login with apple"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
