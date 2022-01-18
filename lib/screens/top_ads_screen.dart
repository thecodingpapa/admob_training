import 'package:admob_training/dummy.dart';
import 'package:flutter/material.dart';

class TopAdsScreen extends StatefulWidget {
  const TopAdsScreen({Key? key}) : super(key: key);

  @override
  _TopAdsScreenState createState() => _TopAdsScreenState();
}

class _TopAdsScreenState extends State<TopAdsScreen> {
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
