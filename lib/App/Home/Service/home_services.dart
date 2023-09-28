


import 'package:assignment/App/Home/Model/movie_model.dart';
import 'package:assignment/Common/show_message.dart';
import 'package:assignment/LocalStorage/hive_helper.dart';
import 'package:assignment/Network/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../Network/api_url.dart';


mixin MoviesService {
  Future<List<MoviesModel>> getMoviesService() async {
    List<MoviesModel> data = [];
    var response;
    response = await ApiClient(Dio()).getRequest(
      apiUrl: ApiUrl.moviesUrl,
    );
    debugPrint(':rocket::rocket::rocket:${response.data}');
    if (response.statusCode == 200) {
      data = MoviesModel.jsonToList(response.data["results"]);

      if (await HiveService().isExists(boxName: "movies")) {
        print("data already exist in db");
        await HiveService().deleteBox("movies");
        await HiveService()
            .addBoxes<MoviesModel>(data, "movies");
      } else {
        print("data not exist");
        await HiveService()
            .addBoxes<MoviesModel>(data, "movies");
      }
    } else {
      ShowMessage().showErrorMessage(response.data["errors"].join("").toString());
    }
    return data;
  }
}




