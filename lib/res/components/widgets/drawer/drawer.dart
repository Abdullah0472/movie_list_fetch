import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movie_list_fetch/res/components/widgets/text/text_widget.dart';
import 'package:movie_list_fetch/res/routes/routes_name.dart';
import '../../../assets/images.dart';
import '../../../colors/colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColor.applicationColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(ImageAssets.movie),
                  ),
                ),
                const SizedBox(height: 9.0),
                //These can go here or below the header with the same background color
                // Divider(
                //   color: Colors.grey.shade400, //color of divider
                //   height: 3, //height spacing of divider
                //   thickness: 2, //thickness of divier line
                //   indent: 5, //spacing at the start of divider
                //   endIndent: 35, //spacing at the end of divider
                // ),
                const SizedBox(height: 5.0),
                customText(
                  "Movies App",
                  false,
                  size: 19,
                ),
                customText("List of Movies ", false, size: 15),
                //...additional header items here
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              MdiIcons.heart,
              color: AppColor.applicationColor,
              size: 30,
            ),
            title: customText("Favourite", true),
            onTap: () {
               Get.toNamed(RouteName.favouriteView);

            },
          ),

        ],
      ),
    );
  }
}
