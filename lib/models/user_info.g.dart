// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfo _$$_UserInfoFromJson(Map<String, dynamic> json) => _$_UserInfo(
      nickName: json['nickName'] as String,
      favoriteDrink: json['favoriteDrink'] as String,
      aboutMe: json['aboutMe'] as String,
      profileImage: json['profileImage'] as String?,
    );

Map<String, dynamic> _$$_UserInfoToJson(_$_UserInfo instance) =>
    <String, dynamic>{
      'nickName': instance.nickName,
      'favoriteDrink': instance.favoriteDrink,
      'aboutMe': instance.aboutMe,
      'profileImage': instance.profileImage,
    };
