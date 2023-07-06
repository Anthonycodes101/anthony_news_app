import 'package:anthony_news_apps/Presentation/Bloc/Article_list_bloc/article_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:anthony_news_apps/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'Common/http_sslpinning.dart';
import 'Presentation/Bloc/Article_details_bloc/article_detail_bloc.dart';
import 'Presentation/Bloc/article_category_bloc/article_category_bloc.dart';
import 'Presentation/Bloc/bookmark_article_bloc/bookmark_article_bloc.dart';
import 'Presentation/Bloc/search_article_bloc/search_article_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HttpSSLPinning.init();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<ArticleTopHeadlineListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchArticleBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ArticleCategoryBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ArticleHeadlineBusinessListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ArticleDetailBloc>(),
        ),

        BlocProvider(
          create: (_) => di.locator<BookmarkArticleBloc>(),
        ),
      ],
    );
  }
}
