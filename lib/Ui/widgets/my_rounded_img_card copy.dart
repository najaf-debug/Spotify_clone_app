// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spotify_clone/Ui/widgets/Uihelper.dart';

class MyRoundedImgCard extends StatelessWidget {
  MyRoundedImgCard({
    super.key,
    this.mWidth = 100,
    this.mHeight = 100,
    required this.imgPath,
    this.isSpotifyOriginal = true,
    this.isBlackBg = true,
  });

  double mWidth;
  double mHeight;
  String imgPath;
  bool isSpotifyOriginal;
  bool isBlackBg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mWidth,
      height: mHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        image: DecorationImage(image: AssetImage(imgPath)),
      ),
      child:
          isSpotifyOriginal
              ? Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: isBlackBg ? Colors.white : Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(11),
                    ),
                  ),
                  child: Center(
                    child: Uihelper.customLogos(
                      logo: "spotify.png",
                      imgWidth: 14,
                      imgHeight: 14,
                      color: isBlackBg ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              )
              : Container(),
    );
  }
}
