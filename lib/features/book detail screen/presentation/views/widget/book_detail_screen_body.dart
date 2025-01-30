import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../books home/data/book_model/book_model.dart';
import 'book_details_book_section.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailSecreenBody extends StatelessWidget {
  const BookDetailSecreenBody({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomBookDetailsAppBar(),
          BookDetailsBookSection(book: book),
        ],
      ),
    );
  }
}
