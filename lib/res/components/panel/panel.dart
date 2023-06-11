
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movie_list_fetch/res/colors/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;
  final String date;
  final String type;
  final String overview;
  final int count;
  const PanelWidget({Key? key, required this.controller, required this.panelController, required this.date, required this.type, required this.overview, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
    controller: controller,
    padding: EdgeInsets.zero,
    children: [
      const SizedBox(height: 12,),
      buildDragHandle(),
      const SizedBox(height: 30,),
      buildAboutText(),
      const SizedBox(height: 26,),
    ],
  );

  Widget buildDragHandle() => GestureDetector(
    onTap: togglePanel,
    child: Center(
      child: Container(
        width: 30,
        height: 5,
        decoration: BoxDecoration(
          color: AppColor.greyColor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );

  void togglePanel() => panelController.isPanelOpen
  ? panelController.close()
  : panelController.open();

  Widget buildAboutText() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         // SizedBox(width: 10,),
           Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              const Icon(MdiIcons.counter, size: 50, color: AppColor.blackColor,),
              const Text('Vote Count',style: TextStyle(color: AppColor.darkerColor, fontWeight: FontWeight.w500, fontSize: 18),),
              Text(count.toString(),style: const TextStyle(color: AppColor.greyColor, fontWeight: FontWeight.w400, fontSize: 16),)
            ],
          ),
         // SizedBox(width:60 ,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(MdiIcons.calendarMonth, size: 50, color: AppColor.blackColor,),
              const Text('Date',style: TextStyle(color: AppColor.darkerColor, fontWeight: FontWeight.w500, fontSize: 18),),
              Text( date,style: const TextStyle(color: AppColor.greyColor, fontWeight: FontWeight.w400, fontSize: 16),)
            ],
          ),
         // SizedBox(width: 50,),
           Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(MdiIcons.movieOpenPlay, size: 50, color: AppColor.blackColor,),
              const Text('Type',style: TextStyle(color: AppColor.darkerColor, fontWeight: FontWeight.w500, fontSize: 18),),
              Text(type,style: const TextStyle(color: AppColor.greyColor, fontWeight: FontWeight.w400, fontSize: 16),),
            ],
          ),
        ],
      ),
        const SizedBox(height: 10,),
        const Divider(),
         Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  MdiIcons.messageReplyText,
                  size: 45,
                  color: AppColor.blackColor,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    overview,
                    style: const TextStyle(
                      color: AppColor.greyColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )

      ],
    ),
  );
}
