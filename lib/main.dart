import 'package:anthony_news_apps/Presentation/Bloc/Article_list_bloc/article_list_bloc.dart';
import 'package:anthony_news_apps/Presentation/Pages/Article_page/detail_page.dart';
import 'package:anthony_news_apps/Presentation/Pages/MainPage/main_page.dart';
import 'package:anthony_news_apps/Presentation/Pages/Splash/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anthony_news_apps/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Common/http_sslpinning.dart';
import 'Common/theme.dart';
import 'Common/utils.dart';
import 'Domain/entities/article.dart';
import 'Presentation/Bloc/Article_details_bloc/article_detail_bloc.dart';
import 'Presentation/Bloc/article_category_bloc/article_category_bloc.dart';
import 'Presentation/Bloc/bookmark_article_bloc/bookmark_article_bloc.dart';
import 'Presentation/Bloc/search_article_bloc/search_article_bloc.dart';
import 'Presentation/Pages/Article_page/article_webview_page.dart';

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
      child: MaterialApp(
        title: 'Headlines',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: jWhiteColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          colorScheme: jColorScheme.copyWith(secondary: jPrimaryColor),
          bottomNavigationBarTheme: bottomNavigationBarTheme,
        ),
        home: SplashScreen(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (_) => const SplashScreen());
            case 'main_page':
              return CupertinoPageRoute(builder: (_) => const MainPage());
            case 'article-page-details':
              final article = settings.arguments as Article;
              return MaterialPageRoute(
                builder: (_) => DetailPage(article: article),
                settings: settings,
              );
            case 'article-webview-page':
              final url = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => ArticleWebviewPage(url: url),
                settings: settings,
              );

            default:
              return MaterialPageRoute(
                builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
