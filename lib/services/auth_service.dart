

import 'package:get_movie/services/base_service.dart';

import '../env.dart';
import '../model/auth.dart';

class AuthService extends BaseService {
  static AuthService instance = AuthService();
  Future<Auth?> login(String username, String password) async {
    return post('login', body: {
      "client_id":  environment['client_id'],
      "client_secret": environment['client_secret'],
      "grant_type": "password",
      "username": username,
      "password":  password
    });
  }
}
