import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:openbook/core/conistants/app_route_pathes.dart';
import 'package:openbook/core/conistants/constants.dart';
import 'package:openbook/core/conistants/styles.dart';
import 'package:openbook/features/books%20home/data/book_model/book_model.dart';

class FeaturedBookItem extends StatelessWidget {
  const FeaturedBookItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(kBookDetailScreen, extra: book);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Hero(
              tag: book.id!,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    imageUrl: book.volumeInfo!.imageLinks!.smallThumbnail!,
                    fadeInCurve: Curves.easeIn,
                    fadeInDuration: kTetAnimationDuration,
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              // Added Expanded widget to prevent overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.volumeInfo!.title!,
                    maxLines: 2, // Limits the text to 2 lines
                    overflow: TextOverflow
                        .ellipsis, // Adds "..." at the end if the text overflows
                    style: kStyle1,
                  ),
                  Text(
                    book.volumeInfo!.authors![0],
                    style: kStyle3,
                  ),
                  Row(
                    children: [
                      Text(
                        "Free",
                        style: kStyle2,
                      ),
                      Spacer(),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text("4.8 (5248)")
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
