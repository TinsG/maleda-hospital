import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maleda_hospital/modules/widget/gradiant-animation.dart';

class About extends StatelessWidget {
  const About({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: [
            GradiantAnimationBackground(),
          
          Container(
          child: Center(child: Text('About'),),
        ),
        ],
      ),
    );
  }
}