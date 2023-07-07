import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../Common/theme.dart';
import '../MainPage/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: jBackgroundColor,
      body: SafeArea(
        child: Center(
          child:
          SizedBox(
            height: 330,
            width: 300,
            child: Lottie.asset('assets/news.json',
              width: 350, height: 350, fit: BoxFit.fill,),
          ),
        ),
      ),
    );
  }
}
