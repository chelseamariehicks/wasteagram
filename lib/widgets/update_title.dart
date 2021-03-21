import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int itemCount;
    return StreamBuilder(
      stream: Firestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot) {
        itemCount = 0;
        if(snapshot.hasData && snapshot.data.documents != null && 
        snapshot.data.documents.length > 0) {
          for(int i = 0; i < snapshot.data.documents.length; i++) {
            itemCount += snapshot.data.documents[i]['quantity'];
          }
        }
        return Text('Wasteagram - $itemCount');
      }
    );
  }
}