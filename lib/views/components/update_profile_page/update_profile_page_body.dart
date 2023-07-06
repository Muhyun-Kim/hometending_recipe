import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hometending_recipe/domain/provider/user_info_provider.dart';
import 'package:hometending_recipe/models/user_info_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdateProfilePageBody extends StatefulHookConsumerWidget {
  const UpdateProfilePageBody({super.key});

  @override
  ConsumerState<UpdateProfilePageBody> createState() =>
      _UpdateProfilePageBodyState();
}

class _UpdateProfilePageBodyState extends ConsumerState<UpdateProfilePageBody> {
  @override
  Widget build(BuildContext context) {
    final currentUserInfo = ref.watch(userInfoStateProvider)!;
    final customizedUserInfoProvider = ref.read(userInfoProvider);
    final aboutMeController =
        useTextEditingController(text: currentUserInfo.aboutMe);
    final favoriteDrinkController =
        useTextEditingController(text: currentUserInfo.favoriteDrink);
    final nickNameController =
        useTextEditingController(text: currentUserInfo.nickName);

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: nickNameController,
              ),
              TextField(
                controller: favoriteDrinkController,
              ),
              TextField(
                controller: aboutMeController,
              ),
              ElevatedButton(
                onPressed: () async {
                  final newUserInfo = UserInfoModel(
                    nickName: nickNameController.text,
                    favoriteDrink: favoriteDrinkController.text,
                    aboutMe: aboutMeController.text,
                    profileImage: currentUserInfo.profileImage,
                  );
                  customizedUserInfoProvider.editUserInfo(newUserInfo);
                  final customizedUserInfo =
                      await ref.read(userInfoProvider).getUserInfo();
                  ref.read(userInfoStateProvider.notifier).state =
                      customizedUserInfo;
                  if (mounted) {
                    Navigator.pop(context);
                  }
                },
                child: const Text('更新'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
