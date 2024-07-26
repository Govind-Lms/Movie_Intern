// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsModelAdapter extends TypeAdapter<MovieDetailsModel> {
  @override
  final int typeId = 0;

  @override
  MovieDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsModel(
      adult: fields[0] as bool?,
      backdropPath: fields[1] as String?,
      budget: fields[2] as int?,
      genres: (fields[3] as List?)?.cast<Genres>(),
      homepage: fields[4] as String?,
      id: fields[5] as int?,
      imdbId: fields[6] as String?,
      originCountry: (fields[7] as List?)?.cast<String>(),
      originalLanguage: fields[8] as String?,
      originalTitle: fields[9] as String?,
      overview: fields[10] as String?,
      popularity: fields[11] as double?,
      posterPath: fields[12] as String?,
      productionCompanies: (fields[13] as List?)?.cast<ProductionCompanies>(),
      productionCountries: (fields[14] as List?)?.cast<ProductionCountries>(),
      releaseDate: fields[15] as String?,
      revenue: fields[16] as int?,
      runtime: fields[17] as int?,
      spokenLanguages: (fields[18] as List?)?.cast<SpokenLanguages>(),
      status: fields[19] as String?,
      tagline: fields[20] as String?,
      title: fields[21] as String?,
      video: fields[22] as bool?,
      voteAverage: fields[23] as double?,
      voteCount: fields[24] as int?,
      videos: fields[25] as Videos?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsModel obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.budget)
      ..writeByte(3)
      ..write(obj.genres)
      ..writeByte(4)
      ..write(obj.homepage)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.imdbId)
      ..writeByte(7)
      ..write(obj.originCountry)
      ..writeByte(8)
      ..write(obj.originalLanguage)
      ..writeByte(9)
      ..write(obj.originalTitle)
      ..writeByte(10)
      ..write(obj.overview)
      ..writeByte(11)
      ..write(obj.popularity)
      ..writeByte(12)
      ..write(obj.posterPath)
      ..writeByte(13)
      ..write(obj.productionCompanies)
      ..writeByte(14)
      ..write(obj.productionCountries)
      ..writeByte(15)
      ..write(obj.releaseDate)
      ..writeByte(16)
      ..write(obj.revenue)
      ..writeByte(17)
      ..write(obj.runtime)
      ..writeByte(18)
      ..write(obj.spokenLanguages)
      ..writeByte(19)
      ..write(obj.status)
      ..writeByte(20)
      ..write(obj.tagline)
      ..writeByte(21)
      ..write(obj.title)
      ..writeByte(22)
      ..write(obj.video)
      ..writeByte(23)
      ..write(obj.voteAverage)
      ..writeByte(24)
      ..write(obj.voteCount)
      ..writeByte(25)
      ..write(obj.videos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenresAdapter extends TypeAdapter<Genres> {
  @override
  final int typeId = 1;

  @override
  Genres read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Genres(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Genres obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenresAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductionCompaniesAdapter extends TypeAdapter<ProductionCompanies> {
  @override
  final int typeId = 2;

  @override
  ProductionCompanies read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCompanies(
      id: fields[0] as int?,
      logoPath: fields[1] as String?,
      name: fields[2] as String?,
      originCountry: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCompanies obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.logoPath)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.originCountry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCompaniesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductionCountriesAdapter extends TypeAdapter<ProductionCountries> {
  @override
  final int typeId = 3;

  @override
  ProductionCountries read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCountries(
      iso31661: fields[0] as String?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCountries obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.iso31661)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCountriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpokenLanguagesAdapter extends TypeAdapter<SpokenLanguages> {
  @override
  final int typeId = 4;

  @override
  SpokenLanguages read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpokenLanguages(
      englishName: fields[0] as String?,
      iso6391: fields[1] as String?,
      name: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SpokenLanguages obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.englishName)
      ..writeByte(1)
      ..write(obj.iso6391)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpokenLanguagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VideosAdapter extends TypeAdapter<Videos> {
  @override
  final int typeId = 5;

  @override
  Videos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Videos(
      results: (fields[0] as List?)?.cast<VideoResults>(),
    );
  }

  @override
  void write(BinaryWriter writer, Videos obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VideoResultsAdapter extends TypeAdapter<VideoResults> {
  @override
  final int typeId = 6;

  @override
  VideoResults read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoResults(
      iso6391: fields[0] as String?,
      iso31661: fields[1] as String?,
      name: fields[2] as String?,
      key: fields[3] as String?,
      site: fields[4] as String?,
      size: fields[5] as int?,
      type: fields[6] as String?,
      official: fields[7] as bool?,
      publishedAt: fields[8] as String?,
      id: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VideoResults obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.iso6391)
      ..writeByte(1)
      ..write(obj.iso31661)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.key)
      ..writeByte(4)
      ..write(obj.site)
      ..writeByte(5)
      ..write(obj.size)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.official)
      ..writeByte(8)
      ..write(obj.publishedAt)
      ..writeByte(9)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoResultsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
