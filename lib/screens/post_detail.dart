import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class PostDetail extends StatelessWidget {
  DocumentSnapshot post;

  PostDetail({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime postTime = post['date'].toDate();
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${DateFormat.yMMMMEEEEd().format(postTime)}',
                style: TextStyle(fontSize: 20)),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.height * 0.4,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.network(post['imageURL'], fit: BoxFit.contain),
              ),
              Text("${post['quantity']} items",
                style: TextStyle(
                  fontSize: 18)),
              Text('Location: (${post['latitude'].toString()}, ' 
                '${post['longitude'].toString()})'
              ),
            ],
          )
        ),
      ),
    );
  }
}