// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      isAdmin: json['is_admin'] as bool?,
      isDriver: json['is_driver'] as bool?,
      isClient: json['is_client'] as bool?,
      username: json['username'] as String?,
    )..relationships = json['relationships'] as Map<String, dynamic>?;

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('relationships', instance.relationships);
  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('username', instance.username);
  writeNotNull('is_admin', instance.isAdmin);
  writeNotNull('is_driver', instance.isDriver);
  writeNotNull('is_client', instance.isClient);
  return val;
}
