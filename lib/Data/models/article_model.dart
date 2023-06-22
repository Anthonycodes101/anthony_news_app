import 'package:equatable/equatable.dart';

import '../../Domain/entities/article.dart';

class ArticleModel extends Equatable {
    final String? author;
    final String? title;
    final String? description;
    final String? url;
    final String? urlImage;
    final DateTime? publishedAt;
    final String? content;

    const ArticleModel({
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlImage,
      this.publishedAt,
      this.content,
    });

    factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null 
          ? null 
          : DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
    };

    Article toEntity() {
      return Article(
        author: author,
        title: title,
        description: description,
        url: url,
        urlImage: urlImage,
        publishedAt: publishedAt,
        content: content,
      );
    }
    
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
