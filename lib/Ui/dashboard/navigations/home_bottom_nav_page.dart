// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spotify_clone/Domain/app_colors.dart';
import 'package:spotify_clone/Domain/spacer.dart';
import 'package:spotify_clone/Ui/widgets/Uihelper.dart';

class HomeBottomNavPage extends StatelessWidget {
  HomeBottomNavPage({super.key});

  List<Map<String, dynamic>> mRecentlylPlayedList = [
    //created this list for recently played UI
    {"img": "assets/images/remastered.png", "txt": "1(Remastered)"},
    {"img": "assets/images/lana_del_rey.png", "txt": "Lana Del Rey"},
    {"img": "assets/images/marvin_gaye.png", "txt": "Marvin Gaye"},
    {"img": "assets/images/indie.png", "txt": "Indie Pop"},
  ];
  List<Map<String, dynamic>> mreviewList = [
    //created this list for review List UI
    {"img": "assets/images/top_songs_2021.png", "txt": "Your Top Songs 2021"},
    {
      "img": "assets/images/artists_revealed.png",
      "txt": "Your Artists Revealed",
    },
  ];
  List<Map<String, dynamic>> mEditorsPicks = [
    //created this list for Editors Picks UI
    {
      "img": "assets/images/ed_sheeran.png",
      "txt": "Ed Sheeran, Big Sean, \nJuice WRLD, Post Malone",
    },
    {
      "img": "assets/images/glass_animals.png",
      "txt": "Mitski, Tame Impala, \nGlass Animals, Charli XCX",
    },
    {"img": "assets/images/manela.png", "txt": "Mandela"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Column(
          children: [
            mSpacer(),
            recentlyPlayedUi(),
            mSpacer(),
            recentlyPlayedListUi(),
            mSpacer(),
            reviewUi(),
            mSpacer(),
            reviewListUi(),

            editorsPicksUi(),
          ],
        ),
      ),
    );
  }

  Widget recentlyPlayedUi() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              Text(
                "Recently Played",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              Uihelper.customIcons(icon: "Vector.png", mHeight: 20, mWidth: 20),
              mSpacer(mWidth: 15),
              Uihelper.customIcons(
                icon: "orientation lock_light.png",
                mHeight: 20,
                mWidth: 20,
              ),
              mSpacer(mWidth: 15),
              Uihelper.customIcons(
                icon: "Settings_light.png",
                mHeight: 24,
                mWidth: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget recentlyPlayedListUi() {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0),
            child: Column(
              children: [
                Image.asset(
                  mRecentlylPlayedList[index]["img"],
                  height: 100,
                  width: 100,
                ),
                mSpacer(),
                Text(
                  mRecentlylPlayedList[index]["txt"],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: mRecentlylPlayedList.length,
      ),
    );
  }

  Widget reviewUi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        children: [
          Uihelper.customImage(img: "review.png", mWidth: 55, mHeight: 55),
          mSpacer(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#SPOTIFYWRAPPED",
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
                Text(
                  "Your 2021 in review",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget reviewListUi() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  mreviewList[index]["img"],
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                mSpacer(),
                Text(
                  mreviewList[index]["txt"],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: mreviewList.length,
      ),
    );
  }

  Widget editorsPicksUi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: Text(
            "Editor's Picks",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        mSpacer(mHeight: 4),
        SizedBox(
          height: 180,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 11.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      mEditorsPicks[index]["img"],
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    mSpacer(),
                    Text(
                      mEditorsPicks[index]["txt"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: mEditorsPicks.length,
          ),
        ),
      ],
    );
  }
}
