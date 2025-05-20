// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:spotify_clone/Domain/app_colors.dart';

class Uihelper {
  static customImage({required String img, double? mHeight, double? mWidth}) {
    return Image.asset("assets/images/$img", height: mHeight, width: mWidth);
  }

  static customLogos({
    required String logo,
    double? imgHeight,
    double? imgWidth,
    Color? color,
  }) {
    return Image.asset(
      "assets/logos/$logo",
      height: imgHeight,
      width: imgWidth,
      color: color,
    );
  }

  static customIcons({
    required String icon,
    Color? color,
    double? mHeight,
    double? mWidth,
  }) {
    return Image.asset(
      "assets/icons/$icon",
      color: color,
      height: mHeight,
      width: mWidth,
    );
  }
}

class MyCustomRoundedBtn extends StatelessWidget {
  final VoidCallback onTap;
  final double mWidth;
  final double mHeight;
  final Color bgColor;
  final String text;
  final String? mIconPath; // Nullable now
  final Color textColor;
  final bool isOutlined;

  MyCustomRoundedBtn({
    required this.onTap,
    this.mWidth = 300,
    this.mHeight = 50,
    this.bgColor = Colors.white,
    required this.text,
    this.mIconPath, // No longer required
    this.textColor = Colors.black,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: mHeight,
        width: mWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isOutlined ? Colors.transparent : bgColor,
          border: isOutlined ? Border.all(width: 1, color: Colors.white) : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: Row(
            children: [
              if (mIconPath != null)
                Image.asset(mIconPath!, width: 20, height: 20),
              if (mIconPath != null) SizedBox(width: 10),
              Expanded(
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration getCreateAccTextFieldDecoration() => InputDecoration(
  filled: true,
  fillColor: AppColors.greyColor,
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(11),
    borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
  ),
);
InputDecoration getSearchTextFieldDecoration({
  IconData mIcon = Icons.search,
  Color bgColor = Colors.white,
  String mText = "Search",
}) => InputDecoration(
  contentPadding: EdgeInsets.zero,
  filled: true,
  fillColor: bgColor,
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
  hintText: mText,
  hintStyle: TextStyle(color: AppColors.secondaryBlackColor),
  prefixIcon: Icon(mIcon),
);
