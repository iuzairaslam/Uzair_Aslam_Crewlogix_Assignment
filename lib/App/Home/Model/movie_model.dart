// / To parse this JSON data, do
//
//     final moviesModel = moviesModelFromJson(jsonString);
import 'dart:convert';

import 'package:hive/hive.dart';
part 'movie_model.g.dart';

@HiveType(typeId: 1)



class MoviesModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String language;
  @HiveField(3)
  DateTime releaseDate;
  @HiveField(4)
  List<Detail> details;
  @HiveField(5)
  List<dynamic> tags;
  @HiveField(6)
  List<Video> videos;
  @HiveField(7)
  List<MovieImage> images;
  @HiveField(8)
  List<Collection> collections;
  @HiveField(9)
  int watches;
  @HiveField(10)
  int duration;
  @HiveField(11)
  int activeScreens;
  @HiveField(12)
  VoteScore voteScore;
  @HiveField(13)
  FavMovie favMovie;
  @HiveField(14)
  int stars;
  @HiveField(15)
  List<dynamic> ratings;
  @HiveField(16)
  List<Feeder> feeders;

  MoviesModel({
    required this.id,
    required this.title,
    required this.language,
    required this.releaseDate,
    required this.details,
    required this.tags,
    required this.videos,
    required this.images,
    required this.collections,
    required this.watches,
    required this.duration,
    required this.activeScreens,
    required this.voteScore,
    required this.favMovie,
    required this.stars,
    required this.ratings,
    required this.feeders,
  });
  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        language: json["language"] ?? "",
        releaseDate: json["release_date"] != null
            ? DateTime.parse(json["release_date"])
            : DateTime.now(),
        details: json["details"] != null
            ? List<Detail>.from(json["details"].map((x) => Detail.fromJson(x)))
            : [],
        tags: json["tags"] != null
            ? List<dynamic>.from(json["tags"].map((x) => x))
            : [],
        videos: json["videos"] != null
            ? List<Video>.from(json["videos"].map((x) => Video.fromJson(x)))
            : [],
        images: json["images"] != null
            ? List<MovieImage>.from(json["images"].map((x) => MovieImage.fromJson(x)))
            : [],
        collections: json["collections"] != null
            ? List<Collection>.from(
                json["collections"].map((x) => Collection.fromJson(x)))
            : [],
        watches: json["watches"] ?? 0,
        duration: json["duration"] ?? 0,
        activeScreens: json["active_screens"] ?? 0,
        voteScore: json["vote_score"] != null
            ? VoteScore.fromJson(json["vote_score"])
            : VoteScore.fromJson({}),
        favMovie: json["fav_movie"] != null
            ? FavMovie.fromJson(json["fav_movie"])
            : FavMovie.fromJson({}),
        stars: json["stars"] ?? 0,
        ratings: json["ratings"] != null
            ? List<dynamic>.from(json["ratings"].map((x) => x))
            : [],
        feeders: json["feeders"] != null
            ? List<Feeder>.from(json["feeders"].map((x) => Feeder.fromJson(x)))
            : [],
      );
  static List<MoviesModel> jsonToList(List<dynamic> emote) =>
      emote.map<MoviesModel>((item) => MoviesModel.fromJson(item)).toList();
}
@HiveType(typeId: 2)
class Collection {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String slug;
  @HiveField(3)
  List<int> movies;
  Collection({
    required this.id,
    required this.name,
    required this.slug,
    required this.movies,
  });
  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        slug: json["slug"] ?? "",
        movies: json["movies"] != null
            ? List<int>.from(json["movies"].map((x) => x))
            : [],
      );
}
@HiveType(typeId: 3)
class Detail {
  @HiveField(0)
  int id;
  @HiveField(1)
  String language;
  @HiveField(2)
  String title;
  @HiveField(3)
  String director;
  @HiveField(4)
  String tagline;
  @HiveField(5)
  String cast;
  @HiveField(6)
  String storyline;
  Detail({
    required this.id,
    required this.language,
    required this.title,
    required this.director,
    required this.tagline,
    required this.cast,
    required this.storyline,
  });
  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"] ?? 0,
        language: json["language"] ?? "",
        title: json["title"] ?? "",
        director: json["director"] ?? "",
        tagline: json["tagline"] ?? "",
        cast: json["cast"] ?? "",
        storyline: json["storyline"] ?? "",
      );
}
@HiveType(typeId: 4)
class FavMovie {
  @HiveField(0)
  bool star;
  @HiveField(1)

  bool follow;
  @HiveField(2)
  bool watched;

  FavMovie({
    required this.star,
    required this.follow,
    required this.watched,
  });
  factory FavMovie.fromJson(Map<String, dynamic> json) => FavMovie(
        star: json["star"] ?? false,
        follow: json["follow"] ?? false,
        watched: json["watched"] ?? false,
      );
}
@HiveType(typeId: 5)
class Feeder {
  @HiveField(0)
  String name;
  @HiveField(1)
  String url;
  Feeder({
    required this.name,
    required this.url,
  });
  factory Feeder.fromJson(Map<String, dynamic> json) => Feeder(
        name: json["name"] ?? "",
        url: json["url"] ?? "",
      );
}
@HiveType(typeId: 6)
class MovieImage {
  @HiveField(0)
  int id;
  @HiveField(1)
  int order;
  @HiveField(2)
  String url;
  @HiveField(3)
  String type;
  @HiveField(4)
  String thumbnail;
  MovieImage({
    required this.id,
    required this.order,
    required this.url,
    required this.type,
    required this.thumbnail,
  });
  factory MovieImage.fromJson(Map<String, dynamic> json) => MovieImage(
        id: json["id"] ?? 0,
        order: json["order"] ?? 0,
        url: json["url"] ?? "",
        type: json["type"] ?? "",
        thumbnail: json["thumbnail"] ?? "",
      );
}
@HiveType(typeId: 7)
class Video {
  @HiveField(0)
  String url;
  @HiveField(1)
  String source;
  @HiveField(2)
  String kind;
  @HiveField(3)
  String language;
  Video({
    required this.url,
    required this.source,
    required this.kind,
    required this.language,
  });
  factory Video.fromJson(Map<String, dynamic> json) => Video(
        url: json["url"] ?? "",
        source: json["source"] ?? "",
        kind: json["kind"] ?? "",
        language: json["language"] ?? "",
      );
}
@HiveType(typeId: 8)
class VoteScore {
  @HiveField(0)
  int avg;
  @HiveField(1)
  int score;
  @HiveField(2)
  int total;
  VoteScore({
    required this.avg,
    required this.score,
    required this.total,
  });
  factory VoteScore.fromJson(Map<String, dynamic> json) => VoteScore(
        avg: json["avg"] ?? 0,
        score: json["score"] ?? 0,
        total: json["total"] ?? 0,
      );
}
