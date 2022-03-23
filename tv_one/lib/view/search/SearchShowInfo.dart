// ignore_for_file: must_be_immutable, unnecessary_cast

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/showController.dart';
import '../Epsilode/EpisodeView.dart';
import '../widgets/customtext.dart';
import '../widgets/rounded_shap.dart';

class SearchInfo extends StatelessWidget {
  int index;
    SearchInfo({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


     return GetBuilder<ShowController>(
      builder: (controller) => MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: Scaffold(
          body: ListView(
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
                    CustomText(
                      controller.showList[index as int].name.toString(),
                      35,
                      Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.center,
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
              SizedBox(height: 10),
              CustomText(
                controller.showList[index as int].genres
                    .toString()
                    .replaceAll('Genre.', ''),
                20,
                Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
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
                      var id = controller.showList[index as int].id as int;
                      //  Get.defaultDialog( backgroundColor: Color.fromARGB(255, 41, 42, 43));
                      Get.to(() => EpsilodesView(
                            id: id,
                            index: index as int,
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
                  controller.showList[index as int].summary
                      .toString()
                      .replaceAll('<p>', '')
                      .replaceAll('<b>', '')
                      .replaceAll('</p>', '')
                      .replaceAll('</b>', '')
                      .replaceAll('</i>', '')
                      .replaceAll('<i>', ''),
                  18,
                  Colors.blueAccent),
              SizedBox(height: 10),
              CustomText(
                'Images',
                30,
                Colors.lightBlue,
                fontWeight: FontWeight.bold,
              ),
             // ImagesViewFun(controller),
              SizedBox(
                height: 10,
              ),
              CustomText(
                'Cast',
                30,
                Colors.lightBlue,
                fontWeight: FontWeight.bold,
              ),
             // CastViewFun(controller),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
 
  }
}
