import 'package:chefonline/features/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:chefonline/features/auth/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<Response> registerUser(Map<String, dynamic> params) {
    return authRemoteDataSource.registerUser(params);
  }
  
}