
import 'package:get/get.dart';
import 'package:movie_list_fetch/view/favourite/favourite_view.dart';
import 'package:movie_list_fetch/view/movie/movie_view.dart';
import 'package:movie_list_fetch/view/movie_detail/movie_detail_view.dart';
import 'package:movie_list_fetch/view/splash/splash_view.dart';
import 'routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashView,
          page: () => const SplashView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouteName.movieView,
          page: () =>  MovieView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
    GetPage(
      name: RouteName.favouriteView,
      page: () => FavouriteView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.rightToLeftWithFade,
    ),
      ];
}
