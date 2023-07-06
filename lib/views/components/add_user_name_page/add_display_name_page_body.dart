import 'package:flutter/material.dart';
import 'package:hometending_recipe/views/components/wrapper/auth_wrapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/provider/auth_provider.dart';

class AddDisplayNamePageBody extends ConsumerStatefulWidget {
  const AddDisplayNamePageBody({super.key});

  @override
  ConsumerState<AddDisplayNamePageBody> createState() =>
      _AddDisplayNamePageBodyState();
}

class _AddDisplayNamePageBodyState
    extends ConsumerState<AddDisplayNamePageBody> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider)!;
    final displayNameController = TextEditingController();
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('add user name'),
              TextField(
                controller: displayNameController,
              ),
              ElevatedButton(
                onPressed: () async {
                  await currentUser
                      .updateDisplayName(displayNameController.text);
                  ref.invalidate(currentUserProvider);
                  if (mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthWrapper(),
                      ),
                    );
                  }
                },
                child: const Text('名前追加'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
