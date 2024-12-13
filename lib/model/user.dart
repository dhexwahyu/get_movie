
import 'package:get_movie/model/base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseModel<User> {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final bool? isAdmin;
  final bool? isDriver;
  final bool? isClient;

  User(
      {this.id,
        this.name,
        this.email,
        this.isAdmin,
        this.isDriver,
        this.isClient,
        this.username
      });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  User fromMap(Map<String, dynamic> map) {
    return User.fromJson(map);
  }

  @override
  Map<String, RelationshipMapper> relationshipMapper() {
    // TODO: implement relationshipMapper
    return {
      'driver' : (json) => User.fromJson(json!),
      'client' : (json) => User.fromJson(json!),
    };
  }

  User? getDriver() {
    return relationships!['driver'] ?? null;
  }

  User? getClient() {
    return relationships!['client'] ?? null;
  }
}