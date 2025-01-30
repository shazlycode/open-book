import 'package:go_router/go_router.dart';
import 'package:openbook/core/conistants/app_route_pathes.dart';
import 'package:openbook/features/book%20detail%20screen/presentation/views/book_detail_screen.dart';
import 'package:openbook/features/book%20search%20screen/presentation/views/search_screen_view.dart';
import 'package:openbook/features/books%20home/data/book_model/book_model.dart';
import 'package:openbook/features/books%20home/presentation/views/books_home_view.dart';

import '../../features/splash screen/presentation/views/splash_screen_view.dart';

class AppRouter {
  final router = GoRouter(routes: [
    GoRoute(
        path: kSplashScreen, builder: (context, state) => SplashScreenView()),
    GoRoute(
      path: kBooksHome,
      // path: kSplashScreen,
      builder: (context, state) => BooksHomeView(),
    ),
    GoRoute(
      path: kBookDetailScreen,
      builder: (context, state) =>
          BookDetailScreen(book: state.extra as BookModel),
    ),
    GoRoute(
      path: kSearchScreen,
      builder: (context, state) => SearchScreenView(),
    )
  ]);
}
