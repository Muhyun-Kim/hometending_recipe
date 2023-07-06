import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hometending_recipe/domain/firebase/firebase_instance.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseLogin {
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await firebaseAuth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithApple() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );
    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  Future<void> signInWithEmail(TextEditingController emailController,
      TextEditingController passwordController) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // ログイン成功
      User? user = userCredential.user;
      print('Logged in: ${user!.email}');
    } catch (e) {
      print('Error during login: $e');
    }
  }

  Future<void> registerWithEmail(TextEditingController emailController,
      TextEditingController passwordController) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // アカウント作成成功
      User? user = userCredential.user;
      print('Registered: ${user!.email}');
    } catch (e) {
      print('Error during registration: $e');
    }
  }
}
