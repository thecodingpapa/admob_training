import 'package:admob_training/select.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  runApp(const MyApp());
}

InterstitialAd? interstitialAd;
RewardedAd? rewardedAd;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadInterstitialAd();
    _loadRewardedAd();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
        adUnitId: InterstitialAd.testAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            interstitialAd = ad;

            interstitialAd!.fullScreenContentCallback =
                FullScreenContentCallback(
              onAdShowedFullScreenContent: (InterstitialAd ad) =>
                  print('%ad onAdShowedFullScreenContent.'),
              onAdDismissedFullScreenContent: (InterstitialAd ad) {
                ad.dispose();
                interstitialAd = null;
                _loadInterstitialAd();
              },
              onAdFailedToShowFullScreenContent:
                  (InterstitialAd ad, AdError error) {
                print('$ad onAdFailedToShowFullScreenContent: $error');
                ad.dispose();
              },
              onAdImpression: (InterstitialAd ad) =>
                  print('$ad impression occurred.'),
            );
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  void _loadRewardedAd() {
    RewardedAd.load(
        adUnitId: RewardedAd.testAdUnitId,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            rewardedAd = ad;

            rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (RewardedAd ad) =>
                  print('%ad onAdShowedFullScreenContent.'),
              onAdDismissedFullScreenContent: (RewardedAd ad) {
                ad.dispose();
                rewardedAd = null;
                _loadRewardedAd();
              },
              onAdFailedToShowFullScreenContent:
                  (RewardedAd ad, AdError error) {
                print('$ad onAdFailedToShowFullScreenContent: $error');
                ad.dispose();
              },
              onAdImpression: (RewardedAd ad) =>
                  print('$ad impression occurred.'),
            );
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Godo'),
      home: Scaffold(
        body: Select(),
      ),
    );
  }
}
