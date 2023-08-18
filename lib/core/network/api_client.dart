import 'package:dio/dio.dart';
import 'package:flutter_clean_archticture/core/Error/Failure.dart';
import 'package:flutter_clean_archticture/core/network/api_constants.dart';
import 'package:flutter_clean_archticture/core/utilities/app_strings.dart';

abstract class BaseNetworkManager {
  Future<Response> executeGetRequest(
    String endPointPath, {
    dynamic headers,
  });

  Future<Response> executePostRequest(
      String endPointPath, dynamic headers, dynamic body);
}

class NetworkManager implements BaseNetworkManager {
  final dio = Dio();

  NetworkManager() {
    dio.interceptors.add(LogInterceptor(
        request: true,
        error: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        requestHeader: true));
  }

  @override
  Future<Response> executeGetRequest(String endPointPath,
      {dynamic headers}) async {
    try {
      final response = await dio.get(endPointPath,options: Options(sendTimeout: const Duration(seconds: 10),receiveTimeout: const Duration(seconds: 10) ));
      if (response.statusCode == ApiStatus.success.value) {
        return response;
      } else {
        throw ServerFailure(AppStrings.apiFailureMessage);
      }
    } on DioException catch (error) {
      throw ServerFailure(error.message.toString());
    } on Exception catch (error){
      throw ServerFailure(error.toString());
    }
  }

  @override
  Future<Response> executePostRequest(
      String endPointPath, headers, body) async {
    try {
      final response =
          await dio.post(endPointPath, data: body);
      if (response.statusCode == ApiStatus.success.value) {
        return response;
      } else {
        throw ServerFailure(AppStrings.apiFailureMessage);
      }
    } catch (error) {
      throw ServerFailure(error.toString());
    }
  }
}
