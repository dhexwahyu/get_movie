// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) => Auth(
      accessToken: json['access_token'] as String?,
      expiresIn: json['expires_in'] as int?,
      refreshToken: json['refresh_token'] as String?,
      tokenType: json['token_type'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    )..relationships = json['relationships'] as Map<String, dynamic>?;

Map<String, dynamic> _$AuthToJson(Auth instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('relationships', instance.relationships);
  writeNotNull('access_token', instance.accessToken);
  writeNotNull('expires_in', instance.expiresIn);
  writeNotNull('refresh_token', instance.refreshToken);
  writeNotNull('token_type', instance.tokenType);
  writeNotNull('user', instance.user?.toJson());
  return val;
}
