import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:openbook/core/utils/app_router.dart';
import 'package:openbook/core/utils/service_locator.dart';
import 'package:openbook/features/book%20search%20screen/presentation/view%20model/cubit/search_cubit.dart';
import 'package:openbook/features/books%20home/data/repo/book_home_impl.dart';
import 'package:openbook/features/books%20home/presentation/view%20model/featured%20books%20cubit/featured_books_cubit.dart';
import 'package:openbook/features/books%20home/presentation/view%20model/latest%20books%20cubit/latest_books_cubit.dart';

void main() {
  setup();
  runApp(const OpenBook());
}

class OpenBook extends StatelessWidget {
  const OpenBook({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LatestBooksCubit(getIt.get<BookHomeImpl>())..fetchLatestBooks(),
        ),
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<BookHomeImpl>())
            ..fetchFeturedBooks(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        routerConfig: AppRouter().router,
      ),
    );
  }
}
