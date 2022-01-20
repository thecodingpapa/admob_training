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
  NativeAd? myNativeAd;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAd();
  }

  void _loadAd() {
    myNativeAd = NativeAd(
        adUnitId: NativeAd.testAdUnitId,
        request: AdRequest(),
        listener: NativeAdListener(
          onAdLoaded: (Ad ad) async {
            setState(() {
              myNativeAd = (ad as NativeAd);
              _isLoaded = true;
            });
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            ad.dispose();
            print('Ad failed to load: $error');
          },
          onAdOpened: (Ad ad) => print('Ad opened.'),
          onAdClosed: (Ad ad) => print('Ad closed.'),
          onAdImpression: (Ad ad) => print('Ad impression.'),
        ),
        factoryId: 'adFactoryExample');
    myNativeAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 3) {
            if (myNativeAd != null && _isLoaded) {
              return Container(
                alignment: Alignment.center,
                height: 80,
                child: AdWidget(
                  ad: myNativeAd!,
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
