

import 'package:chefonline/features/auth/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<Response> call(Map<String, dynamic> params) async {
    return repository.registerUser(params);
  }
}