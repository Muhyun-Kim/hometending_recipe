import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hometending_recipe/models/user_info_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../firebase/firebase_instance.dart';

final userInfoStateProvider = StateProvider<UserInfoModel?>((ref) => null);

final userInfoProvider = Provider((ref) => CustomizedUserInfo());

class CustomizedUserInfo {
  final userDocument =
      firestore.collection('userInfo').doc(firebaseAuth.currentUser!.uid);

  Stream get customizedUserInfo => firestore
      .collection('userInfo')
      .doc(firebaseAuth.currentUser!.uid)
      .snapshots();

  Future<UserInfoModel?> getUserInfo() async {
    String uid = firebaseAuth.currentUser!.uid;
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('userInfo').doc(uid).get();
    final userInfo = snapshot.data()!;
    return UserInfoModel(
        nickName: userInfo['nickName'],
        favoriteDrink: userInfo['favoriteDrink'],
        aboutMe: userInfo['aboutMe'],
        profileImage: userInfo['profileImage']);
  }

  Future<bool> addUserInfo(UserInfoModel userInfo) async {
    try {
      await userDocument.set(userInfo.toJson());
      return true;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> editUserInfo(UserInfoModel userInfo) async {
    try {
      await userDocument.update(userInfo.toJson());
      return true;
    } catch (e) {
      return Future.error(e);
    }
  }
}


