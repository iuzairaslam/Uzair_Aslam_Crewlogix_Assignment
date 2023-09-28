import 'package:assignment/App/Movie/View/play_video.dart';
import 'package:assignment/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Common/utilities.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import '../../Home/Model/movie_model.dart';

class MovieDetailView extends StatefulWidget {
  const MovieDetailView({super.key});

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  MoviesModel movie = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.secColor,
        centerTitle: true,
        title: const Text("Detail movie"),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.bookmark_border_rounded))
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: CarouselSlider.builder(
                // key: _sliderKey,
                unlimitedMode: true,
                slideBuilder: (index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                NetworkImage(movie.images[index].url ?? ""))),
                  );
                },
                slideTransform: const DefaultTransform(),
                slideIndicator: CircularSlideIndicator(
                  padding: const EdgeInsets.only(bottom: 32),
                ),
                itemCount: movie.images.length),
          ),
          h10,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600),
                ),
                h10,
                RatingBarIndicator(
                  rating: 2.75,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 16.0,
                  direction: Axis.horizontal,
                ),
                h20,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: MyColors.darkPurple),
                    onPressed: () {
                      if (movie.videos.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              const Text('No trailer available for this movie'),
                          action: SnackBarAction(
                            label: 'UhOh!',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        ));
                      } else {
                        List<String>? listVideo = [];
                        listVideo.add(movie.videos.first.url);
                        Get.to(() => ChewieDemo(
                              title: movie.title,
                              srcs: listVideo,
                            ));
                      }
                    },
                    child: Text(
                      'Watch Trailer',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                h10,
                Text(
                  "Date",
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      color: Colors.grey.shade400,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w700),
                ),
                h5,
                Text(
                  DateFormat.yMMMd().format(movie.releaseDate),
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      color: Colors.grey.shade400,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400),
                ),
                h10,
                if (movie.details.isNotEmpty)
                  Text(
                    "Overview",
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                        color: Colors.grey.shade400,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w700),
                  ),
                h5,
                if (movie.details.isNotEmpty)
                  Text(
                    "${movie.details.first.cast}\n${movie.details.first.storyline}",
                    maxLines: 5,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
