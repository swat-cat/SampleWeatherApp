class ShortMovieDTO {
    String? imdbID;
    String? poster;
    String? title;
    String? type;
    String? year;

    ShortMovieDTO({this.imdbID, this.poster, this.title, this.type, this.year});

    factory ShortMovieDTO.fromJson(Map<String, dynamic> json) {
        return ShortMovieDTO(
            imdbID: json['imdbID'], 
            poster: json['poster'], 
            title: json['title'], 
            type: json['type'], 
            year: json['year'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['imdbID'] = imdbID;
        data['poster'] = poster;
        data['title'] = title;
        data['type'] = type;
        data['year'] = year;
        return data;
    }
}