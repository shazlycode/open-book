import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/conistants/styles.dart';
import '../../../../books home/data/book_model/book_model.dart';

class BookDetailsBookSection extends StatelessWidget {
  const BookDetailsBookSection({super.key, required this.book});
  final BookModel book;
  void launchBookURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
      LaunchMode.inAppBrowserView;
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          print("launch url");
          launchBookURL(book.volumeInfo!.previewLink!);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Hero(
                tag: book.id!,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                        height: 300,
                        width: 250,
                        fit: BoxFit.cover,
                        imageUrl: book.volumeInfo!.imageLinks!.thumbnail!)),
              ),
              SizedBox(height: 20),
              Text(
                book.volumeInfo!.title!,
                maxLines: 2, // Limits the text to 2 lines
                overflow: TextOverflow
                    .ellipsis, // Adds "..." at the end if the text overflows
                style: kStyle1.copyWith(fontSize: 24),
              ),
              Text(
                book.volumeInfo!.authors![0],
                style: kStyle3,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Publshed: ${book.volumeInfo!.publishedDate!}",
                style: kStyle3,
              ),
              SizedBox(height: 20),
              Text(
                book.volumeInfo!.description!,
                style: kStyle2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
