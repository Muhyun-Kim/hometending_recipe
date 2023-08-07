import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hometending_recipe/domain/provider/user_info_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyProfilePage extends ConsumerStatefulWidget {
  const MyProfilePage({super.key});

  @override
  ConsumerState<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends ConsumerState<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    File? image;
    void _pickNewProfileImage() {
      print("pick new profile image");
    }

    final myProfile = ref.watch(userInfoStateProvider)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: _pickNewProfileImage,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(myProfile.nickName),
          Text(myProfile.favoriteDrink),
          Text(myProfile.aboutMe),
        ],
      ),
    );
  }
}
