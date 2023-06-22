import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Article extends Equatable {
  Article({
    this.author,
    this.title,
    this.discription,
    this.content,
    this.url,
    this.urlImage,
    this.publishedAt,

});
  String? author;
  String? title;
  String? discription;
  String? content;
  String? url;
  String? urlImage;
  String? publishedAt;

 Article.bookmark({
   this.author,
   this.title,
   this.discription,
   this.content,
   this.url,
   this.urlImage,
   this.publishedAt,
});


  @override
  List<Object?> get props => [
    author,
    title,
    discription,
    content,
    url,
    urlImage,
    publishedAt,
  ];
}