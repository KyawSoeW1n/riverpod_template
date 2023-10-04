import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../adhelper/ad_helper.dart';
import '../../../core/state.dart';

final adsNotifierProvider =
    StateNotifierProvider.autoDispose<AdsNotifier, State<BannerAd>>((ref) {
  return AdsNotifier();
});

class AdsNotifier extends StateNotifier<State<BannerAd>> {
  AdsNotifier() : super(const State.init()) {
    log("GOOGLE ADS INIT");
    final bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          state = State.success(ad as BannerAd);
          log("GOOGLE ADS SUCCESS");
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          state = State.error(Exception(err));
        },
      ),
    );

    bannerAd.load();
  }
}
