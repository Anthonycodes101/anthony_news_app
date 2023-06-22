import 'package:dartz/dartz.dart';

import '../../Common/failure.dart';
import '../Repository/article_repositry.dart';
import '../entities/article.dart';

class GetTopHeadlineArticles {
  final ArticleRepository repository;

  GetTopHeadlineArticles(this.repository);

  Future<Either<Failure, List<Article>>> execute() {
    return repository.getTopHeadlineArticles();
  }
}