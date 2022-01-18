import 'package:admob_training/dummy.dart';
import 'package:flutter/material.dart';

class BottomAdsScreen extends StatefulWidget {
  const BottomAdsScreen({Key? key}) : super(key: key);

  @override
  _BottomAdsScreenState createState() => _BottomAdsScreenState();
}

class _BottomAdsScreenState extends State<BottomAdsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
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
    );
  }
}
