part of 'latest_books_cubit.dart';

sealed class LatestBooksState extends Equatable {
  const LatestBooksState();

  @override
  List<Object> get props => [];
}

final class LatestBooksInitial extends LatestBooksState {}

final class LatestBooksSuccess extends LatestBooksState {
  final List<BookModel> books;

  const LatestBooksSuccess({required this.books});

  @override
  List<Object> get props => [books];
}

final class LatestBooksLoading extends LatestBooksState {}

final class LatestBooksFailure extends LatestBooksState {
  final String errorMessage;

  const LatestBooksFailure({required this.errorMessage});
}
