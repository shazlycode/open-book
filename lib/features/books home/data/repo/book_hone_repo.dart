import "package:dartz/dartz.dart";
import "package:openbook/features/books%20home/data/book_model/book_model.dart";

import "../../../../core/services/failur.dart";

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchLatestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeturedBooks();
}
