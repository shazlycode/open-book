import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openbook/features/book%20search%20screen/presentation/views/widget/search_list.dart';

import '../../view model/cubit/search_cubit.dart';
import 'custom_search_screen_app_bar.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchCubit(),
          child: CustomScrollView(
            slivers: [
              CustomSearchScreenAppBar(),
              SearchList(),
            ],
          ),
        ),
      ),
    );
  }
}
