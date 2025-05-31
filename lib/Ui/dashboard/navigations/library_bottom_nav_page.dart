// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:spotify_clone/Domain/app_colors.dart';
import 'package:spotify_clone/Domain/spacer.dart';
import 'package:spotify_clone/Ui/widgets/Uihelper.dart';
import 'package:spotify_clone/Ui/widgets/my_Library_liked_widget.dart';
import 'package:spotify_clone/Ui/widgets/type_chipWidget.dart';

class LibraryBottomNavPage extends StatelessWidget {
  LibraryBottomNavPage({super.key});

  List<Map<String, dynamic>> mRecentlyPlayed = [
    {"img": "lolo_zouai.png", "title": "Lolo Zouaï", "subtitle": "Artist"},
    {"img": "lana_del_rey.png", "title": "Lana Del rey", "subtitle": "Artist"},
    {
      "img": "glass_animals.png",
      "title": "Front Left",
      "subtitle": "Playlist - Spotify",
    },
    {"img": "marvin_gaye.png", "title": "Marvin Gaye", "subtitle": "Artist"},
    {
      "img": "ed_sheeran.png",
      "title": "Les",
      "subtitle": "Song - Childish Gambino",
    },
  ];

  List<String> mTypes = ["Playlists", "Artists", "Albums", "Podcasts & shows"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Column(
          children: [
            mSpacer(),
            titleUI(),
            mSpacer(),
            typeChipUI(),
            mSpacer(mHeight: 16),
            recentlyPlayedUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    mSpacer(mHeight: 16),
                    MyLibraryLikedWidget(
                      mTitle: "Liked Songs",
                      mSubtitle: "Playlist | 58 songs",
                      isLeadingGradient: true,
                      mGradientColors: [
                        Color(0xFF4A39EA),
                        Color(0xFF868AE1),
                        Color(0xFFB9D4DB),
                      ],
                    ),
                    mSpacer(mHeight: 5),
                    MyLibraryLikedWidget(
                      mTitle: "New Episodes",
                      mSubtitle: "Updated 2 days ago",
                      mSolidColor: Color(0xFF5E3B7A),
                      mLeadingIcon: Icons.notifications_active,
                      mLeadingIconColor: const Color.fromARGB(255, 5, 255, 13),
                    ),
                    mSpacer(),
                    ListView.builder(
                      itemCount: mRecentlyPlayed.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Uihelper.customImage(
                                img: mRecentlyPlayed[index]["img"],
                                mWidth: 60,
                                mHeight: 60,
                              ),
                              title: Text(mRecentlyPlayed[index]["title"]),
                              subtitle: Text(
                                mRecentlyPlayed[index]["subtitle"],
                              ),

                              titleTextStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              subtitleTextStyle: TextStyle(
                                color: Colors.white38,
                                fontSize: 12,
                              ),
                            ),
                            mSpacer(),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
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

  Widget recentlyPlayedUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Icon(
              Icons.compare_arrows_rounded,
              size: 16,
              color: Colors.white,
            ),
          ),
          mSpacer(),
          Text(
            "Recently played",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Spacer(),
          Uihelper.customIcons(
            icon: "Component 19.png",
            mHeight: 16,
            mWidth: 16,
          ),
        ],
      ),
    );
  }
}
