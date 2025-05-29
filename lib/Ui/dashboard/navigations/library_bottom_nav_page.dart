// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:spotify_clone/Domain/app_colors.dart';
import 'package:spotify_clone/Domain/spacer.dart';
import 'package:spotify_clone/Ui/widgets/type_chipWidget.dart';

class LibraryBottomNavPage extends StatelessWidget {
  LibraryBottomNavPage({super.key});

  List<String> mTypes = ["Playlists", "Artists", "Albums", "Podcasts & shows"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SingleChildScrollView(
          child: Column(
            children: [mSpacer(), titleUI(), mSpacer(), typeChipUI()],
          ),
        ),
      ),
    );
  }

  Widget titleUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Center(
              child: Image.asset(
                "assets/images/avatar.png",
                width: 50,
                height: 50,
              ),
            ),
          ),
          mSpacer(),
          Text(
            "Your Library",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Spacer(),
          Icon(Icons.add, size: 35, color: Colors.grey),
        ],
      ),
    );
  }

  Widget typeChipUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          itemCount: mTypes.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TypeChipwidget(typeName: mTypes[index]);
          },
        ),
      ),
    );
  }
}
