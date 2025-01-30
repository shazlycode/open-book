import 'package:flutter/material.dart';

import 'widgets/books_home_body.dart';

class BooksHomeView extends StatelessWidget {
  const BooksHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BooksHomeBody(),
    );
  }
}
