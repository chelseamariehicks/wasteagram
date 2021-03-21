import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../screens/post_detail.dart';

class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('posts').orderBy('date', descending: true).snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData || snapshot.data.documents.length == 0 || snapshot.data.documents == null) {
          return Center(child: CircularProgressIndicator());
        }
        else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    var post = snapshot.data.documents[index];
                    DateTime postTime = post['date'].toDate();
                    return Semantics(
                      button: true,
                      onTapHint: 'Food waste post. Click for post details',
                      label: 'Food waste post. Click for post details',
                      child: ListTile(
                        trailing: Text(post['quantity'].toString(),
                          style: Theme.of(context).textTheme.headline6),
                        title: Text('${DateFormat.yMMMMEEEEd().format(postTime)}',
                          style: Theme.of(context).textTheme.headline6),
                        onTap: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => PostDetail(post: post)));
                        },
                      ),
                    );
                  }
                ),
              ),
            ],
          );
        }
      }
    );
  }
}