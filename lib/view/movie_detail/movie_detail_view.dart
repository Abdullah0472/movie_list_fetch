import 'package:flutter/material.dart';
import 'package:movie_list_fetch/res/components/panel/panel.dart';
import 'package:movie_list_fetch/res/components/widgets/appbar/custom_app_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MovieDetailView extends StatelessWidget {
  final String movieImageUrl;
  final String date;
  final String type;
  final String overview;
  final int count;
  MovieDetailView(
      {Key? key,
      required this.movieImageUrl,
      required this.date,
      required this.type,
      required this.overview,
      required this.count})
      : super(key: key);
  final panelController = PanelController();
  @override
  Widget build(BuildContext context) {
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.5;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.1;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Movies Detail', action: Text('')),
      body: SafeArea(
        child: SlidingUpPanel(
          controller: panelController,
          parallaxEnabled: true,
          parallaxOffset: 0.5,
          minHeight: panelHeightClosed,
          maxHeight: panelHeightOpen,
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image(
              height: 180,
              width: size.width,
              fit: BoxFit.cover,
              // ignore: unnecessary_null_comparison
              image: NetworkImage(movieImageUrl != null
                  ? 'https://image.tmdb.org/t/p/w500' + movieImageUrl!
                  : 'default_image_url'), // Prepend the base URL),
            ),
          ),
          panelBuilder: (controller) => PanelWidget(
            controller: controller,
            panelController: panelController,
            date: date,
            type: type,
            overview: overview,
            count: count,
          ),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
    );
  }
}
