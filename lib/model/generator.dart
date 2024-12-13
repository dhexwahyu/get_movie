import 'dart:convert';

import 'package:get_movie/model/user.dart';

import 'auth.dart';



typedef S ItemCreator<S>();

class ModelGenerator {
  static ModelGenerator instance = ModelGenerator();
  get classes {
    return {
      Auth: (json) => Auth.fromJson(json),
      User: (json) => User.fromJson(json),

    };
  }

  static T? resolve<T>(Map<String, dynamic>? json) {
    if (instance.classes[T] == null)
      throw "Type $T not found. Make sure it's registered on model generators";
    return instance.classes[T](json);
  }
}
