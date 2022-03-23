// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:tv_one/controller/showController.dart';
import 'package:tv_one/view/widgets/customtext.dart';

import '../../uitil/responsive.dart';
import 'EpislodeViewContent.dart';

class EpsilodesView extends StatelessWidget {
  int? index;
  int? id;
  EpsilodesView({
    Key? key,
    this.index,
    this.id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: GetBuilder<ShowController>(
          init: Get.find<ShowController>(),

          // ignore: prefer_const_constructors
          builder: (controller) => Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.blueAccent,
                      )),
                  title: CustomText(
                      index != null
                          ? controller.showList[index as int].name.toString()
                          : 'Epsilode',
                      30,
                      Colors.blue),
                ),
                body: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 5),
                        Expanded(
                            // flex: 3,
                            child: Responsive(
                          MobileWidget: mobileViewFun(controller),
                          TabletWidget: TabletViewFun(controller),
                          webWidget: WebViewFun(controller),
                        )
                            // mobileViewFun(controller),
                            ),
                      ],
                    ),
                  ],
                ),
              )),
    );
  }

  FutureBuilder<dynamic> mobileViewFun(ShowController controller) {
    return FutureBuilder(
      future: controller.getEpisolde(id),
      builder: (context, AsyncSnapshot snapshot) {
        return AlignedGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2
          ,
          itemCount: controller.episodesList.length,
          itemBuilder: (context, index) {
            return EpisViewContent(
              index: index,
            );
          },
        );
      },
    );
  }

  FutureBuilder<dynamic> TabletViewFun(ShowController controller) {
    return FutureBuilder(
        future: controller.getData(),
        builder: (context, AsyncSnapshot snapshot) {
          return MasonryGridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 3,
            itemCount: controller.episodesList.length,
            itemBuilder: (context, index) {
              return EpisViewContent(
                index: index,
              );
              //Content(index);
            },
          );
        });
  }

  FutureBuilder<dynamic> WebViewFun(ShowController controller) {
    return FutureBuilder(
        future: controller.getData(),
        builder: (context, AsyncSnapshot snapshot) {
          return MasonryGridView.count(
            crossAxisCount: 5,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            itemCount: controller.episodesList.length,
            itemBuilder: (context, index) {
              return EpisViewContent(
                index: index,
              );
              //Content(index);
            },
          );
        });
  }
}
