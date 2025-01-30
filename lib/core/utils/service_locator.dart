import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:openbook/core/services/api_service.dart';
import 'package:openbook/features/books%20home/data/repo/book_home_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));

  getIt.registerSingleton(BookHomeImpl(apiService: getIt.get<ApiService>()));
}
