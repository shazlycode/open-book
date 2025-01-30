import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openbook/features/books%20home/presentation/view%20model/latest%20books%20cubit/latest_books_cubit.dart';

import 'latest_book_item_headder.dart';

class LatestBooksList extends StatelessWidget {
  const LatestBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: BlocBuilder<LatestBooksCubit, LatestBooksState>(
          builder: (context, state) {
            if (state is LatestBooksSuccess) {
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return LatestBookItemHeadder(book: state.books[index]);
                  });
            } else if (state is LatestBooksFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state is LatestBooksLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Text("No data available, try later"),
              );
            }
          },
        ),
      ),
    );
  }
}
