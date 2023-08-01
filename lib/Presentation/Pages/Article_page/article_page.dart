import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../Common/theme.dart';
import '../../Bloc/Article_list_bloc/article_list_bloc.dart';
import '../../Widgets/loading_article_lists.dart';
import '../../Widgets/loading_articles_card.dart';
import '../../Widgets/widgets.dart';


class ArticlePage extends StatefulWidget {
  const ArticlePage({ Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ArticleTopHeadlineListBloc>(context, listen: false)
            .add(ArticleListEvent()),);
    Future.microtask(() =>
        Provider.of<ArticleHeadlineBusinessListBloc>(context, listen: false)
            .add(ArticleListEvent()),);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        children: [
          Column(
            children: [
              _listTopHeadlineArticles(),
              const SizedBox(height:8),
              const SizedBox(height: 8),
              _listHeadlineBusinessArticles()
            ],
          )
        ],
      ),
    );
  }

  Widget _listTopHeadlineArticles() {
    return Container(
      height: 230,
      width: double.infinity,
      color: jWhiteColor,
      child: BlocBuilder<ArticleTopHeadlineListBloc, ArticleListState>(
        builder: (context, state) {
          if(state is ArticleListLoading) {
            return const CircularProgressIndicator();
          } else if(state is ArticleListLoaded) {
            return ListView.builder(
              key: const Key('headline_news_item'),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                var article = state.articles[index];
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    (article == state.articles.first) ? 24 : 6,
                    8,
                    (article == state.articles.last) ? 24 : 6,
                    8,
                  ),
                  child: TopHeadlineArticleCard(article: article),
                );
              },
            );
          } else if(state is ArticleListEmpty) {
            return const Center(child: Text('Empty Article'));
          } else if (state is ArticleListError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text(''));
          }
        },
      ),
    );
  }


  Widget _listHeadlineBusinessArticles() {
    return BlocBuilder<ArticleHeadlineBusinessListBloc, ArticleListState>(
      builder: (context, state) {
        if(state is ArticleListLoading) {
          return Container(
            color: jWhiteColor,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8),
            child: const LoadingArticleList(),
          );
        } else if(state is ArticleListLoaded) {
          return Container(
            color: jWhiteColor,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8),
            child: ListView.builder(
              key: const Key('headline_business_item'),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                var article = state.articles[index];
                return ArticleList(article: article);
              },
            ),
          );
        } else if(state is ArticleListEmpty) {
          return const Center(child: Text('Empty Article'));
        } else if (state is ArticleListError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }
}