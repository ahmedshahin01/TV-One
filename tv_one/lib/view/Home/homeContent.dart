// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_one/controller/showController.dart';
import 'package:tv_one/uitil/responsive.dart';
import 'package:tv_one/view/Home/showInfo.dart';
import 'package:tv_one/view/widgets/customtext.dart';

class Content extends StatelessWidget {
  int index;
  Content(this.index);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowController>(
      builder: (controller) => Responsive(
        MobileWidget: GestureDetector(
            onTap: () {
            //  controller.ShowAd();
              Get.to(() => ShowInfo(index: index));
            },
            child: MobileContentFun(controller)),
        TabletWidget: GestureDetector(
            onTap: () {
             // controller.ShowAd();
              Get.to(
                () => ShowInfo(
                  index: index,
                ),
              );
            },
            child: TabletContentFun(controller)),
        webWidget: GestureDetector(
            onTap: () {
            //  controller.ShowAd();
              Get.to(() => ShowInfo(index: index));
            },
            child: TabletContentFun(controller)),
      ),

      /*Card(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.network(
                    controller.showList[index].image!.medium.toString(),
                    errorBuilder: ((context, error, stackTrace) =>
                        Image.asset('assets/splash.jpg')),
                  ),
                ),
                SizedBox(width: 9),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      controller.showList[index].rating!.average.toString(),
                      22,
                      Colors.green,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.center,
                    ),
                    CustomText(
                        controller.showList[index].language
                            .toString()
                            .replaceAll('Language.', '')
                            .toLowerCase(),
                        18,
                        Colors.black),
                    CustomText(
                      controller.showList[index].network != null
                          ? controller.showList[index].network!.name.toString()
                          : '',
                      22,
                      Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                        controller.showList[index].schedule != null
                            ? controller.showList[index].schedule!.days
                                .toString()
                                .replaceAll('Day.', '')
                                .toLowerCase()
                            : '',
                        18,
                        Colors.black),
                  ],
                ),
              ],
            ),
            CustomText(
              controller.showList[index].name.toString(),
              22,
              Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
                controller.showList[index].genres
                    .toString()
                    .replaceAll('Genre.', ''),
                18,
                Colors.black)
          ],
        ),
      ),*/
    );
  }

  Card MobileContentFun(ShowController controller) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Image.network(
                  controller.showList[index].image != null
                      ? controller.showList[index].image!.medium.toString()
                      : controller.showList[index + 1].image!.medium.toString(),
                  alignment: Alignment.topLeft,
                  errorBuilder: ((context, error, stackTrace) =>
                      Image.asset('assets/splash.jpg')),
                ),
              ),
              SizedBox(width: 9),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    CustomText(
                      controller.showList[index].rating!.average != null
                          ? controller.showList[index].rating!.average
                              .toString()
                          : '!!',
                      18,
                      Colors.green,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: CustomText(
                        controller.showList[index].network != null
                            ? controller.showList[index].network!.name.toString()
                            : '',
                        16,
                        Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: CustomText(
                        controller.showList[index].genres != null
                            ? controller.showList[index].genres
                                .toString()
                                .replaceAll('Genre.', '')
                            : '',
                        10,
                        Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          CustomText(
            controller.showList[index].name != null
                ? controller.showList[index].name.toString()
                : '',
            16,
            Colors.lightBlue,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Card TabletContentFun(ShowController controller) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                // flex: 5,
                child: Image.network(
                  controller.showList[index].image!.medium.toString(),
                  alignment: Alignment.topLeft,
                  errorBuilder: ((context, error, stackTrace) =>
                      Image.asset('assets/splash.jpg')),
                ),
              ),
              SizedBox(width: 9),
              Expanded(
                //flex: 2,
                child: Column(
                  children: [
                    CustomText(
                      controller.showList[index].rating!.average.toString(),
                      22,
                      Colors.green,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.topLeft,
                    ),
                    CustomText(
                      controller.showList[index].language
                          .toString()
                          .replaceAll('Language.', '')
                          .toLowerCase(),
                      18,
                      Colors.blue,
                      alignment: Alignment.topLeft,
                    ),
                    CustomText(
                      controller.showList[index].network != null
                          ? controller.showList[index].network!.name.toString()
                          : '',
                      22,
                      Color.fromARGB(255, 5, 171, 248),
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      controller.showList[index].schedule != null
                          ? controller.showList[index].schedule!.days
                              .toString()
                              .replaceAll('Day.', '')
                              .toLowerCase()
                          : '',
                      18,
                      Colors.blue,
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
              ),
            ],
          ),
          CustomText(
            controller.showList[index].name.toString(),
            22,
            Color.fromARGB(255, 115, 181, 214),
            fontWeight: FontWeight.bold,
          ),
          CustomText(
              controller.showList[index].genres
                  .toString()
                  .replaceAll('Genre.', ''),
              18,
              Color.fromARGB(255, 6, 8, 24))
        ],
      ),
    );
  }
}
