import 'package:json_annotation/json_annotation.dart';

part 'get_data.g.dart';


@JsonSerializable()
class Entity extends Object {

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'start')
  int start;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'musics')
  List<Musics> musics;

  Entity(this.count,this.start,this.total,this.musics,);

  factory Entity.fromJson(Map<String, dynamic> srcJson) => _$EntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EntityToJson(this);

}


@JsonSerializable()
class Musics extends Object {

  @JsonKey(name: 'rating')
  Rating rating;

  @JsonKey(name: 'author')
  List<Author> author;

  @JsonKey(name: 'alt_title')
  String altTitle;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'tags')
  List<Tags> tags;

  @JsonKey(name: 'mobile_link')
  String mobileLink;

  @JsonKey(name: 'attrs')
  Attrs attrs;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'alt')
  String alt;

  @JsonKey(name: 'id')
  String id;

  Musics(this.rating,this.author,this.altTitle,this.image,this.tags,this.mobileLink,this.attrs,this.title,this.alt,this.id,);

  factory Musics.fromJson(Map<String, dynamic> srcJson) => _$MusicsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MusicsToJson(this);

}


@JsonSerializable()
class Rating extends Object {

  @JsonKey(name: 'max')
  int max;

  @JsonKey(name: 'average')
  String average;

  @JsonKey(name: 'numRaters')
  int numRaters;

  @JsonKey(name: 'min')
  int min;

  Rating(this.max,this.average,this.numRaters,this.min,);

  factory Rating.fromJson(Map<String, dynamic> srcJson) => _$RatingFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RatingToJson(this);

}


@JsonSerializable()
class Author extends Object {

  @JsonKey(name: 'name')
  String name;

  Author(this.name,);

  factory Author.fromJson(Map<String, dynamic> srcJson) => _$AuthorFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);

}


@JsonSerializable()
class Tags extends Object {

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'name')
  String name;

  Tags(this.count,this.name,);

  factory Tags.fromJson(Map<String, dynamic> srcJson) => _$TagsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagsToJson(this);

}


@JsonSerializable()
class Attrs extends Object {

  @JsonKey(name: 'publisher')
  List<String> publisher;

  @JsonKey(name: 'singer')
  List<String> singer;

  @JsonKey(name: 'pubdate')
  List<String> pubdate;

  @JsonKey(name: 'title')
  List<String> title;

  @JsonKey(name: 'media')
  List<String> media;

  @JsonKey(name: 'tracks')
  List<String> tracks;

  @JsonKey(name: 'version')
  List<String> version;

  Attrs(this.publisher,this.singer,this.pubdate,this.title,this.media,this.tracks,this.version,);

  factory Attrs.fromJson(Map<String, dynamic> srcJson) => _$AttrsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AttrsToJson(this);

}


