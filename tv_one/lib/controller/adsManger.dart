import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class adsManger {
  static bool testAd = false;
  
  static bool testAd2 = true;
  static String get rewardedID {
    if (testAd2 = true) {
      return RewardedAd.testAdUnitId;
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-4245840455271849/2239760731';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4245840455271849/6342657277';
    } else {
      throw UnsupportedError('message');
    }
  }
  static String get bannerADID {
    if (testAd = true) {
      return BannerAd.testAdUnitId;
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-4245840455271849/3317022772';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4245840455271849/2207971149';
    } else {
      throw UnsupportedError('message');
    }
  }
}
