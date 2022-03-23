// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:tv_one/controller/showController.dart';
import 'package:tv_one/uitil/responsive.dart';
import 'package:tv_one/view/search/Search.dart';
import 'package:tv_one/view/Home/homeContent.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class HomeView extends GetWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    print('555555555515555');
    print(formattedDate);
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: GetBuilder<ShowController>(
        init: Get.find<ShowController>(),

        // ignore: prefer_const_constructors
        builder: (controller) => Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 50),
                  /* Expanded(
                          child: FutureBuilder(
                              future: controller.getDayShows(),
                              builder: (context, AsyncSnapshot snapshot) {
                                return Expanded(
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Content(index);
                                      },
                                      separatorBuilder: (context, index) =>
                                          SizedBox(width: 10),
                                      itemCount: controller.showDayList.length),
                                );
                              }),
                        ),*/
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
              Column(
                children: [
                  SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    child: SearchTextFieldFun(controller),
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: controller.bannerWidget(),
        ),
      ),
    );
  }

  Container SearchTextFieldFun(ShowController controller) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 75, 73, 73)),
      child: Form(
        key: _formKey,
        child: TextFormField(
          onSaved: (val) {
            controller.searchStr.value = val.toString();
            print('val0000000000000000000');
            print(val);
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                _formKey.currentState?.save();
                print('554564646431');
                print(controller.searchStr.value);
                Get.to(
                  () => SearchResVieww(
                    str: controller.searchStr.value,
                  ),
                );
              },
              icon: Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  FutureBuilder<dynamic> mobileViewFun(ShowController controller) {
    return FutureBuilder(
        future: controller.getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (controller.isloading==false) {
            return RefreshIndicator(
              onRefresh: () async {
                controller.randomNumber();
                controller.getData();
              },
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 3,
                crossAxisSpacing: 2,
                itemCount: controller.showList.length,
                itemBuilder: (context, index) {
                  return Content(index);
                  //Content(index);
                },
              ),
            );
          } else {
            return Center(
              child: LottieBuilder.asset('assets/videocam.json'),
            );
          }
        });
  }

  FutureBuilder<dynamic> TabletViewFun(ShowController controller) {
    return FutureBuilder(
        future: controller.getData(),
        builder: (context, AsyncSnapshot snapshot) {
          return MasonryGridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 3,
            itemCount: controller.showList.length,
            itemBuilder: (context, index) {
              return Content(index);
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
            itemCount: controller.showList.length,
            itemBuilder: (context, index) {
              return Content(index);
              //Content(index);
            },
          );
        });
  }
}
