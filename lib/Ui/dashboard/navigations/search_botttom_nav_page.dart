// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spotify_clone/Domain/app_colors.dart';
import 'package:spotify_clone/Domain/spacer.dart';
import 'package:spotify_clone/Ui/widgets/Uihelper.dart';
import 'package:spotify_clone/Ui/widgets/album_cover.dart';

class SearchBotttomNavPage extends StatelessWidget {
  SearchBotttomNavPage({super.key});
  List<Map<String, dynamic>> mTopGenreList = [
    //created this list for top genre UI
    {"img": "assets/images/remastered.png", "txt": "Pop"},
    {"img": "assets/images/lana_del_rey.png", "txt": "Indie"},
    {"img": "assets/images/marvin_gaye.png", "txt": "charts"},
    {"img": "assets/images/indie.png", "txt": "Made for you"},
  ];

  List<Map<String, dynamic>> mPodcastList = [
    //created this list for Podcast List UI
    {"img": "assets/images/top_songs_2021.png", "txt": "News and Politics"},
    {"img": "assets/images/artists_revealed.png", "txt": "Comedy"},
    {"img": "assets/images/marvin_gaye.png", "txt": "charts"},
    {"img": "assets/images/indie.png", "txt": "Made for you"},
  ];

  List<Map<String, dynamic>> mBrowseAll = [
    //created this list for Browse UI
    {"img": "assets/images/ed_sheeran.png", "txt": "2021 Wrapped"},
    {"img": "assets/images/glass_animals.png", "txt": "Podcasts"},
    {"img": "assets/images/manela.png", "txt": "Charts"},
    {"img": "assets/images/ed_sheeran.png", "txt": "2021 Wrapped"},
    {"img": "assets/images/glass_animals.png", "txt": "Podcasts"},
    {"img": "assets/images/manela.png", "txt": "Charts"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              mSpacer(),
              titleUi(),
              mSpacer(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: getSearchTextFieldDecoration(
                      mText: "Artists, songs, or podcasts",
                    ),
                  ),
                ),
              ),
              mSpacer(),
              topGenresUi(),
              mSpacer(),
              popularPodcastUI(),
              mSpacer(),
              browseAllUI(),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleUi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Search",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Spacer(),
          Uihelper.customIcons(icon: "camera.png", mHeight: 25, mWidth: 25),
          mSpacer(mWidth: 20),
        ],
      ),
    );
  }

  Widget topGenresUi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mSpacer(),
          Text(
            "Your top genres",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          mSpacer(),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: mTopGenreList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 11.0),
                  child: AlbumCover(
                    albumPath: mTopGenreList[index]["img"],
                    albumName: mTopGenreList[index]["txt"],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget popularPodcastUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mSpacer(),
          Text(
            "Popular podcast categories",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          mSpacer(),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: mPodcastList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 11.0),
                  child: AlbumCover(
                    albumPath: mPodcastList[index]["img"],
                    albumName: mPodcastList[index]["txt"],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget browseAllUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mSpacer(),
          Text(
            "Browse all",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          mSpacer(),
          GridView.builder(
            itemCount: mBrowseAll.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 16 / 9,
              mainAxisSpacing: 11,
              crossAxisSpacing: 11,
            ),

            itemBuilder: (_, index) {
              return AlbumCover(
                albumPath: mBrowseAll[index]["img"],
                albumName: mBrowseAll[index]["txt"],
              );
            },
          ),
        ],
      ),
    );
  }
}
