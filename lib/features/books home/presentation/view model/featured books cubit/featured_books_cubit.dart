import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openbook/features/books%20home/data/book_model/book_model.dart';
import 'package:openbook/features/books%20home/data/repo/book_home_impl.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.bookHomeImpl) : super(FeaturedBooksInitial());
  final BookHomeImpl bookHomeImpl;

  Future fetchFeturedBooks() async {
    emit(FeaturedBooksLoading());
    final result = await bookHomeImpl.fetchFeturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailure(errorMessage: failure.errorMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books: books));
    });
  }
}
