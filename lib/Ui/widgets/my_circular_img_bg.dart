// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyCircularImgBg extends StatelessWidget {
  MyCircularImgBg({
    super.key,
    this.mWidth = 100,
    this.mHeight = 100,
    required this.imgPath,
    this.isSelected = false,
  });

  double mWidth;
  double mHeight;
  String imgPath;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mWidth,
      height: mHeight,

      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.white : Colors.transparent,
          width: isSelected ? 2 : 0,
        ),

        shape: BoxShape.circle,

        image: DecorationImage(image: AssetImage(imgPath)),
      ),
      child:
          isSelected
              ? Center(
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.3),
                  radius: mWidth / 2,
                  child: Icon(Icons.done, color: Colors.white),
                ),
              )
              : Container(),
    );
  }
}
