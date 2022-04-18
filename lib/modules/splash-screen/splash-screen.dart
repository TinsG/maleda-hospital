import 'package:maleda_hospital/modules/home/home-category.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: Container(
       child: Container(
         child: AnimatedSplashScreen(
                duration: 2000,
                splash:   Container(
                  child: Image.asset("assets/images/logo.png", width: MediaQuery.of(context).size.width,),
                ),
                nextScreen: HomeCategory(),
                splashTransition: SplashTransition.fadeTransition,
                ),
       ),
     ));
  }

  @override
  void initState() {
    super.initState();
  }
}
