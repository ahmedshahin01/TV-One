import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tv_one/controller/adsManger.dart';
import 'package:tv_one/model/Cast.dart';
import 'package:tv_one/model/ImagesModel.dart';
import 'package:tv_one/model/epslodeModel.dart';

import 'package:tv_one/model/showmodel.dart';
import 'package:tv_one/services/services.dart';

class ShowController extends GetxController {
  var showList = <ShowModel>[].obs;
  Rx<ShowModel> SearchRes = ShowModel().obs;
  var episodesList = <EpisodesModel>[].obs;

  //var showDayList = <ShowModel>[].obs;
  var castList = <CastModel>[].obs;
  var imageslist = <ShowImageModel>[].obs;
bool isloading=true;
  RxString searchStr = ''.obs;
  String? str2;
  getData() async {
    try {
      var showsData = await RemoteServices1().fetchshow(randomNumber());
      showList.value = showsData!;
      print('/////////////////////1////');
      print('done');
      isloading=false;
    } finally {}
  }

  //

  int randomNumber() {
    var random = new Random();

    int min = 0;

    int max = 20;

    int result = min + random.nextInt(max - min);
    print('done..................................');
    print(result);
    return result;
  }

  //
  getSearchData(str) async {
    try {
      var SearchData = await RemoteServices1().fetchSearch(str);
      SearchRes.value = SearchData!;
      print('/////////////////////1////');
      print('done');
            isloading=false;

      
    } finally {}
  }

  getCast(id) async {
    var castData = await RemoteServices1().fetchCast(id);
    castList.value = castData!;
  }

  getImages(id) async {
    var Images = await RemoteServices1().fetchImages(id);
    imageslist.value = Images!;
  }

/*
  getDayShows() async {
    try {
      var Dayshows = await RemoteServices1().fetchDayShows();
      showDayList.value = Dayshows!;
      print('000000000000000000000000');
      print('done');
    } finally {}
  }*/

/////\
  getEpisolde(id) async {
    try {
      var Episolde = await RemoteServices1().fetchEpislode(id);
      episodesList.value = Episolde!;
      print('/////////////////////2////');
      print('Episoldes');
    } finally {}
  }

//////
  ///
  ///
  ///
  ///
//ads
  @override
  void onInit() {
    super.onInit();
    RewardAdLoading();
    initAds();
     initBanner();
     initBanner2();
  }

//this for banner Ads
  late BannerAd bannerAd;
  
  late BannerAd bannerAd2;
  bool isBannerAdReady = false;
  initBanner() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: adsManger.bannerADID,
        listener: BannerAdListener(onAdLoaded: (ad) {
          isBannerAdReady = true;
          update();
        }, onAdFailedToLoad: (err, ad) {
          isBannerAdReady = false;
          update();
        }),
        request: AdRequest());
    bannerAd.load();
  }
   initBanner2() {
    bannerAd2 = BannerAd(
        size: AdSize.banner,
        adUnitId: adsManger.bannerADID,
        listener: BannerAdListener(onAdLoaded: (ad) {
          isBannerAdReady = true;
          update();
        }, onAdFailedToLoad: (err, ad) {
          isBannerAdReady = false;
          update();
        }),
        request: AdRequest());
    bannerAd2.load();
  }

  Widget bannerWidget() {
    if (isBannerAdReady) {
      return Container(
      height: bannerAd.size.height.toDouble(),
      width: bannerAd.size.width.toDouble(),
      child: AdWidget(ad: bannerAd),
    );
    } else {
      return SizedBox(width: double.infinity,height: 50,);
    }
    
  }

  Widget bannerWidget2() {
    if (isBannerAdReady) {
      return Container(
      height: bannerAd.size.height.toDouble(),
      width: bannerAd.size.width.toDouble(),
      child: AdWidget(ad: bannerAd),
    );
    } else {
      return SizedBox(width: double.infinity,height: 50,);
    }
    
  }
  ///
  ///
  ///
  ///
//ths for rewarded Ads

  late RewardedAd rewardedAd;
  bool isrewrdadReady = false;
  int cridet = 0;
  Future<InitializationStatus> initAds() {
    return MobileAds.instance.initialize();
  }

  RewardAdLoading() {
    RewardedAd.load(
      adUnitId: adsManger.rewardedID,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          rewardedAd = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: ((ad) {
              isrewrdadReady = false;
              RewardAdLoading();
            }),
          );
          isrewrdadReady = true;

          update();
        },
        onAdFailedToLoad: (Error) {
          print(Error);
        },
      ),
    );
  }

  ShowAd() {
    rewardedAd.show(onUserEarnedReward: (ad, rewardItem) {
      cridet = rewardItem.amount.toInt();
      update();
    });
  }

///////////

}
