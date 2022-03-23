// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:tv_one/controller/showController.dart';
import 'package:tv_one/view/widgets/customtext.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Epsilode/EpisodeView.dart';
import '../Home/showInfo.dart';
import '../widgets/rounded_shap.dart';

class SearchResVieww extends StatelessWidget {
  String str;
  SearchResVieww({
    Key? key,
    required this.str,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: GetBuilder<ShowController>(
        init: Get.find<ShowController>(),
        builder: (controller) {
          str = controller.searchStr.value;
          print('ggggggggggggggggg');
          print(str);
          print(controller.SearchRes.value.name);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blue,
                ),
              ),
              title: CustomText('Search', 30, Colors.lightBlue),
            ),
            body: FutureBuilder(
              future: controller.getSearchData(str),
              builder: (context, AsyncSnapshot snapshot) {
                if (controller.isloading == false) {
                  return ContentFun(controller);
                } else {
                  return Center(
                    child: LottieBuilder.asset('assets/search.json'),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  Card ContentFun(ShowController controller) {
    return Card(
      child: GestureDetector(
        onTap: () {
          final int indexx = controller.showList
              .indexWhere((show) => show.id == controller.SearchRes.value.id);

          Get.to(
            () => ShowInfo(
              index: indexx,
            ),
          );
        },
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image.network(
                    controller.SearchRes.value.image!= null
                        ? controller.SearchRes.value.image!.medium.toString()
                        : '',
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
                        controller.SearchRes.value.rating!.average != null
                            ? controller.SearchRes.value.rating!.average
                                .toString()
                            : '',
                        25,
                        Color.fromARGB(255, 57, 196, 61),
                        fontWeight: FontWeight.bold,
                        alignment: Alignment.center,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  controller.SearchRes.value.name != null
                      ? controller.SearchRes.value.name.toString()
                      : '',
                  22,
                  Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  controller.SearchRes.value.network != null
                      ? controller.SearchRes.value.network!.name.toString()
                      : '',
                  16,
                  Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomText(
              controller.SearchRes.value.genres != null
                  ? controller.SearchRes.value.genres
                      .toString()
                      .replaceAll('Genre.', '')
                  : '',
              18,
              Colors.lightBlue,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  'Sammary',
                  30,
                  Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
                ElevatedButton(
                  onPressed: () {
                    final int indexx = controller.showList.indexWhere(
                        (show) => show.id == controller.SearchRes.value.id);

                    var id = controller.SearchRes.value.id;
                    Get.to(() => EpsilodesView(
                          id: id,
                        ));
                  },
                  child: CustomText(
                    'Episodes',
                    30,
                    Color.fromARGB(255, 41, 42, 43),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            CustomText(
              controller.SearchRes.value.summary != null
                  ? controller.SearchRes.value.summary
                      .toString()
                      .replaceAll('<p>', '')
                      .replaceAll('<b>', '')
                      .replaceAll('</p>', '')
                      .replaceAll('</b>', '')
                      .replaceAll('</i>', '')
                      .replaceAll('<i>', '')
                  : '',
              18,
              Colors.lightBlue,
            ),
            SizedBox(height: 10),
            CustomText(
              'Images',
              30,
              Colors.lightBlue,
              fontWeight: FontWeight.bold,
              //controller.SearchRes.value.id
            ),
            SizedBox(height: 10),
            ImagesViewFun(controller),
            SizedBox(height: 10),
            CustomText(
              'Cast',
              30,
              Colors.lightBlue,
              fontWeight: FontWeight.bold,
              //controller.SearchRes.value.id
            ),
            CastViewFun(controller),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

//
  GetBuilder<ShowController> CastViewFun(ShowController controller) {
    return GetBuilder<ShowController>(
      builder: (controller2) => FutureBuilder(
        future: controller.getCast(controller.SearchRes.value.id),
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
        future: controller.getImages(controller.SearchRes.value.id),
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
