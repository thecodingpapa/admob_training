import 'package:admob_training/screens/bottom_ads_screen.dart';
import 'package:admob_training/screens/inline_ads_screen.dart';
import 'package:admob_training/screens/top_ads_screen.dart';
import 'package:flutter/material.dart';

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
                  );
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
                  );
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
                  );
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
