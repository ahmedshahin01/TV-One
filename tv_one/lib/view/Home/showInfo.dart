// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:tv_one/controller/showController.dart';
import 'package:tv_one/view/Epsilode/EpisodeView.dart';
import 'package:tv_one/view/widgets/rounded_shap.dart';

import '../widgets/customtext.dart';

class ShowInfo extends StatelessWidget {
  int? index;
  ShowInfo({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowController>(
      builder: (controller) => MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 55,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.lightBlue,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: CustomText(
                            controller.showList[index as int].name.toString(),
                            25,
                            Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: Image.network(
                        controller.showList[index as int].image!.original
                            .toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.lightBlue,
                          ),
                        ),
                        RoundedShapeInfo(
                          title: '',
                          content: CustomText(
                            controller.showList[index as int].rating!.average
                                .toString(),
                            17,
                            Color.fromARGB(255, 57, 196, 61),
                            fontWeight: FontWeight.bold,
                            alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CustomText(
              controller.showList[index as int].genres!=null?
                  controller.showList[index as int].genres
                      .toString()
                      .replaceAll('Genre.', ''):'',
                  17,
                  Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      'Sammary',
                      25,
                      Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                    ),
                    ElevatedButton(
                      onPressed: () {
                       // controller.ShowAd();
                        var id = controller.showList[index as int].id as int;
                        //  Get.defaultDialog( backgroundColor: Color.fromARGB(255, 41, 42, 43));
                        Get.to(() => EpsilodesView(
                              id: id,
                              index: index as int,
                            ));
                      },
                      child: CustomText(
                        'Episodes',
                        25,
                        Color.fromARGB(255, 41, 42, 43),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                CustomText(
                    controller.showList[index as int].summary
                        .toString()
                        .replaceAll('<p>', '')
                        .replaceAll('<b>', '')
                        .replaceAll('</p>', '')
                        .replaceAll('</b>', '')
                        .replaceAll('</i>', '')
                        .replaceAll('<i>', ''),
                    16,
                    Colors.blueAccent),
                SizedBox(height: 10),
                CustomText(
                  'Images',
                  20,
                  Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
                ImagesViewFun(controller),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  'Cast',
                  20,
                  Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
                CastViewFun(controller),
                SizedBox(height: 20),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: controller.bannerAd.size.height.toDouble(),
            width: controller.bannerAd.size.width.toDouble(),
            child: AdWidget(ad: controller.bannerAd2),
          ),
        ),
      ),
    );
  }

  GetBuilder<ShowController> CastViewFun(ShowController controller) {
    return GetBuilder<ShowController>(
      builder: (controller2) => FutureBuilder(
        future: controller.getCast(controller.showList[index as int].id),
        builder: (context, snapshot) {
          return Container(
            height: 251,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, indexCast) {
                  return Card(
                    child: GestureDetector(
                      onDoubleTap: () async {
                        String url =
                            '${controller.castList[indexCast].person!.url}';
                        ;
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: true,
                            enableJavaScript: true,
                            enableDomStorage: true,
                          );
                        } else {
                          print('xxxxxxxxxxxxxxxxxxxxxxx');
                        }
                      },
                      child: Column(
                        children: [
                          CustomText('2 open', 16, Colors.blue),
                          SizedBox(
                            height: 150,
                            child: Image.network(controller
                                .castList[indexCast].person!.image!.medium
                                .toString()),
                          ),
                          SizedBox(height: 11),
                          SizedBox(
                            width: 100,
                            child: CustomText(
                                controller.castList[indexCast].person!.name
                                    .toString(),
                                20,
                                Colors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: controller.castList.length),
          );
        },
      ),
    );
  }

  GetBuilder<ShowController> ImagesViewFun(ShowController controller) {
    return GetBuilder<ShowController>(
      builder: (controller2) => FutureBuilder(
        future: controller.getImages(controller.showList[index as int].id),
        builder: (context, snapshot) {
          return Container(
            height: 202,
            width: 100,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, indexImages) {
                  return Card(
                    child: GestureDetector(
                      onDoubleTap: () async {
                        String url =
                            '${controller.imageslist[indexImages].resolutions!.original!.url}';
                        ;
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: true,
                            enableJavaScript: true,
                            enableDomStorage: true,
                          );
                        } else {
                          print('xxxxxxxxxxxxxxxxxxxxxxx');
                        }
                      },
                      child: Column(
                        children: [
                          CustomText('2 save', 16, Colors.blue),
                          Expanded(
                            child: SizedBox(
                              height: 200,
                              width: 150,
                              child: Image.network(
                                controller2.imageslist[indexImages].resolutions!
                                    .original!.url
                                    .toString(),
                                errorBuilder: (contex, error, starTrack) {
                                  return Image.asset('assetes/splash.jpg');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: controller.imageslist.length),
          );
        },
      ),
    );
  }
}
