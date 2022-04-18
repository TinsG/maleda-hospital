import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maleda_hospital/styles/app_colors.dart';

class GradiantAnimationBackground extends StatefulWidget {
  const GradiantAnimationBackground({Key? key}) : super(key: key);

  @override
  State<GradiantAnimationBackground> createState() =>
      _GradiantAnimationBackgroundState();
}

class _GradiantAnimationBackgroundState
    extends State<GradiantAnimationBackground> {
  List<Color> colorList = [
    WidgetsBinding.instance?.window.platformBrightness == Brightness.dark
        ? Colors.blue.shade200.withOpacity(0.7)
        : AppColors.primaryColor,
    WidgetsBinding.instance?.window.platformBrightness == Brightness.dark
        ? Colors.black54
        : AppColors.inputActive.withOpacity(0.9),
    WidgetsBinding.instance?.window.platformBrightness == Brightness.dark
        ? Colors.blue.shade200.withOpacity(0.3)
        : Colors.greenAccent.shade200,
    WidgetsBinding.instance?.window.platformBrightness == Brightness.dark
        ? Colors.grey.shade200
        : Colors.yellow.shade300.withOpacity(0.3)
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor =
      WidgetsBinding.instance?.window.platformBrightness == Brightness.dark
          ? Colors.black26
          : AppColors.primaryColor.withOpacity(0.7);
  Color topColor =
      WidgetsBinding.instance?.window.platformBrightness == Brightness.dark
          ? Colors.black54
          : AppColors.inputActive.withOpacity(0.7);
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 10), () {
      // if (mounted) {
        setState(() {
          bottomColor = WidgetsBinding.instance?.window.platformBrightness ==
                  Brightness.dark
              ? Colors.black26
              : AppColors.primaryColor.withOpacity(0.7);
        });
      // }
    });
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      onEnd: () {
        // if (mounted) {
          setState(() {
            index = index + 1;
            // animate the color
            bottomColor = colorList[index % colorList.length];
            topColor = colorList[(index + 1) % colorList.length];

            //// animate the alignment
            begin = alignmentList[index % alignmentList.length];
            end = alignmentList[(index + 2) % alignmentList.length];
          });
        // }
      },
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: begin, end: end, colors: [bottomColor, topColor])),
    );
  }
}
