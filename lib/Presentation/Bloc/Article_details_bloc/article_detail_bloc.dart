import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../Domain/Usecase/get_bookmark_satus.dart';
import '../../../Domain/Usecase/remove_bookmark_article.dart';
import '../../../Domain/Usecase/save_bookmark_article.dart';
import '../../../Domain/entities/article.dart';


part 'article_detail_event.dart';
part 'article_detail_state.dart';

class ArticleDetailBloc extends Bloc<ArticleDetailEvent, ArticleDetailState> {
  final GetBookmarkStatus getBookmarkStatus;
  final SaveBookmarkArticle saveBookmarkArticle;
  final RemoveBookmarkArticles removeBookmarkArticle;

  static const bookmarkAddSuccessMessage = 'Added to Bookmark';
  static const bookmarkRemoveSuccessMessage = 'Removed from Bookmark';

  ArticleDetailBloc({
    required this.getBookmarkStatus,
    required this.saveBookmarkArticle,
    required this.removeBookmarkArticle,
  }) : super(ArticleDetailState.initial()) {
    on<AddToBookmark>((event, emit) async {
      final result = await saveBookmarkArticle.execute(event.article);

      result.fold(
        (failure) {
          emit(state.copyWith(bookmarkMessage: failure.message));
        },
        (successMessage) {
          emit(state.copyWith(bookmarkMessage: successMessage));
        }
      );

      add(LoadBookmarkStatus(event.article.url ?? ''));

    });
    on<RemoveFromBookmark>((event, emit) async {
      final result = await removeBookmarkArticle.execute(event.article);

      result.fold(
        (failure) {
          emit(state.copyWith(bookmarkMessage: failure.message));
        },
        (successMessage) {
          emit(state.copyWith(bookmarkMessage: successMessage));
        }
      );

      add(LoadBookmarkStatus(event.article.url ?? ''));
      
    });
    on<LoadBookmarkStatus>((event, emit) async {
      final result = await getBookmarkStatus.execute(event.url);
      emit(state.copyWith(isAddedToBookmark: result));
    });
  }
}
