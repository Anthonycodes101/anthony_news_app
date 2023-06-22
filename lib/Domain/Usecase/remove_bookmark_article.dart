import 'package:anthony_news_apps/Domain/Repository/article_repositry.dart';
import 'package:dartz/dartz.dart';
import '../../Common/failure.dart';
import '../entities/article.dart';

class RemoveBookmarkArticles {
  final ArticleRepository repository;

  RemoveBookmarkArticles(this.repository);

  Future<Either<Failure, String>> execute(Article article) {
    return repository.removeBookmarkArticle(article);
  }
}
