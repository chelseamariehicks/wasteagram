import 'package:flutter/material.dart';

import 'screens/list_screen.dart';

class App extends StatefulWidget {
  @override 
  AppState createState() => AppState();
}

class AppState extends State<App> {


  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData.dark(),
      home: ListScreen(),
    );
  }
}