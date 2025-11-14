import 'package:chefonline/core/config/app_urls.dart';
import 'package:chefonline/core/services/app_exceptions.dart';
import 'package:chefonline/core/services/http_service.dart';
import 'package:dio/dio.dart';

abstract interface class AuthRemoteDataSource{
       Future<Response> registerUser(Map<String,dynamic> params);
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  @override
  Future<Response> registerUser(Map<String, dynamic> params)async {
    try {
      final Response response = await HttpClientService.instance.get(
        AppUrls.baseUrl,
        queryParams: params,
      );

    return response;
    } catch (error) {
      throw AppException.from(error);
    }

  }

}