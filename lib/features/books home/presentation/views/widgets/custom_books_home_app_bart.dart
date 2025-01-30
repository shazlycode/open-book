import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:openbook/core/conistants/app_route_pathes.dart';
import 'package:openbook/core/conistants/styles.dart';

class CustomBooksScreenAppBar extends StatelessWidget {
  const CustomBooksScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "iBook",
            style: kStyle2,
          ),
          IconButton(
              onPressed: () {
                context.go(kSearchScreen);
              },
              icon: Icon(Icons.search))
        ],
      ),
    );
  }
}
