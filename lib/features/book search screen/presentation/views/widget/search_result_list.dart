import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openbook/features/book%20search%20screen/presentation/view%20model/cubit/search_cubit.dart';
import 'package:openbook/features/books%20home/data/book_model/book_model.dart';
import 'package:openbook/features/books%20home/presentation/view%20model/latest%20books%20cubit/latest_books_cubit.dart';
import 'package:openbook/features/books%20home/presentation/views/widgets/featured_book_item.dart';

class SearchReultList extends StatelessWidget {
  const SearchReultList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestBooksCubit, LatestBooksState>(
        builder: (context, latstBooksState) {
      if (latstBooksState is LatestBooksSuccess) {
        return BlocBuilder<SearchCubit, SearchState>(
            builder: (context, searchState) {
          if (searchState is SearchText) {
            List<BookModel> filteredBooks = searchState.searchText.isEmpty
                ? latstBooksState.books
                : latstBooksState.books
                    .where((book) => book.volumeInfo!.title!
                        .toLowerCase()
                        .contains(searchState.searchText.toLowerCase()))
                    .toList();
            return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return FeaturedBookItem(
                book: filteredBooks[index],
              );
            }, childCount: filteredBooks.length));
          }
          return SliverToBoxAdapter(
            child: Container(),
          );
        });
      }
      return SliverToBoxAdapter(
        child: Container(),
      );
    });
  }
}
