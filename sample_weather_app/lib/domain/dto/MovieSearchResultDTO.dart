import 'package:sample_weather_app/domain/dto/ShortMovieDTO.dart';

class MovieSearchResultDTO {
    String? response;
    List<ShortMovieDTO>? search;
    String? totalResults;

    MovieSearchResultDTO({this.response, this.search, this.totalResults});

    factory MovieSearchResultDTO.fromJson(Map<String, dynamic> json) {
        return MovieSearchResultDTO(
            response: json['response'], 
            search: json['search'] != null ? (json['search'] as List).map((i) => ShortMovieDTO.fromJson(i)).toList() : null,
            totalResults: json['totalResults'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['response'] = response;
        data['totalResults'] = totalResults;
        if (search != null) {
            data['search'] = search?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}