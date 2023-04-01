import 'package:sample_weather_app/domain/models/short_movie_model.dart';

abstract class MovieRepository{
  Future<List<ShortMovieModel>> search(String query);
  Future<List<ShortMovieModel>> favourites();
}