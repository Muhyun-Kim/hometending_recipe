import 'package:flutter/material.dart';
import 'package:hometending_recipe/domain/provider/user_info_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../domain/provider/auth_provider.dart';

class MyProfilePage extends ConsumerStatefulWidget {
  const MyProfilePage({super.key});

  @override
  ConsumerState<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends ConsumerState<MyProfilePage> {
  Future<dynamic> _showLogoutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ログアウトしますか？'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('キャンセル'),
            ),
            TextButton(
              /// Todo : ログアウトの処理を書く
              onPressed: () {},
              child: const Text('ログアウト'),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> _showDeleteAccountDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('退会しますか？'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('キャンセル'),
            ),
            TextButton(
              /// Todo : 退会の処理を書く
              onPressed: () {},
              child: const Text('ログアウト'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final myProfile = ref.watch(userInfoStateProvider)!;
    final firebaseAuthCurrentUser = ref.watch(currentUserProvider)!;

    return SettingsList(
      sections: [
        SettingsSection(
          title: const Text('店舗情報'),
          tiles: <SettingsTile>[
            SettingsTile(
              title: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          ClipOval(
                            child: SizedBox(
                              width: 80,
                              child: Image.asset('images/default_profile.png'),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: InkWell(
                              child: SizedBox(
                                width: 24,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.mode_edit_outline_outlined,
                                    color: Colors.black54,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 24, bottom: 24, left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'ニックネーム',
                              style: TextStyle(
                                fontSize: 8,
                                color: Color(0xFF909090),
                              ),
                            ),
                            Text(myProfile.nickName),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: TextButton(
                        /// Todo : 掲載ページに遷移する機能を追加
                        onPressed: () {
                          print('掲載ページを表示');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF1FA2CB),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8.0), // 모서리 둥글기 설정
                          ),
                        ),
                        child: const Text(
                          '自分のレシピ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SettingsSection(
          title: const Text('個人設定'),
          tiles: <SettingsTile>[
            SettingsTile(
              leading: const Icon(Icons.person),
              title: const Text('ニックネーム'),
              value: Text(myProfile.nickName),
            ),
            SettingsTile(
              leading: const Icon(Icons.mail),
              title: const Text('メール'),
              value: Text(firebaseAuthCurrentUser.email!),
            ),
            SettingsTile(
              leading: const Icon(
                Icons.wine_bar_outlined,
              ),
              title: const Text('好きなお酒'),
              value: Text(myProfile.favoriteDrink),
            ),
            SettingsTile(
              leading: const Icon(Icons.person),
              title: const Text('自己紹介'),
              value: Text(myProfile.aboutMe),
            ),
          ],
        ),
        SettingsSection(
          title: const Text('法的表示'),
          tiles: <SettingsTile>[
            SettingsTile(
              title: const Text('利用規約'),
              value: const Icon(Icons.navigate_next_outlined),
            ),
            SettingsTile(
              title: const Text('プライバシーポリシー'),
              value: const Icon(Icons.navigate_next_outlined),
            ),
            SettingsTile(
              title: const Text('ライセンス'),
              value: const Icon(Icons.navigate_next_outlined),
            ),
          ],
        ),
        SettingsSection(
          title: const Text('ログイン'),
          tiles: <SettingsTile>[
            SettingsTile(
              leading: const Icon(Icons.logout_sharp),
              title: const Text('ログアウト'),
              value: const Icon(Icons.navigate_next_outlined),
              onPressed: (context) {
                _showLogoutDialog(context);
              },
            ),
            SettingsTile(
              title: const Text(
                '退会',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              value: const Icon(
                Icons.navigate_next_outlined,
                color: Colors.red,
              ),

              /// Todo : ダイアログでいいかを考える
              onPressed: (context) {
                _showDeleteAccountDialog(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
