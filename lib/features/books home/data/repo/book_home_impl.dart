import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:openbook/core/services/api_service.dart';
import 'package:openbook/core/services/failur.dart';
import 'package:openbook/features/books%20home/data/book_model/book_model.dart';
import 'package:openbook/features/books%20home/data/repo/book_hone_repo.dart';

class BookHomeImpl implements HomeRepo {
  final ApiService apiService;

  BookHomeImpl({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> fetchLatestBooks() async {
    try {
      final data =
          await apiService.get("v1/volumes?q=programming&orderBy=newest");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioException(e));
      } else {
        return left(ServerError(errorMessage: "errorMessage"));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeturedBooks() async {
    try {
      final data = await apiService.get("v1/volumes?q=programming");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioException(e));
      } else {
        return left(ServerError(errorMessage: "errorMessage"));
      }
    }
  }
}
