import 'package:news_tdd/core/either/either.dart';
import 'package:news_tdd/core/exception/exception.dart';
import 'package:news_tdd/core/failure/failure.dart';
import 'package:news_tdd/features/news/data/data_source/news_remote.dart';
import 'package:news_tdd/features/news/domain/entities/news.dart';
import '../../domain/repositories/news.dart';

class NewsRepositoryImpl implements NewsRepository{
  final _remoteDataSource = NewsRemoteDataSource();

  @override
  Future<Either<ServerFailure, List<NewsEntity>>> getNews() async  {
    try{
      final response = await _remoteDataSource.getNews();

      return Right(response.articles);

    } on ServerException catch(exception){
      return Left(ServerFailure.fromServerException(exception));
    }
  }

}