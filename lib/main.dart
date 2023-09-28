import 'dart:io';

import 'package:assignment/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'App/Home/Model/movie_model.dart';
import 'RoutesAndBindings/app_pages.dart';
import 'RoutesAndBindings/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(MoviesModelAdapter())
    ..registerAdapter(DetailAdapter())
    ..registerAdapter(VideoAdapter())
    ..registerAdapter(MovieImageAdapter())
    ..registerAdapter(CollectionAdapter())
    ..registerAdapter(VoteScoreAdapter())
    ..registerAdapter(FavMovieAdapter())
    ..registerAdapter(FeederAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: MyColors.priColor,
          background: MyColors.secColor,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.poppins(
            fontSize: 20,
            fontStyle: FontStyle.normal,
          ),
          bodyMedium: GoogleFonts.poppins(),
          displaySmall: GoogleFonts.poppins(),
        ),
      ),
      title: 'Movie Planet',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.splashView,
    );
  }
}
