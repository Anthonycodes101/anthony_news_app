import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _navIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavbarItems = [
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.home : Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.home : Icons.home),
      label: "Bookmark",
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.home : Icons.home),
      label: "Search",
    ),
  ];

  final List<Widget> _listWidget = [

  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_navIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        items: _bottomNavbarItems,
        onTap: (selected) {
          setState(() {
            _navIndex = selected;
          });
        },
      ),
    );
  }


  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items:_bottomNavbarItems,
      ),
      tabBuilder: (context, index) {
        return _listWidget[index];
      },
    );
  }
}
