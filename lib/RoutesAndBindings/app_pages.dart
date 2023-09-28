import 'package:assignment/App/Home/ViewModel/home_view_model.dart';
import 'package:assignment/App/Movie/View/movie_detail_view.dart';
import 'package:assignment/App/Movie/View/play_video.dart';
import 'package:assignment/App/Splash/View/splash.dart';
import 'package:get/get.dart';

import '../App/Book/View/book_ticket_view.dart';
import '../App/Home/View/homepage.dart';
import '../App/Splash/ViewModel/splash_view_model.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: AppRoutes.splashView,
        transition: Transition.rightToLeft,
        page: () => SplashScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut<SplashViewModel>(
            () => SplashViewModel(),
          );
        })),
    GetPage(
        name: AppRoutes.homeView,
        transition: Transition.rightToLeft,
        page: () => MyHomePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<HomeViewModel>(
            () => HomeViewModel(),
          );
        })),
    GetPage(
      name: AppRoutes.movieDetailView,
      transition: Transition.rightToLeft,
      page: () => const MovieDetailView(),
      // binding: BindingsBuilder(() {
      //   Get.lazyPut<HomeViewModel>(
      //         () => HomeViewModel(),
      //   );
      // })
    ),
    GetPage(
      name: AppRoutes.bookTicketScreen,
      transition: Transition.rightToLeft,
      page: () =>  BookTicketScreen(),
      // binding: BindingsBuilder(() {
      //   Get.lazyPut<HomeViewModel>(
      //         () => HomeViewModel(),
      //   );
      // })
    ),
    GetPage(
      name: AppRoutes.playTrailer,
      transition: Transition.rightToLeft,
      page: () =>  ChewieDemo(),
      // binding: BindingsBuilder(() {
      //   Get.lazyPut<HomeViewModel>(
      //         () => HomeViewModel(),
      //   );
      // })
    ),
  ];
}
