import 'package:equatable/equatable.dart';

import '../../Domain/entities/article.dart';
import 'article_model.dart';


class ArticleTable extends Equatable {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlImage;
  final DateTime? publishedAt;
  final String? content;

  const ArticleTable({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleTable.fromEntity(Article article) => ArticleTable(
    author: article.author,
    title: article.title,
    description: article.description,
    url: article.url,
    urlImage: article.urlImage,
    publishedAt: article.publishedAt,
    content: article.content,
  );

  factory ArticleTable.fromMap(Map<String, dynamic> map) => ArticleTable(
    author: map['author'],
    title: map['title'],
    description: map['description'],
    url: map['url'],
    urlImage: map['urlImage'],
    publishedAt: DateTime.parse(map['publishedAt']),
    content: map['content'],
  );

  factory ArticleTable.fromDTO(ArticleModel article) => ArticleTable(
    author: article.author,
    title: article.title,
    description: article.description,
    url: article.url,
    urlImage: article.urlImage,
    publishedAt: article.publishedAt,
    content: article.content,
  );

  Map<String, dynamic> toJson() => {
    'author': author,
    'title': title,
    'description': description,
    'url': url,
    'urlImage': urlImage,
    'publishedAt': publishedAt?.toIso8601String(),
    'content': content,
  };

  Article toEntity() => Article.bookmark(
    author: author,
    title: title,
    description: description,
    url: url,
    urlImage: urlImage,
    publishedAt: publishedAt,
    content: content,
  );

  @override
  List<Object?> get props => [
    author,
    title,
    description,
    url,
    urlImage,
    publishedAt,
    content,
  ];
}