import 'package:dio/dio.dart';

class ApiClient {
  static final Dio dio = Dio(BaseOptions(baseUrl: 'https://viacep.com.br/ws/'));

  static Future<Response> getCep(String cep) async {
    final response = await dio.get('$cep/json/');
    return response;
  }
}
