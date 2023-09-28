// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoviesModelAdapter extends TypeAdapter<MoviesModel> {
  @override
  final int typeId = 1;

  @override
  MoviesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoviesModel(
      id: fields[0] as int,
      title: fields[1] as String,
      language: fields[2] as String,
      releaseDate: fields[3] as DateTime,
      details: (fields[4] as List).cast<Detail>(),
      tags: (fields[5] as List).cast<dynamic>(),
      videos: (fields[6] as List).cast<Video>(),
      images: (fields[7] as List).cast<MovieImage>(),
      collections: (fields[8] as List).cast<Collection>(),
      watches: fields[9] as int,
      duration: fields[10] as int,
      activeScreens: fields[11] as int,
      voteScore: fields[12] as VoteScore,
      favMovie: fields[13] as FavMovie,
      stars: fields[14] as int,
      ratings: (fields[15] as List).cast<dynamic>(),
      feeders: (fields[16] as List).cast<Feeder>(),
    );
  }

  @override
  void write(BinaryWriter writer, MoviesModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.language)
      ..writeByte(3)
      ..write(obj.releaseDate)
      ..writeByte(4)
      ..write(obj.details)
      ..writeByte(5)
      ..write(obj.tags)
      ..writeByte(6)
      ..write(obj.videos)
      ..writeByte(7)
      ..write(obj.images)
      ..writeByte(8)
      ..write(obj.collections)
      ..writeByte(9)
      ..write(obj.watches)
      ..writeByte(10)
      ..write(obj.duration)
      ..writeByte(11)
      ..write(obj.activeScreens)
      ..writeByte(12)
      ..write(obj.voteScore)
      ..writeByte(13)
      ..write(obj.favMovie)
      ..writeByte(14)
      ..write(obj.stars)
      ..writeByte(15)
      ..write(obj.ratings)
      ..writeByte(16)
      ..write(obj.feeders);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CollectionAdapter extends TypeAdapter<Collection> {
  @override
  final int typeId = 2;

  @override
  Collection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Collection(
      id: fields[0] as int,
      name: fields[1] as String,
      slug: fields[2] as String,
      movies: (fields[3] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, Collection obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.movies);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DetailAdapter extends TypeAdapter<Detail> {
  @override
  final int typeId = 3;

  @override
  Detail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Detail(
      id: fields[0] as int,
      language: fields[1] as String,
      title: fields[2] as String,
      director: fields[3] as String,
      tagline: fields[4] as String,
      cast: fields[5] as String,
      storyline: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Detail obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.language)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.director)
      ..writeByte(4)
      ..write(obj.tagline)
      ..writeByte(5)
      ..write(obj.cast)
      ..writeByte(6)
      ..write(obj.storyline);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FavMovieAdapter extends TypeAdapter<FavMovie> {
  @override
  final int typeId = 4;

  @override
  FavMovie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavMovie(
      star: fields[0] as bool,
      follow: fields[1] as bool,
      watched: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FavMovie obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.star)
      ..writeByte(1)
      ..write(obj.follow)
      ..writeByte(2)
      ..write(obj.watched);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavMovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FeederAdapter extends TypeAdapter<Feeder> {
  @override
  final int typeId = 5;

  @override
  Feeder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Feeder(
      name: fields[0] as String,
      url: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Feeder obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeederAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MovieImageAdapter extends TypeAdapter<MovieImage> {
  @override
  final int typeId = 6;

  @override
  MovieImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieImage(
      id: fields[0] as int,
      order: fields[1] as int,
      url: fields[2] as String,
      type: fields[3] as String,
      thumbnail: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieImage obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.order)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VideoAdapter extends TypeAdapter<Video> {
  @override
  final int typeId = 7;

  @override
  Video read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Video(
      url: fields[0] as String,
      source: fields[1] as String,
      kind: fields[2] as String,
      language: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Video obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.source)
      ..writeByte(2)
      ..write(obj.kind)
      ..writeByte(3)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VoteScoreAdapter extends TypeAdapter<VoteScore> {
  @override
  final int typeId = 8;

  @override
  VoteScore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VoteScore(
      avg: fields[0] as int,
      score: fields[1] as int,
      total: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, VoteScore obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.avg)
      ..writeByte(1)
      ..write(obj.score)
      ..writeByte(2)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VoteScoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
