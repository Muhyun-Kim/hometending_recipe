import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

//ユーザー認証が終わった後、ユーザー情報を取得するためのモデル
@freezed
class UserInfoModel with _$UserInfoModel {
  factory UserInfoModel({
    required String nickName,
    required String favoriteDrink,
    required String aboutMe,
    required String profileImage,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
}
