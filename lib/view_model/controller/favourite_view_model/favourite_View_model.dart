import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  static const favoriteMoviesKey = 'favorite_movies';

  static Future<List<Map<String, dynamic>>> getFavoriteMovies() async {
    final prefs = await SharedPreferences.getInstance();
    final favMoviesJson = prefs.getString(favoriteMoviesKey) ?? '[]';
    return List<Map<String, dynamic>>.from(json.decode(favMoviesJson));
  }

  static Future<void> addFavoriteMovie(Map<String, dynamic> movieData) async {
    final favMovies = await getFavoriteMovies();
    favMovies.add(movieData);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(favoriteMoviesKey, json.encode(favMovies));
  }

  static Future<void> removeFavoriteMovie(String movieTitle) async {
    final favMovies = await getFavoriteMovies();
    final index = favMovies.indexWhere((movie) => movie['title'] == movieTitle);
    if (index != -1) {
      favMovies.removeAt(index);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(favoriteMoviesKey, json.encode(favMovies));
    }
  }

  static Future<bool> isMovieFavorited(String movieTitle) async {
    final favMovies = await getFavoriteMovies();
    return favMovies.any((movie) => movie['title'] == movieTitle);
  }
}

class FavouritesController extends GetxController {
  RxList<Map<String, dynamic>> favouriteMovies = RxList<Map<String, dynamic>>();

  // new addition
  RxMap<String, bool> favoritedStatus = <String, bool>{}.obs;

  @override
  void onInit() {
    loadFavMovies();
    super.onInit();
  }

  void loadFavMovies() async {
    List<Map<String, dynamic>> favMovies = await FavoriteService.getFavoriteMovies();

    favoritedStatus.clear();
    favMovies.forEach((movie) {
      favoritedStatus[movie['title']] = true;
    });

    favouriteMovies.value = favMovies;
  }

  addFavouriteMovie(Map<String, dynamic> movieData) async {
    await FavoriteService.addFavoriteMovie(movieData);
    favoritedStatus[movieData['title']] = true; // update favorited status
    loadFavMovies();
  }

  removeFavouriteMovie(String movieTitle) async {
    await FavoriteService.removeFavoriteMovie(movieTitle);
    favoritedStatus[movieTitle] = false; // update favorited status
    loadFavMovies();
  }

  Future<bool> isMovieFavorited(String movieTitle) async {
    return favoritedStatus[movieTitle] ?? false;
  }
}
