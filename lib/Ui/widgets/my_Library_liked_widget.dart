// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:spotify_clone/Domain/spacer.dart';
import 'package:spotify_clone/Ui/widgets/Uihelper.dart';

class MyLibraryLikedWidget extends StatelessWidget {
  MyLibraryLikedWidget({
    super.key,
    this.isLeadingGradient = false,
    this.mGradientColors,
    this.mSolidColor,
    this.mLeadingIcon = Icons.favorite,
    this.mLeadingIconColor = Colors.white,
    required this.mTitle,
    required this.mSubtitle,
  });

  bool isLeadingGradient;
  List<Color>? mGradientColors;
  Color? mSolidColor;
  IconData mLeadingIcon;
  Color mLeadingIconColor;
  String mTitle;
  String mSubtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: mSolidColor ?? Color(0xFF5E3B7A),
          gradient:
              isLeadingGradient
                  ? LinearGradient(
                    colors:
                        mGradientColors ??
                        [
                          Color(0xFF4A39EA),
                          Color(0xFF868AE1),
                          Color(0xFFB9D4DB),
                        ],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  )
                  : null,
        ),
        child: Icon(mLeadingIcon, color: mLeadingIconColor),
      ),
      title: Text(mTitle),

      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      subtitleTextStyle: TextStyle(color: Colors.grey, fontSize: 12),
      subtitle: Row(
        children: [
          Uihelper.customImage(img: "pin.png", mWidth: 16, mHeight: 16),
          mSpacer(mWidth: 5),
          Text(mSubtitle),
        ],
      ),
    );
  }
}
