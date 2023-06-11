import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list_fetch/res/colors/colors.dart';
import 'package:movie_list_fetch/view/movie_detail/movie_detail_view.dart';
import 'package:movie_list_fetch/view_model/controller/favourite_view_model/favourite_View_model.dart';

class MovieCard extends StatefulWidget {
  final String movieImageUrl;
  final String movieTitle;
  final String date;
  final String type;
  final String overview;
  final int count;

  const MovieCard({
    Key? key,
    required this.movieImageUrl,
    required this.movieTitle,
    required this.date,
    required this.type,
    required this.overview,
    required this.count,
  }) : super(key: key);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  bool isFavorited = false;
  final favouritesController = Get.put(FavouritesController());

  @override
  void initState() {
    super.initState();
    initFavState();
  }

  void initFavState() async {
    isFavorited = await FavoriteService.isMovieFavorited(widget.movieTitle);
    setState(() {});
  }

  void toggleFavorite() {
    if (favouritesController.favoritedStatus[widget.movieTitle] ?? false) {
      favouritesController.removeFavouriteMovie(widget.movieTitle);
    } else {
      favouritesController.addFavouriteMovie({
        'imageUrl': widget.movieImageUrl,
        'title': widget.movieTitle,
        'date': widget.date,
        'type': widget.type,
        'overview': widget.overview,
        'count': widget.count,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Obx(() => GestureDetector(
          onTap: () {
            Get.to(() => MovieDetailView(
                  movieImageUrl: widget.movieImageUrl,
                  date: widget.date,
                  type: widget.type,
                  overview: widget.overview,
                  count: widget.count,
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          height: 180,
                          width: size.width,
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.movieImageUrl != null
                              ? 'https://image.tmdb.org/t/p/w500' +
                                  widget.movieImageUrl!
                              : 'default_image_url'),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: -1,
                        child: Center(
                          child: Text(
                            widget.movieTitle ?? 'No title',
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 15,
                        top: 15,
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: IconButton(
                            icon: Icon(
                              favouritesController
                                          .favoritedStatus[widget.movieTitle] ??
                                      false
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              color: favouritesController
                                          .favoritedStatus[widget.movieTitle] ??
                                      false
                                  ? AppColor.redColor
                                  : AppColor.blackColor,
                            ),
                            onPressed: toggleFavorite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
