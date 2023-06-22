import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Article extends Equatable {
  Article({
    this.author,
    this.title,
    this.description,
    this.content,
    this.url,
    this.urlImage,
    this.publishedAt,

});
  String? author;
  String? title;
  String? description;
  String? content;
  String? url;
  String? urlImage;
  DateTime? publishedAt;

 Article.bookmark({
   this.author,
   this.title,
   this.description,
   this.content,
   this.url,
   this.urlImage,
   this.publishedAt,
});


  @override
  List<Object?> get props => [
    author,
    title,
    description,
    content,
    url,
    urlImage,
    publishedAt,
  ];
}