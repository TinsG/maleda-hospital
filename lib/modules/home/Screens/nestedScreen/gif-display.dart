import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:maleda_hospital/modules/widget/gradiant-animation.dart';
import 'package:maleda_hospital/modules/widget/sub-catagory-list-widget.dart';
import 'package:maleda_hospital/styles/app_colors.dart';

class DisplayGif extends StatefulWidget {
  final selectedObject;
  const DisplayGif({Key? key, this.selectedObject}) : super(key: key);

  @override
  State<DisplayGif> createState() => _DisplayGifState();
}

class _DisplayGifState extends State<DisplayGif> with TickerProviderStateMixin {
  bool isFullScreen = false;
  int _count = 0;
  late double gifWidth = MediaQuery.of(context).size.width;
  late double gifHight = MediaQuery.of(context).size.height / 2;

  Color primaryColor =
      WidgetsBinding.instance?.window.platformBrightness == Brightness.dark
          ? Colors.amber.shade100
          : AppColors.darkBlack.withOpacity(0.6);
  Color secondaryColor =
      WidgetsBinding.instance?.window.platformBrightness == Brightness.dark
          ? AppColors.darkBlack
          : AppColors.inputActive;
  @override
  Widget build(BuildContext context) {
    print(widget.selectedObject);
    return Scaffold(
      body: Stack(
        children: [
          GradiantAnimationBackground(),
          _buildSizeAnimationWithAnimatedContainer(_gifImageDisplay(), gifHight),
          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.only(top: 35),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.chevron_left_rounded,
                        size: 40,
                        color: primaryColor,
                      )),
                ),
              ),
              Expanded(child: Container()),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 35, right: 10),
                  child: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            isFullScreen = !isFullScreen;
                            gifHight = isFullScreen
                                ? MediaQuery.of(context).size.height / 0.5
                                : (MediaQuery.of(context).size.height / 2);
                          },
                        );
                      },
                      icon: Icon(
                        isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                        size: 40,
                        color: primaryColor,
                      )),
                ),
              ),
            ],
          ),
          _buildSizeAnimationWithAnimatedContainer(_descriptionBoxofGif(),(MediaQuery.of(context).size.height)),
          _buildSizeAnimationWithAnimatedContainer(_listbelowGif(),(MediaQuery.of(context).size.height))
        ],
      ),
    );
  }

  Widget _gifImageDisplay() {
    return Container(
      width: gifWidth,
      height: gifHight,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black45.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        image: new DecorationImage(
          image: ExactAssetImage(
            widget.selectedObject["listImage"],
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  _descriptionBoxofGif() {
    return !isFullScreen
        ? Center(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width - 130,
              height: 70,
              padding: const EdgeInsets.only(
                  bottom: 10, top: 10, left: 30, right: 30),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: secondaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    widget.selectedObject["listAm"],
                    style: TextStyle(fontSize: 16, color: primaryColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.selectedObject["listEn"],
                    style: TextStyle(fontSize: 12, color: primaryColor),
                  ),
                ],
              ),
            ),
          )
        : Container();
  }

  _listbelowGif() {
    return !isFullScreen
        ? Container(
            margin: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height / 2) + 55),
            height: (MediaQuery.of(context).size.height / 2),
            child: SubCategoryListWidget()
                .getSubCategoryList(widget.selectedObject),
          )
        : Container();
  }

  Widget _buildSizeAnimationWithAnimatedContainer(functionName, height) {
    return AnimatedContainer(
      width: gifWidth,
      height: height,
      duration: const Duration(milliseconds: 300),
      child: functionName,
    );
  }

  
}
