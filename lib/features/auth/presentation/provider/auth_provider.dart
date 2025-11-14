


import 'package:chefonline/core/common/custom_toast.dart';
import 'package:chefonline/features/auth/domain/usecase/register_user_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final RegisterUser registerUser;

  AuthProvider(this.registerUser);

  bool isLoadingRegister = false;
  String? registerUserMessage;

  Future<Response> userRegister(BuildContext context,Map<String, dynamic> params) async {
    try {
      isLoadingRegister = true;
      notifyListeners();
      final Response result = await registerUser(params);
      return result;
    } catch (e) {
      registerUserMessage = e.toString();
      rethrow;
    } finally {
      isLoadingRegister = false;
      notifyListeners();
    }
  }


}