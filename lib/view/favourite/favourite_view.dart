// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list_fetch/res/components/card/movies_cards.dart';
import 'package:movie_list_fetch/view_model/controller/favourite_view_model/favourite_View_model.dart';
import '../../res/components/widgets/appbar/custom_app_bar.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  _FavouriteViewState createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  @override
  Widget build(BuildContext context) {
    final favouritesController = Get.put(FavouritesController());

    return Scaffold(
      appBar: const CustomAppBar(title: 'Favourite Movies', action: Text('')),
      body: SafeArea(
        child: Obx(
              () => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: favouritesController.favouriteMovies.length,
            itemBuilder: (context, index) {
              var movie = favouritesController.favouriteMovies[index];
              return MovieCard(
                movieTitle: movie['title'],
                movieImageUrl: movie['imageUrl'],
                date: movie['date'],
                type: movie['type'],
                overview: movie['overview'],
                count: movie['count'],

              );
            },
          ),
        ),
      ),
    );
  }
}
