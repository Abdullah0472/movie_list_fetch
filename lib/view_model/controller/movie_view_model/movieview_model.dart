import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_list_fetch/model/movie/movie_model.dart';

class MovieViewModel extends GetxController {
  var isLoading = true.obs;
  var movieList = <Movie>[].obs;

  @override
  void onInit() {
    fetchMovieData();
    super.onInit();
  }

  Future<void> fetchMovieData() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/trending/all/day?api_key=557ba79020fd74a1d8145fff0925c6cf'),
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var results = jsonResponse['results'] as List;
        movieList.assignAll(results.map((data) => Movie.fromJson(data)).toList());
      } else {
        throw Exception('Failed to load data');
      }
    } finally {
      isLoading(false);
    }
  }
}
