import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openbook/features/books%20home/data/repo/book_home_impl.dart';

import '../../../data/book_model/book_model.dart';
part 'latest_books_state.dart';

class LatestBooksCubit extends Cubit<LatestBooksState> {
  LatestBooksCubit(this.bookHomeImpl) : super(LatestBooksInitial());
  final BookHomeImpl bookHomeImpl;

  Future fetchLatestBooks() async {
    emit(LatestBooksLoading());
    final result = await bookHomeImpl.fetchLatestBooks();
    result.fold((failure) {
      emit(LatestBooksFailure(errorMessage: failure.errorMessage));
    }, (books) {
      emit(LatestBooksSuccess(books: books));
    });
  }
}
