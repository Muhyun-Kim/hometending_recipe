import 'package:flutter/material.dart';
import 'package:hometending_recipe/models/user_info_model.dart';
import 'package:hometending_recipe/views/components/home_page/home_page_body.dart';
import 'package:hometending_recipe/views/components/home_page/home_page_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/provider/auth_provider.dart';
import '../domain/provider/user_info_provider.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future(() async {
      final customizedUserInfo = await ref.read(userInfoProvider).getUserInfo();
      ref.read(userInfoStateProvider.notifier).state = customizedUserInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    final customizedUserInfoProvider = ref.watch(userInfoProvider);
    final currentUser = ref.watch(currentUserProvider)!;
    //カスタマイズされたユーザー情報がない場合は、ユーザー情報を追加する
    customizedUserInfoProvider.customizedUserInfo.listen((event) {
      if (event.data() == null) {
        final newUserInfo = UserInfoModel(
          nickName: currentUser.displayName!,
          favoriteDrink: "",
          aboutMe: "",
          profileImage: "",
        );
        customizedUserInfoProvider.addUserInfo(newUserInfo);
        ref.read(userInfoStateProvider.notifier).state = newUserInfo;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: const HomePageBody(),
      drawer: const HomePageDrawer(),
    );
  }
}
