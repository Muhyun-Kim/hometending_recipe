import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hometending_recipe/views/create_account_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/firebase/firebase_login.dart';

class AuthPageBody extends HookConsumerWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscureText = useState(true);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    height: 48,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        FirebaseLogin().signInWithEmail(
                            emailController, passwordController);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'ログイン',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const Text(
                  "又は",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    height: 48,
                    width: 360,
                    child: ElevatedButton(
                      onPressed: () {
                        FirebaseLogin().signInWithGoogle();
                      },
                      child: const Text(
                        "googleログイン",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48,
                  width: 360,
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseLogin().signInWithApple();
                    },
                    child: const Text(
                      "appleログイン",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountPage(),
                      ),
                    );
                  },
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
