import 'package:flutter/material.dart';
import 'package:hometending_recipe/domain/provider/auth_state_provider.dart';
import 'package:hometending_recipe/views/auth_page.dart';
import 'package:hometending_recipe/views/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authStateProvider);
    return authStateAsync.when(
      data: (user) => user != null ? const HomePage() : const AuthPage(),
      loading: () => const Text("aa"),
      error: (err, stack) => Text("Error: $err"),
    );
  }
}
