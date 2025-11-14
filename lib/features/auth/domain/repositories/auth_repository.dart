
import 'package:dio/dio.dart';

abstract interface class AuthRepository{
   Future<Response> registerUser(Map<String,dynamic> params);
}