import 'dart:convert';

import 'package:listmovie/core/constant/api_constant.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Data_layer/popular_movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<MovieModel> fetchMovieList() async {
    final response =
        await http.get(Uri.parse(ApiUrls.baseUrl + ApiUrls.popularMovieUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      print(decodedData);
      return MovieModel.fromJson(decodedData);
    } else
      print("error");
    throw Exception("Failed to load Data");
  }


  static Future<MovieModel> fetchSearchMovieList({required String query}) async {
    final response = await http.get(
      Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=f9c7319240685be6f92c1d3547a815f6&query=$query")
          //ApiUrls.baseUrl + ApiUrls.popularMovieUrl + ApiUrls.query + query),
    );
    if(response.statusCode ==200){
      final decodedData = jsonDecode(response.body);
      return MovieModel.fromJson(decodedData);
    }else
      print("error");
    throw Exception("Failed to load Data");
  }
}


class NetworkError extends Error {}
