import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../Domain/Usecase/get_article_category.dart';
import '../../../Domain/entities/article.dart';


part 'article_category_event.dart';
part 'article_category_state.dart';

class ArticleCategoryBloc extends Bloc<ArticleCategoryEvent, ArticleCategoryState> {
  final GetArticleCategory getArticleCategory;
  ArticleCategoryBloc(this.getArticleCategory) : super(const ArticleCategoryEmpty('')) {
    on<FetchArticleCategory>((event, emit) async {
      final category = event.category;
      emit(ArticleCategoryLoading());
      final result = await getArticleCategory.execute(category);
      result.fold(
        (failure) => emit(ArticleCategoryError(failure.message)),
        (articlesData) { 
          emit(ArticleCategoryHasData(articlesData));
          if(articlesData.isEmpty) {
            emit(const ArticleCategoryEmpty('Empty Article'));
          }
        }
      );
    });
  }
}
