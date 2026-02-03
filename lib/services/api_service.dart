import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/view_model/view_model.dart';

class ApiService {


  //Send request to tmdb api
 static Future<void> sendRequest(int page)async{

  try{

    final String apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNjVhMjZlY2M0MGFlNDc5OWE0NmE5ZDNiYWYwMWE1NCIsIm5iZiI6MTc2OTk0ODU1Ni4zMjgsInN1YiI6IjY5N2Y0NThjMjBjOWExZDU5MTcwZTkwYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FHO94nSCxrev5SGSM9_w4DcCJ4WpEx4urSHWMszHRt8";

    // final String endPoint = "https://api.themoviedb.org/3/movie/popular";

    final String endPoint = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=$page";

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

      results.removeAt(0);

      final models = results.map(
        (movie) {
          return MovieModel.fromMap(movie);
        }
      ).toList();

      print(models.length);

      vm.movies.value = [...vm.movies.value, ...models];

      // vm.movies.value.addAll(models);

      //End of request, increase current page by 1
      vm.currentPage += 1;

    }

  }catch(e){
    print("error while sending api request:  ${e.toString()}");
  }

 }


 static Future<void> fetchMovieGenres()async{

    final String apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNjVhMjZlY2M0MGFlNDc5OWE0NmE5ZDNiYWYwMWE1NCIsIm5iZiI6MTc2OTk0ODU1Ni4zMjgsInN1YiI6IjY5N2Y0NThjMjBjOWExZDU5MTcwZTkwYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FHO94nSCxrev5SGSM9_w4DcCJ4WpEx4urSHWMszHRt8";

    final String endPoint = "https://api.themoviedb.org/3/genre/movie/list";

    final Map<String,String> header = {
        "Authorization": "Bearer $apiKey"
    };

    final Uri uri = Uri.parse(endPoint);

   final response = await http.get(
      uri,
      headers: header
    );
    
    print("GENRES");
    print(response.body);
    print("---------------");


    if(response.statusCode == 200){


      //desrialization

      final responseMap = jsonDecode(response.body);

      final genresList = responseMap["genres"] as List;


      Map<int,String> result = {};


      for(var map in genresList ){

        //Append to result map
        result[map["id"]] = map["name"];

      }

      print("final result map:  $result");

      vm.genreMap = result;



    }

 }

}