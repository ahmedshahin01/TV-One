// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tv_one/controller/showController.dart';
import 'package:tv_one/view/widgets/rounded_shap.dart';

import '../widgets/customtext.dart';

class EpisViewContent extends StatelessWidget {
  int index;
  EpisViewContent({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowController>(builder: (controller) {
      return Card(
        child: Column(
          children: [
            Image.network(
              controller.episodesList[index].image!.medium.toString(),
              alignment: Alignment.topLeft,
              errorBuilder: ((context, error, stackTrace) =>
                  Image.asset('assets/splash.jpg')),
            ),
            SizedBox(width: 9),
            CustomText(
              controller.episodesList[index].name.toString(),
              20,
              Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            Row(
              children: [],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 20),
                RoundedShapeInfo(
                  title: 'Season:',
                  content: CustomText(
                    controller.episodesList[index].season.toString(),
                    18,
                    Color.fromARGB(255, 9, 137, 241),
                    alignment: Alignment.center,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundedShapeInfo(
                      title: 'E: ',
                      content: CustomText(
                        controller.episodesList[index].number.toString(),
                        18,
                        Colors.blue,
                        alignment: Alignment.center,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomText(
                        controller.episodesList[index].rating!.average
                            .toString(),
                        22,
                        Colors.green,
                        fontWeight: FontWeight.bold,
                        alignment: Alignment.center,
                      ),
                  ],
                ),
                  GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                            title: 'Summary',
                            backgroundColor: Color.fromARGB(255, 72, 73, 73),
                            content: Column(
                              children: [
                                SingleChildScrollView(
                                  child: SizedBox(
                                    width: 250,
                                    height: 250,
                                    child: CustomText(
                                        controller.episodesList[index].summary
                                            .toString()
                                            .replaceAll('<p>', '')
                                            .replaceAll('<b>', '')
                                            .replaceAll('</p>', '')
                                            .replaceAll('</b>', '')
                                            .replaceAll('</i>', '')
                                            .replaceAll('<i>', ''),
                                        20,
                                        Colors.blue),
                                  ),
                                  
                                ),
                                TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: CustomText(
                                'Close',
                                20,
                                Colors.green,
                                alignment: Alignment.center,
                              ))
                              ],
                            ),
                            
                            );
                      },
                      child: CustomText(
                       'Summary',
                        22,
                        Colors.blue,
                        fontWeight: FontWeight.bold,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                  
              ],
            ),
            /* SizedBox(
              width: 100,
              height: 30,
              child: CustomText(
                controller.episodesList[index].name.toString(),
                18,
                Color.fromARGB(255, 6, 19, 160),
                fontWeight: FontWeight.bold,
              ),
            ),*/
            SizedBox(height: 10),
          ],
        ),
      );
    });
  }
}
