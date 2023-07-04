// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) {
  return _UserInfoModel.fromJson(json);
}

/// @nodoc
mixin _$UserInfoModel {
  String get nickName => throw _privateConstructorUsedError;
  String get favoriteDrink => throw _privateConstructorUsedError;
  String get aboutMe => throw _privateConstructorUsedError;
  String get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoModelCopyWith<UserInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoModelCopyWith<$Res> {
  factory $UserInfoModelCopyWith(
          UserInfoModel value, $Res Function(UserInfoModel) then) =
      _$UserInfoModelCopyWithImpl<$Res, UserInfoModel>;
  @useResult
  $Res call(
      {String nickName,
      String favoriteDrink,
      String aboutMe,
      String profileImage});
}

/// @nodoc
class _$UserInfoModelCopyWithImpl<$Res, $Val extends UserInfoModel>
    implements $UserInfoModelCopyWith<$Res> {
  _$UserInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickName = null,
    Object? favoriteDrink = null,
    Object? aboutMe = null,
    Object? profileImage = null,
  }) {
    return _then(_value.copyWith(
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteDrink: null == favoriteDrink
          ? _value.favoriteDrink
          : favoriteDrink // ignore: cast_nullable_to_non_nullable
              as String,
      aboutMe: null == aboutMe
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInfoModelCopyWith<$Res>
    implements $UserInfoModelCopyWith<$Res> {
  factory _$$_UserInfoModelCopyWith(
          _$_UserInfoModel value, $Res Function(_$_UserInfoModel) then) =
      __$$_UserInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nickName,
      String favoriteDrink,
      String aboutMe,
      String profileImage});
}

/// @nodoc
class __$$_UserInfoModelCopyWithImpl<$Res>
    extends _$UserInfoModelCopyWithImpl<$Res, _$_UserInfoModel>
    implements _$$_UserInfoModelCopyWith<$Res> {
  __$$_UserInfoModelCopyWithImpl(
      _$_UserInfoModel _value, $Res Function(_$_UserInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickName = null,
    Object? favoriteDrink = null,
    Object? aboutMe = null,
    Object? profileImage = null,
  }) {
    return _then(_$_UserInfoModel(
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteDrink: null == favoriteDrink
          ? _value.favoriteDrink
          : favoriteDrink // ignore: cast_nullable_to_non_nullable
              as String,
      aboutMe: null == aboutMe
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInfoModel implements _UserInfoModel {
  _$_UserInfoModel(
      {required this.nickName,
      required this.favoriteDrink,
      required this.aboutMe,
      required this.profileImage});

  factory _$_UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoModelFromJson(json);

  @override
  final String nickName;
  @override
  final String favoriteDrink;
  @override
  final String aboutMe;
  @override
  final String profileImage;

  @override
  String toString() {
    return 'UserInfoModel(nickName: $nickName, favoriteDrink: $favoriteDrink, aboutMe: $aboutMe, profileImage: $profileImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfoModel &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.favoriteDrink, favoriteDrink) ||
                other.favoriteDrink == favoriteDrink) &&
            (identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nickName, favoriteDrink, aboutMe, profileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoModelCopyWith<_$_UserInfoModel> get copyWith =>
      __$$_UserInfoModelCopyWithImpl<_$_UserInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoModelToJson(
      this,
    );
  }
}

abstract class _UserInfoModel implements UserInfoModel {
  factory _UserInfoModel(
      {required final String nickName,
      required final String favoriteDrink,
      required final String aboutMe,
      required final String profileImage}) = _$_UserInfoModel;

  factory _UserInfoModel.fromJson(Map<String, dynamic> json) =
      _$_UserInfoModel.fromJson;

  @override
  String get nickName;
  @override
  String get favoriteDrink;
  @override
  String get aboutMe;
  @override
  String get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoModelCopyWith<_$_UserInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
