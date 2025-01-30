import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:openbook/features/book%20search%20screen/presentation/view%20model/cubit/search_cubit.dart';

import '../../../../../core/conistants/app_route_pathes.dart';

class CustomSearchScreenAppBar extends StatelessWidget {
  const CustomSearchScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Row(
          children: [
            IconButton(
                alignment: Alignment.centerLeft,
                onPressed: () {
                  context.go(kSplashScreen);
                },
                icon: Icon(Icons.arrow_back)),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Search books",
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                onChanged: (v) {
                  context.read<SearchCubit>().updateSearchText(v);
                },
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
