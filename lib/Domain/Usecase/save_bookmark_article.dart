

import 'package:anthony_news_apps/Domain/Repository/article_repositry.dart';
import 'package:anthony_news_apps/Domain/entities/article.dart';
import 'package:dartz/dartz.dart';

import '../../Common/failure.dart';

class SaveBookmarkArticle{
  final ArticleRepository repository;

  SaveBookmarkArticle(this.repository);

  Future<Either<Failure, String>> execute(Article article){
    return repository.saveBookmarkArticle(article);
  }

}