import 'package:dio/dio.dart';
import 'package:news_tdd/core/exception/exception.dart';
import 'package:news_tdd/features/news/data/models/get_news_response/get_news_response.dart';

abstract class NewsRemoteDataSource {
  Future<GetNewsResponseModel> getNews();

  factory NewsRemoteDataSource() => _NewsRemoteDataSourceImpl();
}

class _NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  final dio = Dio(
    BaseOptions(baseUrl: 'https://newsapi.org/v2')
  );

  @override
  Future<GetNewsResponseModel> getNews() async {

    try {
      final response = await dio.get('/everything?q=keyword&apiKey=38ea3b90702044ee88f5b6e5396cf1a5'
      );
      if (response.statusCode!>= 200 && response.statusCode! < 300){
        return GetNewsResponseModel.fromJson(response.data);
      }else{
      throw ServerException(
          errorCode: '${response.statusCode ?? ''}',
          errorMessage: response.statusMessage ?? '');
    }
    } on ServerException{
      rethrow;
    } catch(error){
      throw  ServerException(
          errorCode: '141',
          errorMessage: 'Something went wrong'
      );
    }

  }
}