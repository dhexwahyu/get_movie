
import 'package:get_movie/model/base.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';
part 'auth.g.dart';

@JsonSerializable()
class Auth extends BaseModel<Auth> {
  final String? accessToken;
  final int? expiresIn;
  final String? refreshToken;
  final String? tokenType;
  User? user;

  Auth(
      {this.accessToken,
      this.expiresIn,
      this.refreshToken,
      this.tokenType,
      this.user});
  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
  Map<String, dynamic> toJson() => _$AuthToJson(this);

  @override
  Auth fromMap(Map<String, dynamic> map) {
    return Auth.fromJson(map);
  }

  bool hasValidToken() {
    return accessToken != null && accessToken != '';
  }

  @override
  Map<String, RelationshipMapper> relationshipMapper() {
    // TODO: implement relationshipMapper
    return {};
  }
}
