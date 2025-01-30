import 'package:flutter/material.dart';
import 'package:openbook/features/books%20home/data/book_model/book_model.dart';

import 'widget/book_detail_screen_body.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailSecreenBody(book: book),
    );
  }
}
