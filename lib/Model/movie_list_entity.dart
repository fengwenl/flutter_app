import 'package:json_annotation/json_annotation.dart';

part 'movie_list_entity.g.dart';

@JsonSerializable()
class MovieListEntity {
  num count;
  num start;
  num total;
  List<SubjectsBean> subjects;
  String title;

  MovieListEntity({this.count, this.start, this.total, this.subjects, this.title});

  factory MovieListEntity.fromJson(Map<String, dynamic> json) => _$MovieListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListEntityToJson(this);
}

@JsonSerializable()
class SubjectsBean {
  RatingBean rating;
  List<String> genres;
  String title;
  List<CastsBean> casts;
  List<String> durations;
  num collect_count;
  String mainland_pubdate;
  bool has_video;
  String original_title;
  String subtype;
  List<DirectorsBean> directors;
  List<String> pubdates;
  String year;
  ImagesBean images;
  String alt;
  String id;

  SubjectsBean({this.rating, this.genres, this.title, this.casts, this.durations, this.collect_count, this.mainland_pubdate, this.has_video, this.original_title, this.subtype, this.directors, this.pubdates, this.year, this.images, this.alt, this.id});

  factory SubjectsBean.fromJson(Map<String, dynamic> json) => _$SubjectsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectsBeanToJson(this);
}

@JsonSerializable()
class ImagesBean {
  String small;
  String large;
  String medium;

  ImagesBean({this.small, this.large, this.medium});

  factory ImagesBean.fromJson(Map<String, dynamic> json) => _$ImagesBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesBeanToJson(this);
}

@JsonSerializable()
class DirectorsBean {
  AvatarsBean avatars;
  String name_en;
  String name;
  String alt;
  String id;

  DirectorsBean({this.avatars, this.name_en, this.name, this.alt, this.id});

  factory DirectorsBean.fromJson(Map<String, dynamic> json) => _$DirectorsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DirectorsBeanToJson(this);
}

@JsonSerializable()
class CastsBean {
  AvatarsBean avatars;
  String name_en;
  String name;
  String alt;
  String id;

  CastsBean({this.avatars, this.name_en, this.name, this.alt, this.id});

  factory CastsBean.fromJson(Map<String, dynamic> json) => _$CastsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CastsBeanToJson(this);
}

@JsonSerializable()
class AvatarsBean {
  String small;
  String large;
  String medium;

  AvatarsBean({this.small, this.large, this.medium});

  factory AvatarsBean.fromJson(Map<String, dynamic> json) => _$AvatarsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarsBeanToJson(this);
}

@JsonSerializable()
class RatingBean {
  num max;
  num average;
  String stars;
  num min;

  RatingBean({this.max, this.average, this.stars, this.min});

  factory RatingBean.fromJson(Map<String, dynamic> json) => _$RatingBeanFromJson(json);

  Map<String, dynamic> toJson() => _$RatingBeanToJson(this);
}

