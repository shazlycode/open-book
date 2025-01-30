import 'package:dio/dio.dart';

import '../conistants/constants.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final respone = await dio.get("$baseUrl$endpoint");
      return respone.data;
    } on Exception catch (e) {
      rethrow;
    }
  }
}
