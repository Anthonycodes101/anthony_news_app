import 'package:anthony_news_apps/Domain/Repository/authentication_repository.dart';
import 'package:get_it/get_it.dart';

import 'Domain/Usecase/get_article_category.dart';
import 'Domain/Usecase/get_bookmark_articles.dart';
import 'Domain/Usecase/get_bookmark_satus.dart';
import 'Domain/Usecase/get_headline_business_articles.dart';
import 'Domain/Usecase/get_top_headline_articles.dart';
import 'Domain/Usecase/remove_bookmark_article.dart';
import 'Domain/Usecase/save_bookmark_article.dart';
import 'Domain/Usecase/search_articles.dart';
import 'Presentation/Bloc/Article_list_bloc/article_list_bloc.dart';
import 'Presentation/Bloc/Authenticatio_bloc/auth_bloc.dart';

final locator = GetIt.instance;

void init() {
  ///bloc
  locator.registerFactory(() => ArticleTopHeadlineListBloc(
        locator(),
      ));

  ///Auth
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository());
  locator.registerLazySingleton<AuthBloc>(
      () => AuthBloc(locator<AuthRepository>()));

  ///usecase
  locator.registerLazySingleton(() => GetTopHeadlineArticles(locator()));
  locator.registerLazySingleton(() => GetHeadlineBusinessArticles(locator()));
  locator.registerLazySingleton(() => GetArticleCategory(locator()));
  locator.registerLazySingleton(() => SearchArticle(locator()));
  locator.registerLazySingleton(() => GetBookmarkArticles(locator()));
  locator.registerLazySingleton(() => GetBookmarkStatus(locator()));
  locator.registerLazySingleton(() => SaveBookmarkArticle(locator()));
  locator.registerLazySingleton(() => RemoveBookmarkArticles(locator()));

}
