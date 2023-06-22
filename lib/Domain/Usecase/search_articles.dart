import 'package:anthony_news_apps/Domain/Repository/article_repositry.dart';
import 'package:dartz/dartz.dart';

import '../../Common/failure.dart';
import '../entities/articles.dart';

class SearchArticle {

  final ArticleRepository repository;

  SearchArticle(this.repository);

  Future<Either<Failure, Articles>>execute(String query, {int page =1 }){
    return repository.searchArticles(query, page: page);
  }

}