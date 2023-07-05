import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hometending_recipe/views/create_account_page.dart';

import '../../../domain/firebase/firebase_login.dart';

class AuthPageBody extends HookWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isObscureText = useState(true);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: SizedBox(
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        isObscureText.value = !isObscureText.value;
                      },
                      icon: Icon(
                        isObscureText.value == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  obscureText: isObscureText.value,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    FirebaseLogin()
                        .signInWithEmail(emailController, passwordController);
                  },
                  child: const Text('Login'),
                ),
                const Text("又は"),
                ElevatedButton(
                  onPressed: () {
                    FirebaseLogin().signInWithGoogle();
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(320, 40),
                    ),
                  ),
                  child: const Text("login with google"),
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseLogin().signInWithApple();
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(320, 40),
                    ),
                  ),
                  child: const Text("login with apple"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountPage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(320, 40),
                    ),
                  ),
                  child: const Text("アカウント作成"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
