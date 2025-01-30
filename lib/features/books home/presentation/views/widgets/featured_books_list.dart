import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openbook/features/books%20home/presentation/view%20model/featured%20books%20cubit/featured_books_cubit.dart';

import 'featured_book_item.dart';

class FeaturedBooksList extends StatelessWidget {
  const FeaturedBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return FeaturedBookItem(book: state.books[index]);
          }, childCount: state.books.length));
        } else if (state is FeaturedBooksFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errorMessage),
            ),
          );
        } else if (state is FeaturedBooksLoading) {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return SliverToBoxAdapter(child: Text("No data avilable, try later"));
        }
      },
    );
  }
}
