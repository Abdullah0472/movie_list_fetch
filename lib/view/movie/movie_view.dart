import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list_fetch/res/components/card/movies_cards.dart';
import 'package:movie_list_fetch/res/components/widgets/appbar/custom_app_bar.dart';
import 'package:movie_list_fetch/res/components/widgets/drawer/drawer.dart';
import 'package:movie_list_fetch/view_model/controller/movie_view_model/movieview_model.dart';

class MovieView extends StatelessWidget {
  MovieView({Key? key}) : super(key: key);
  final MovieViewModel movieController = Get.put(MovieViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: const CustomAppBar(title: 'Movies', action: Text(''), icon: true,
        actionIcon: true,),
      body: SafeArea(
        child: Obx(
          () {
            if (movieController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: movieController.movieList.length,
                itemBuilder: (context, index) {
                  var movie = movieController.movieList[index];

                  if (movie.title != null && movie.posterPath != null) {
                    return MovieCard(
                      movieTitle: movie.title.toString(),
                      movieImageUrl: movie.posterPath.toString(),
                      date: movie.releaseDate.toString(),
                      type: movie.mediaType,
                      overview: movie.overview,
                      count: movie.voteCount!.toInt(),
                    );
                  } else {

                    return Container(
                      color: Colors.cyan,
                    );
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}

