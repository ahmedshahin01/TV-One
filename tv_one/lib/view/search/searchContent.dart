/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_one/controller/showController.dart';

import 'customtext.dart';

class searchContnt extends StatelessWidget {
  int index;
  searchContnt({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowController>(builder: (controller) {
      return Card(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Image.network(
                    controller.SearchList[index].image!.medium.toString(),
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
                        controller.SearchList[index].rating!.average.toString(),
                        22,
                        Colors.green,
                        fontWeight: FontWeight.bold,
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(height: 10),
                      /*  CustomText(
                          controller.showList[index].language
                              .toString()
                              .replaceAll('Language.', '')
                              .toLowerCase(),
                          18,
                          Colors.black,
                          alignment: Alignment.topLeft,
                        ),*/
                      CustomText(
                        controller.SearchList[index].network != null
                            ? controller.SearchList[index].network!.name
                                .toString()
                            : '',
                        16,
                        Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                      /*   CustomText(
                            controller.showList[index].schedule != null
                                ? controller.showList[index].schedule!.days
                                    .toString()
                                    .replaceAll('Day.', '')
                                    .toLowerCase()
                                : '',
                            18,
                            Colors.black),*/
                    ],
                  ),
                ),
              ],
            ),
            /* CustomText(
                controller.showList[index].name.toString(),
                18,
                Color.fromARGB(255, 6, 19, 160),
                fontWeight: FontWeight.bold,
              ),*/
            SizedBox(height: 10),
            CustomText(
              controller.SearchList[index].genres
                  .toString()
                  .replaceAll('Genre.', ''),
              14,
              Colors.lightBlue,
            )
          ],
        ),
      );
    });
    
  }
}*/
