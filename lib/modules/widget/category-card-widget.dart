import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:maleda_hospital/styles/app_colors.dart';

class CategoryCardWidget {
  Container catagoryCard(BuildContext context, catagories, index) {
    return Container(
      width: (MediaQuery.of(context).size.width - 60) / 2,
      height: 230,
      margin: EdgeInsets.only(left: 20, bottom: 10, top: 10),
      padding: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
          color:  WidgetsBinding.instance?.window.platformBrightness == Brightness.dark?Colors.orangeAccent.shade100.withOpacity(0.5):Colors.white60,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: Offset(5, 5),
                color: WidgetsBinding.instance?.window.platformBrightness == Brightness.dark?AppColors.white.withOpacity(0.1):AppColors.lightBlack.withOpacity(0.1)),
            BoxShadow(
                blurRadius: 5,
                offset: Offset(-5, -5),
                color: WidgetsBinding.instance?.window.platformBrightness == Brightness.dark?AppColors.white.withOpacity(0.1):AppColors.lightBlack.withOpacity(0.1)),
          ]),
      child: Center(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Lottie.asset(catagories[index]['icon']),
              Text(
                catagories[index]['titleAm'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: WidgetsBinding.instance?.window.platformBrightness == Brightness.dark?AppColors.primaryColor:AppColors.darkBlack),
              ),
              Text(
                catagories[index]['titleEn'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 10, color: WidgetsBinding.instance?.window.platformBrightness == Brightness.dark?AppColors.primaryColor:AppColors.darkBlack),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
