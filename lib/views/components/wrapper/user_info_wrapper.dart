import 'package:flutter/src/widgets/framework.dart';
import 'package:hometending_recipe/domain/provider/auth_provider.dart';
import 'package:hometending_recipe/models/user_info_model.dart';
import 'package:hometending_recipe/views/add_user_name_page.dart';
import 'package:hometending_recipe/views/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserInfoWrapper extends ConsumerWidget {
  const UserInfoWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider)!;
    if (currentUser.displayName != null) {
      return const HomePage();
    } else {
      return const AddDisplayNamePage();
    }
  }
}
