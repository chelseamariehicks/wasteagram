import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'new_entry.dart';
import '../widgets/posts_list.dart';
import '../widgets/update_title.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  File image;
  final picker = ImagePicker();

  Future<void> getImage() async {
    var currentTime = new DateTime.now();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);
    StorageReference storageReference = FirebaseStorage.instance.ref().child(currentTime.toString() + '.jpg');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    final url = await storageReference.getDownloadURL();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewEntry(url: url)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UpdateTitle(),
      ),
      body: PostsList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Semantics(
        button: true,
        onTapHint: 'Select a photo',
        label: 'Select a photo',
        child: FloatingActionButton(
          child: Icon(Icons.camera_alt_rounded),
          onPressed: () {
            getImage();
          },
        ),
      ),  
    );
  }
}