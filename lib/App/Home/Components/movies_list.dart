import 'package:assignment/Common/Theme/colors.dart';
import 'package:assignment/RoutesAndBindings/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Common/utilities.dart';
import '../Model/movie_model.dart';

class MoviesList extends StatefulWidget {
  final List<MoviesModel> moviesList;
  MoviesList({Key? key, required this.moviesList}) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final CarouselController _carouselController = CarouselController();
  int _current = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 8 / 9,
            viewportFraction: 0.45,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          carouselController: _carouselController,
          items: widget.moviesList.map((movie) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.movieDetailView, arguments: [movie]);
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: MyColors.secColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: movie.images.first.url,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        Container(
                                  color: MyColors.priColor.withOpacity(0.1),
                                  height: 200,
                                  child: const Center(
                                      child: CircularProgressIndicator()),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            h10,
                            Text(
                              DateFormat.yMMMd().format(movie.releaseDate),
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  color: Colors.grey.shade400,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400),
                            ),
                            h10,
                            Text(
                              movie.title,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 20),
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity:
                                  _current == widget.moviesList.indexOf(movie)
                                      ? 1.0
                                      : 0.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: MyColors.darkPurple),
                                onPressed: () {
                                  Get.toNamed(AppRoutes.bookTicketScreen);
                                },
                                child: Text(
                                  'Book now',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
