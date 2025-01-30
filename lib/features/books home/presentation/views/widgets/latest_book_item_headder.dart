import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:openbook/core/conistants/app_route_pathes.dart';
import 'package:openbook/features/books%20home/data/book_model/book_model.dart';
import "package:cached_network_image/cached_network_image.dart";

class LatestBookItemHeadder extends StatelessWidget {
  const LatestBookItemHeadder({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          context.go(kBookDetailScreen, extra: book);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(
            height: 150,
            width: 120,
            child: CachedNetworkImage(
                imageUrl: book.volumeInfo!.imageLinks!.thumbnail!),
          ),
        ),
      ),
    );
  }
}
