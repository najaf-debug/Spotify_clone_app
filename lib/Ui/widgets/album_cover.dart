// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, use_key_in_widget_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class AlbumCover extends StatelessWidget {
  String albumPath;
  String albumName;

  AlbumCover({required this.albumPath, required this.albumName});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width * 0.5 - 16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:
              Colors.primaries[Random().nextInt(Colors.primaries.length - 1)],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              bottom: 0,
              child: Transform.rotate(
                angle: 15 * pi / 180,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 15,
                        blurRadius: 11,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                    image: DecorationImage(image: AssetImage(albumPath)),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 11,
              left: 11,
              child: Text(
                albumName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
