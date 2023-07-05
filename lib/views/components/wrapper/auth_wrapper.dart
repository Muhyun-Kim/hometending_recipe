import 'package:flutter/material.dart';
import 'package:hometending_recipe/domain/provider/auth_provider.dart';
import 'package:hometending_recipe/views/auth_page.dart';
import 'package:hometending_recipe/views/components/wrapper/user_info_wrapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authStateProvider);
    return authStateAsync.when(
      data: (user) => user != null ? const UserInfoWrapper() : const AuthPage(),
      loading: () => const Text("Loading"),
      error: (err, stack) => Text("Error: $err"),
    );
  }
}
