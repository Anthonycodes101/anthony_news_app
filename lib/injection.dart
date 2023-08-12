import 'package:anthony_news_apps/Domain/Repository/authentication_repository.dart';
import 'package:get_it/get_it.dart';
import 'Common/http_sslpinning.dart';
import 'Common/network_info.dart';
import 'Data/datasource/article_local_datasource.dart';
import 'Data/datasource/article_remote_data_source.dart';
import 'Data/datasource/db/database_helper.dart';
import 'Domain/Usecase/get_article_category.dart';
import 'Domain/Usecase/get_bookmark_articles.dart';
import 'Domain/Usecase/get_bookmark_satus.dart';
import 'Domain/Usecase/get_headline_business_articles.dart';
import 'Domain/Usecase/get_top_headline_articles.dart';
import 'Domain/Usecase/remove_bookmark_article.dart';
import 'Domain/Usecase/save_bookmark_article.dart';
import 'Domain/Usecase/search_articles.dart';
import 'Presentation/Bloc/Article_details_bloc/article_detail_bloc.dart';
import 'Presentation/Bloc/Article_list_bloc/article_list_bloc.dart';
import 'Presentation/Bloc/Authenticatio_bloc/auth_bloc.dart';
import 'Presentation/Bloc/article_category_bloc/article_category_bloc.dart';
import 'Presentation/Bloc/bookmark_article_bloc/bookmark_article_bloc.dart';
import 'Presentation/Bloc/search_article_bloc/search_article_bloc.dart';

final locator = GetIt.instance;

void init() {
  ///bloc
  locator.registerFactory(() => ArticleTopHeadlineListBloc(
        locator(),
      ));

  locator.registerFactory(
        () => ArticleHeadlineBusinessListBloc(
      locator(),
    ),
  );
  locator.registerFactory(
        () => ArticleCategoryBloc(
      locator(),
    ),
  );
  locator.registerFactory(
        () => SearchArticleBloc(
      locator(),
    ),
  );
  locator.registerFactory(
        () => BookmarkArticleBloc(
      locator(),
    ),
  );
  locator.registerFactory(
        () => ArticleDetailBloc(
      getBookmarkStatus: locator(),
      saveBookmarkArticle: locator(),
      removeBookmarkArticle: locator(),
    ),
  );
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

  //data source
  locator.registerLazySingleton<ArticleRemoteDataSource>(
        () => ArticleRemoteDataSourceImpl(client: locator()),
  );
  locator.registerLazySingleton<ArticleLocalDataSource>(
        () => ArticleLocalDataSourceImpl(databaseHelper: locator()),
  );

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // network info
  // locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  // external
  locator.registerLazySingleton(() => HttpSSLPinning.client);
  // locator.registerLazySingleton(() => DataConnectionChecker());
}
