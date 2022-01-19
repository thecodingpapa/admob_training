import 'package:admob_training/main.dart';
import 'package:admob_training/screens/bottom_ads_screen.dart';
import 'package:admob_training/screens/inline_ads_screen.dart';
import 'package:admob_training/screens/top_ads_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Select extends StatelessWidget {
  Select({Key? key}) : super(key: key);

  final btnStyle = TextButton.styleFrom(
      backgroundColor: const Color(0xff00ffff), alignment: Alignment.center);
  final txtStyle = const TextStyle(color: Colors.black, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/thecodingpapa.png',
              height: 100,
              width: 100,
            ),
            Text(
              'THE CODING PAPA',
              style: txtStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomAdsScreen()),
                  ).then((value) {
                    if (interstitialAd != null) {
                      interstitialAd!.show();
                    }
                  });
                },
                style: btnStyle,
                child: Text(
                  'BOTTOM',
                  style: txtStyle,
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TopAdsScreen()),
                  ).then((value) {
                    if (rewardedAd != null) {
                      rewardedAd!.show(onUserEarnedReward:
                          (RewardedAd ad, RewardItem rewardItem) {
                        // Reward the user for watching an ad.
                      });
                    }
                  });
                },
                style: btnStyle,
                child: Text(
                  'TOP',
                  style: txtStyle,
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InlineAdsScreen()),
                  ).then((value) {
                    if (rewardedAd != null) {
                      rewardedAd!.show(onUserEarnedReward:
                          (RewardedAd ad, RewardItem rewardItem) {
                        // Reward the user for watching an ad.
                      });
                    }
                  });
                },
                style: btnStyle,
                child: Text(
                  'INLINE',
                  style: txtStyle,
                ))
          ],
        ),
      ),
    );
  }
}
