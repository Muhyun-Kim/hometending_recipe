import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hometending_recipe/domain/firebase/firebase_login.dart';

class CreateAccountPageBody extends HookWidget {
  const CreateAccountPageBody({super.key});

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
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: emailController,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: TextFormField(
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
                    controller: passwordController,
                    obscureText: isObscureText.value,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseLogin()
                        .registerWithEmail(emailController, passwordController);
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
