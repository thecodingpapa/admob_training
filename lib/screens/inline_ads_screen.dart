import 'dart:convert';

import 'package:admob_training/dummy.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InlineAdsScreen extends StatefulWidget {
  const InlineAdsScreen({Key? key}) : super(key: key);

  @override
  _InlineAdsScreenState createState() => _InlineAdsScreenState();
}

class _InlineAdsScreenState extends State<InlineAdsScreen> {
  bool _isLoaded = false;
  BannerAd? myBanner;

  Size get _screenSize => MediaQuery.of(context).size;
  AdSize? _adSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAd();
  }

  void _loadAd() {
    AdSize size =
        AdSize.getInlineAdaptiveBannerAdSize(_screenSize.width.truncate(), 200);

    myBanner = BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: size,
        request: AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) async {
            print('Inline adaptive banner loaded: ${ad.responseInfo}');
            BannerAd bannerAd = (ad as BannerAd);
            final AdSize? size = await bannerAd.getPlatformAdSize();
            if (size == null) {
              print('Error: getPlatformAdSize() returned null for $bannerAd');
              return;
            }
            setState(() {
              myBanner = bannerAd;
              _isLoaded = true;
              _adSize = size;
            });
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            ad.dispose();
            print('Ad failed to load: $error');
          },
          onAdOpened: (Ad ad) => print('Ad opened.'),
          onAdClosed: (Ad ad) => print('Ad closed.'),
          onAdImpression: (Ad ad) => print('Ad impression.'),
        ));
    myBanner!.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 3) {
            if (myBanner != null && _adSize != null && _isLoaded) {
              return Container(
                alignment: Alignment.center,
                height: _adSize!.height.toDouble(),
                width: _adSize!.width.toDouble(),
                child: AdWidget(
                  ad: myBanner!,
                ),
              );
            } else {
              return Container();
            }
          }

          int realIndex = (index < 3) ? index : index - 1;

          return ListTile(
            leading: CircleAvatar(
              foregroundImage: NetworkImage(dummies[realIndex].profile),
            ),
            title: Text(
              dummies[realIndex].name,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              dummies[realIndex].sub,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.favorite),
          );
        },
        itemCount: dummies.length + 1,
      ),
    );
  }
}
