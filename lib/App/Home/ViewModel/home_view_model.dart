import 'dart:async';
import 'dart:convert';
import 'package:assignment/App/Home/Service/home_services.dart';
import 'package:assignment/LocalStorage/hive_helper.dart';
import 'package:get/get.dart';
import '../Model/category_model.dart';
import '../Model/movie_model.dart';

class HomeViewModel extends GetxController with MoviesService {

  RxBool isLoading =false.obs;
  RxList<CategoryModel> categoryList = [
    CategoryModel(icon: "😱", text: "Horror"),
    CategoryModel(icon: "🥰", text: "Romance"),
    CategoryModel(icon: "😂", text: "Comedy"),
    CategoryModel(icon: "🎭", text: "Drama"),
    CategoryModel(icon: "😎", text: "Thriller"),
  ].obs;

  RxList<MoviesModel> moviesList = <MoviesModel>[].obs;
  @override
  Future<void> onInit() async {
    try {
      List<MoviesModel> dummyData = <MoviesModel>[];
      isLoading.value=true;
      if (await HiveService().isExists(boxName: "movies")) {
        dummyData =
        await HiveService().getBoxes<MoviesModel>("movies");
        moviesList.value =dummyData;
        moviesList.refresh();
        isLoading.value = false;
        await getMoviesService()
            .then((value) => {
          if (value.isNotEmpty)
            {moviesList.value = value, moviesList.refresh()}
        });
      } else {
        dummyData= await getMoviesService();
        moviesList.value =dummyData;
        moviesList.refresh();
        isLoading.value = false;
      }

    } catch (e) {
      isLoading.value=false;
      print(e);
    }

    super.onInit();
  }
}
