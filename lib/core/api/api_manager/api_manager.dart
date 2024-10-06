import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce_app/core/utils/constants/constants.dart';
@singleton
class ApiManger {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: ConstantsManager.baseUrl,
    ));
  }

  Future<Response> getRequest(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.get(
      endPoint,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response> postRequest(
      {required String endPoint, Map<String, dynamic>? data}) async {
    var response = await dio.post(endPoint, data: data);
    return response;
  }
}
