// import 'dart:io';
//
// import 'package:dartz/dartz.dart';
//
// import '../../Common/exception.dart';
// import '../../Common/failure.dart';
// import '../../Common/network_info.dart';
// import '../../Domain/Repository/article_repositry.dart';
// import '../../Domain/entities/article.dart';
// import '../../Domain/entities/articles.dart';
// import '../datasource/article_local_datasource.dart';
// import '../datasource/article_remote_data_source.dart';
// import '../models/article_table.dart';
//
// class ArticleRepositoryImpl implements ArticleRepository {
//   final ArticleRemoteDataSource remoteDataSource;
//   final ArticleLocalDataSource localDataSource;
//   // final NetworkInfo networkInfo;
//
//   ArticleRepositoryImpl({
//     required this.remoteDataSource,
//     required this.localDataSource,
//     // required this.networkInfo,
//   });
//
//   @override
//   Future<Either<Failure, List<Article>>> getTopHeadlineArticles() async {
//     if (await networkInfo.isConnected) {
//       try {
//         final result = await remoteDataSource.getTopHeadlineArticles();
//         localDataSource.cacheTopHeadlineArticles(
//             result.articles?.map((article) => ArticleTable.fromDTO(article)).toList() ?? [],);
//         return Right(result.articles?.map((model) => model.toEntity()).toList() ?? [],);
//       } on ServerException {
//         return const Left(ServerFailure(''));
//       } on TlsException catch (e) {
//         return Left(CommonFailure('Certificated Not Valid:\n${e.message}'));
//       }
//     } else {
//       try {
//         final result = await localDataSource.getCachedTopHeadlineArticles();
//         return Right(result.map((model) => model.toEntity()).toList());
//       } on CacheException catch (e) {
//         return Left(CacheFailure(e.message));
//       }
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<Article>>> getHeadlineBusinessArticles() async {
//     if (await networkInfo.isConnected) {
//       try {
//         final result = await remoteDataSource.getHeadlineBusinessArticles();
//         localDataSource.cacheHeadlineBusinessArticles(
//             result.articles?.map((article) => ArticleTable.fromDTO(article)).toList() ?? [],);
//         return Right(result.articles?.map((model) => model.toEntity()).toList() ?? [],);
//       } on ServerException {
//         return const Left(ServerFailure(''));
//       } on TlsException catch (e) {
//         return Left(CommonFailure('Certificated Not Valid:\n${e.message}'));
//       }
//     } else {
//       try {
//         final result = await localDataSource.getCachedHeadlineBusinessArticles();
//         return Right(result.map((model) => model.toEntity()).toList());
//       } on CacheException catch (e) {
//         return Left(CacheFailure(e.message));
//       }
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<Article>>> getArticleCategory(String category) async {
//     try {
//       final result = await remoteDataSource.getArticleCategory(category);
//       return Right(result.articles?.map((model) => model.toEntity()).toList() ?? [],);
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } on TlsException catch (e) {
//       return Left(CommonFailure('Certificated Not Valid:\n${e.message}'));
//     }
//   }
//
//   @override
//   Future<Either<Failure, Articles>> searchArticles(String query, {int page = 1}) async {
//     try {
//       final result = await remoteDataSource.searchArticles(query, page);
//       return Right(result.toEntity());
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } on TlsException catch (e) {
//       return Left(CommonFailure('Certificated Not Valid:\n${e.message}'));
//     }
//   }
//
//   @override
//   Future<Either<Failure, String>> saveBookmarkArticle(Article article) async {
//     try {
//       final result =
//           await localDataSource.insertBookmarkArticle(ArticleTable.fromEntity(article));
//       return Right(result);
//     } on DatabaseException catch (e) {
//       return Left(DatabaseFailure(e.message));
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   @override
//   Future<Either<Failure, String>> removeBookmarkArticle(Article article) async {
//     try {
//       final result =
//           await localDataSource.removeBookmarkArticle(ArticleTable.fromEntity(article));
//       return Right(result);
//     } on DatabaseException catch (e) {
//       return Left(DatabaseFailure(e.message));
//     }
//   }
//
//   @override
//   Future<bool> isAddedToBookmarkArticle(String url) async {
//     final result = await localDataSource.getArticleByUrl(url);
//     return result != null;
//   }
//
//   @override
//   Future<Either<Failure, List<Article>>> getBookmarkArticles() async {
//     final result = await localDataSource.getBookmarkArticles();
//     return Right(result.map((data) => data.toEntity()).toList());
//   }
// }
