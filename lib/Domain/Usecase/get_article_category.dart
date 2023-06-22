import 'package:anthony_news_apps/Domain/Repository/article_repositry.dart';
import 'package:dartz/dartz.dart';

import '../../Common/failure.dart';
import '../entities/article.dart';

class GetArticleCategory {
  final ArticleRepository repository;

   GetArticleCategory(this.repository);
   Future<Either<Failure, List<Article>>> execute(String category){
     return repository.getArticleCategory(category);
   }
}