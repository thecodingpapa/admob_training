import 'dart:convert';

import 'package:admob_training/dummy.dart';
import 'package:flutter/material.dart';

class InlineAdsScreen extends StatefulWidget {
  const InlineAdsScreen({Key? key}) : super(key: key);

  @override
  _InlineAdsScreenState createState() => _InlineAdsScreenState();
}

class _InlineAdsScreenState extends State<InlineAdsScreen> {
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
