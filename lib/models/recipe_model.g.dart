// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeModel _$$_RecipeModelFromJson(Map<String, dynamic> json) =>
    _$_RecipeModel(
      userUid: json['userUid'] as String,
      userName: json['userName'] as String,
      createdAt: json['createdAt'] as String,
      ingredient: (json['ingredient'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      howToMake: json['howToMake'] as String,
      cocktailName: json['cocktailName'] as String,
      like: json['like'] as int,
    );

Map<String, dynamic> _$$_RecipeModelToJson(_$_RecipeModel instance) =>
    <String, dynamic>{
      'userUid': instance.userUid,
      'userName': instance.userName,
      'createdAt': instance.createdAt,
      'ingredient': instance.ingredient,
      'howToMake': instance.howToMake,
      'cocktailName': instance.cocktailName,
      'like': instance.like,
    };
