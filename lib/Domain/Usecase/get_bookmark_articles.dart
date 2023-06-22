import 'package:anthony_news_apps/Domain/Repository/article_repositry.dart';
import 'package:dartz/dartz.dart';

import '../../Common/failure.dart';
import '../entities/article.dart';

class GetBookmarkArticles{
  final ArticleRepository repository;

  GetBookmarkArticles(this.repository);

  Future<Either<Failure, List<Article>>> execute(){
    return repository.getBookmarkArticles();
  }
}