import 'package:flutter/material.dart';

import 'custom_books_home_app_bart.dart';
import 'featured_books_list.dart';
import 'latest_books_list.dart';

class BooksHomeBody extends StatelessWidget {
  const BooksHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            CustomBooksScreenAppBar(),
            // LatestBookText(),
            LatestBooksList(),
            FeaturedBooksList(),
          ],
        ),
      ),
    );
  }
}
