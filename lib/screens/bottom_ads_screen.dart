import 'dart:io';

import 'package:admob_training/dummy.dart';
import 'package:admob_training/main.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BottomAdsScreen extends StatefulWidget {
  const BottomAdsScreen({Key? key}) : super(key: key);

  @override
  _BottomAdsScreenState createState() => _BottomAdsScreenState();
}

class _BottomAdsScreenState extends State<BottomAdsScreen> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAd();
    if (interstitialAd != null) {
      interstitialAd!.show();
    }
  }

  void _loadAd() async {
    final Size screenSize = MediaQuery.of(context).size;

    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            screenSize.width.truncate());

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    _bannerAd = BannerAd(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      size: size,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Anchored adaptive banner failedToLoad: $error');
          ad.dispose();
        },
      ),
    );

    _bannerAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView.builder(
              padding: EdgeInsets.only(
                  bottom: (_bannerAd != null && _isLoaded)
                      ? _bannerAd!.size.height.toDouble()
                      : 0),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(dummies[index].profile),
                  ),
                  title: Text(
                    dummies[index].name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    dummies[index].sub,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(Icons.favorite),
                );
              },
              itemCount: dummies.length,
            ),
            if (_bannerAd != null && _isLoaded)
              Container(
                color: Colors.green,
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(
                  ad: _bannerAd!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
