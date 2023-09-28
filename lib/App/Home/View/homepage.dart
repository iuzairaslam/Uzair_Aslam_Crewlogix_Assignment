import 'package:assignment/App/Home/Components/movies_list.dart';
import 'package:assignment/App/Home/ViewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/utilities.dart';
import '../../Movie/View/movie_detail_view.dart';
import '../Components/category_list.dart';
import '../Components/home_components.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final homeVM = Get.find<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const HomeHeader(),
            h20,
            HomeSearch(),
            h20,
            const CategoryHeader(),
            h20,
            Obx(() => CategoryList(
                  categoryList: homeVM.categoryList.value,
                )),
            h20,
            const PopularHeader(),
            h20,
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: Obx(() => homeVM.isLoading.value
                    ? const Center(child: CircularProgressIndicator(color: Colors.white,))
                    :homeVM.moviesList.isNotEmpty? MoviesList(
                        moviesList: homeVM.moviesList.value,

                      ):Center(child: const Text("No Movies Found")))),
            h20,
            h20,
          ],
        ),
      ),
    );
  }
}
