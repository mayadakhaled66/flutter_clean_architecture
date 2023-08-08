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

  @override
  Future<Response> executeGetRequest(String endPointPath,
      {dynamic headers}) async {
    try {
      final response = await dio.get(ApiConstants.baseUrl + endPointPath);
      print(response.data);
      if(response.statusCode == ApiStatus.success.value){
        return response;
      }else{
        throw Failure(AppStrings.apiFailureMessage);
      }

    } catch (error) {
      throw Failure(error.toString());
    }
  }

  @override
  Future<Response> executePostRequest(
      String endPointPath, headers, body) async {
    try {
      final response =
          await dio.post(ApiConstants.baseUrl + endPointPath, data: body);
      print(response.data);
      if(response.statusCode == ApiStatus.success.value){
        return response;
      }else{
        throw Failure(AppStrings.apiFailureMessage);
      }

    } catch (error) {
      throw Failure(error.toString());
    }
  }
}
