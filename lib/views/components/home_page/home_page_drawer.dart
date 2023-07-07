import 'package:flutter/material.dart';
import 'package:hometending_recipe/views/update_profile_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/firebase/firebase_instance.dart';
import '../../../domain/provider/auth_provider.dart';
import '../../../domain/provider/user_info_provider.dart';

class HomePageDrawer extends ConsumerStatefulWidget {
  const HomePageDrawer({super.key});

  @override
  ConsumerState<HomePageDrawer> createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends ConsumerState<HomePageDrawer> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider)!;
    final currentUserInfo = ref.watch(userInfoStateProvider);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                currentUserInfo != null ? currentUserInfo.nickName : "読み込み失敗",
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle_outlined,
            ),
            title: const Text('プロフィール'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UpdateProfilePage(),
                ),
              );
            },
          ),
          ListTile(
            iconColor: Colors.red,
            textColor: Colors.red,
            leading: const Icon(
              Icons.person_off_outlined,
            ),
            title: const Text('アカウント削除'),
            onTap: () async {
              try {
                currentUser.delete();
              } catch (err) {
                const Text('アカウント削除のため再ログインお願いいたします');
              }
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_outlined,
            ),
            title: const Text('ログアウト'),
            onTap: () async {
              await firebaseAuth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
