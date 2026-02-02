import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/view_model/view_model.dart';

class ApiService {


  //Send request to tmdb api
 static Future<void> sendRequest()async{

    final String apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNjVhMjZlY2M0MGFlNDc5OWE0NmE5ZDNiYWYwMWE1NCIsIm5iZiI6MTc2OTk0ODU1Ni4zMjgsInN1YiI6IjY5N2Y0NThjMjBjOWExZDU5MTcwZTkwYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FHO94nSCxrev5SGSM9_w4DcCJ4WpEx4urSHWMszHRt8";

    final String endPoint = "https://api.themoviedb.org/3/movie/popular";

    final Map<String,String> header = {
        "Authorization": "Bearer $apiKey"
    };

    final Uri uri = Uri.parse(endPoint);

   final response = await http.get(
      uri,
      headers: header
    );

    print(response.body);


    

    if(response.statusCode == 200){

      //Deserialization
      print(response.body.runtimeType);

      final mapResponse = jsonDecode(response.body);

      print(mapResponse.runtimeType);

      final results = mapResponse["results"] as List;

      final models = results.map(
        (movie) {
          return MovieModel(
            id: movie["id"],
            backdropPath: movie['backdrop_path'],
            description: movie["overview"],
            title: movie["title"],
            posterPath: movie["poster_path"],
            voteAverage: movie["vote_average"],
            releaseDate: movie["release_date"],
            genres: movie["genre_ids"],
            );
        }
      ).toList();

      print(models.length);

      vm.movies.value = models;

    }

  }

}