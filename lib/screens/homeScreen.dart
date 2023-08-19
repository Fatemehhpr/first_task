import 'package:first_task/screens/informationScreen.dart';
import 'package:first_task/screens/loginScreen.dart';
import 'package:flutter/material.dart';

import '../models/data.dart';
import '../widgets/photosList.dart';

class HomePage extends StatefulWidget{
  var data;
  HomePage({Key? key, required this.data}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.yellow.shade700,
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.photo_camera_back_rounded),
            icon: Icon(Icons.photo_camera_back_outlined),
            label: 'Photos',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
      //backgroundColor: Colors.black26,
      body: <Widget>[
        photosListWidget(),
        UserDataForm(data: widget.data)
      ][currentPageIndex],
    );
  }
}

