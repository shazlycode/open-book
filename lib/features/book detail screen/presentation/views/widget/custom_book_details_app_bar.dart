import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:openbook/core/conistants/app_route_pathes.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: IconButton(
          alignment: Alignment.centerLeft,
          onPressed: () {
            context.go(kBooksHome);
          },
          icon: Icon(Icons.arrow_back)),
    );
  }
}
