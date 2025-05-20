// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:spotify_clone/Domain/spacer.dart';

class MyDuctMusicPlayerWidget extends StatelessWidget {
  String songTitle;
  String albumTitle;
  bool isBluetooth;
  String bluetoothName;
  double mHeight;
  Color bgColor;
  String thumbnailPath;

  MyDuctMusicPlayerWidget({
    super.key,
    required this.albumTitle,
    required this.songTitle,
    this.isBluetooth = false,
    this.bluetoothName = "",
    this.mHeight = 65,
    required this.bgColor,
    required this.thumbnailPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: mHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: bgColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image: DecorationImage(image: AssetImage(thumbnailPath)),
                  ),
                ),
                mSpacer(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            songTitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              " - $albumTitle",
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,

                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                        ],
                      ),
                      mSpacer(mHeight: 5),
                      isBluetooth
                          ? Row(
                            children: [
                              Icon(
                                Icons.bluetooth,
                                color: Colors.green,
                                size: 14,
                              ),
                              mSpacer(mWidth: 5),
                              Text(
                                bluetoothName,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                          : Container(),
                    ],
                  ),
                ),
                mSpacer(),
                Icon(
                  isBluetooth ? Icons.bluetooth : Icons.devices,
                  color: Colors.green,
                ),
                mSpacer(),
                Icon(Icons.pause, color: Colors.white),
              ],
            ),

            LinearProgressIndicator(
              value: 0.5,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
              backgroundColor: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(11),
            ),
          ],
        ),
      ),
    );
  }
}
