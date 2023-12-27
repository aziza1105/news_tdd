import 'package:news_tdd/core/either/either.dart';
import 'package:news_tdd/core/failure/failure.dart';
import 'package:news_tdd/features/news/domain/entities/news.dart';

abstract class NewsRepository{
  Future<Either<ServerFailure, List<NewsEntity>>> getNews();
}