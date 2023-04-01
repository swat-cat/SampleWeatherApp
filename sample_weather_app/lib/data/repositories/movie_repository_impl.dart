

import 'package:sample_weather_app/data/rest_client.dart';
import 'package:sample_weather_app/domain/dto/MovieSearchResultDTO.dart';
import 'package:sample_weather_app/domain/models/short_movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/HttpResponse.dart';
import '../../domain/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository{
  final RestClient _client;
  final SharedPreferences _sharedPreferences;

  MovieRepositoryImpl(this._client, this._sharedPreferences);
  
  @override
  Future<List<ShortMovieModel>> favourites() {
    // TODO: implement favourites
    throw UnimplementedError();
  }

  @override
  Future<List<ShortMovieModel>> search(String query) async{
    final HttpResponse response = await _client.get('', queryParameters: {'s':query});
    final dto = MovieSearchResultDTO.fromJson(response.data);
    return dto.search?.map<ShortMovieModel>((e) => ShortMovieModel(e)).toList() ??[];
  }
  
}