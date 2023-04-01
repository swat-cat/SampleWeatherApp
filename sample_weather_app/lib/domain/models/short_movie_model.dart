import 'package:sample_weather_app/domain/dto/ShortMovieDTO.dart';

class ShortMovieModel{
  final ShortMovieDTO _dto;

  ShortMovieModel(this._dto);

  String? get title => _dto.title;
  String? get posterUrl => _dto.poster;
}