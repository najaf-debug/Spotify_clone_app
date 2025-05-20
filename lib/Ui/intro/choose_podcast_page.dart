// ignore_for_file: sized_box_for_whitespace
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spotify_clone/Domain/app_colors.dart';
import 'package:spotify_clone/Domain/spacer.dart';
import 'package:spotify_clone/Ui/dashboard/dashboard_screen.dart';
import 'package:spotify_clone/Ui/widgets/Uihelper.dart';
import 'package:spotify_clone/Ui/widgets/my_rounded_img_card%20copy.dart';

class ChoosePodcastPage extends StatefulWidget {
  const ChoosePodcastPage({super.key});

  @override
  State<ChoosePodcastPage> createState() => _ChoosePodcastPageState();
}

class _ChoosePodcastPageState extends State<ChoosePodcastPage> {
  List<int> selectedPodcast = [];
  List<List<Map<String, dynamic>>> podcast = [
    [
      {
        "img": "assets/images/Members.png",
        "name": "Members",
        "isBlackbg": true,
        "isSpotifyOriginal": false,
      },
      {
        "img": "assets/images/Afterburner.png",
        "name": "After Burner",
        "isBlackbg": true,
        "isSpotifyOriginal": true,
      },
      {
        "img": "",
        "name": "More in True Crime",
        "isBlackbg": true,
        "isSpotifyOriginal": false,
      },
    ],

    [
      {
        "img": "assets/images/From the Fires.png",
        "name": "From The Fires",
        "isBlackbg": true,
        "isSpotifyOriginal": true,
      },

      {
        "img": "assets/images/Dance Gavin Dance - Members.png",
        "name": "Gavin Members",
        "isBlackbg": true,
        "isSpotifyOriginal": false,
      },
      {
        "img": "",
        "name": "More in Comedy",
        "isBlackbg": true,
        "isSpotifyOriginal": false,
      },
    ],

    [
      {
        "img": "assets/images/greta.png",
        "name": "Greta",
        "isBlackbg": true,
        "isSpotifyOriginal": true,
      },
      {
        "img": "assets/images/Time Bomb.png",
        "name": "Time Bomb",
        "isBlackbg": false,
        "isSpotifyOriginal": true,
      },
      {
        "img": "",
        "name": "More in Stories",
        "isBlackbg": true,
        "isSpotifyOriginal": false,
      },
    ],

    [
      {
        "img": "assets/images/MGK.png",
        "name": "MGK Band",
        "isBlackbg": true,
        "isSpotifyOriginal": false,
      },
      {
        "img": "assets/images/tycho.png",
        "name": "Tycho",
        "isBlackbg": true,
        "isSpotifyOriginal": false,
      },
      {
        "img": "",
        "name": "More in Relationships",
        "isBlackbg": true,
        "isSpotifyOriginal": false,
      },
    ],
    [
      {
        "img": "assets/images/Anthem of the Peaceful Army.png",
        "name": "Peaceful anthem",
        "isBlackbg": true,
        "isSpotifyOriginal": true,
      },
      {
        "img": "assets/images/Chon.png",
        "name": "Chon",
        "isBlackbg": true,
        "isSpotifyOriginal": false,
      },
      {
        "img": "",
        "name": "More in Dramas",
        "isBlackbg": true,
        "isSpotifyOriginal": false,
      },
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.blackColor,

          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: Text(
                    "Now choose some podcasts.",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                mSpacer(),

                SizedBox(
                  height: 50,
                  child: TextField(decoration: getSearchTextFieldDecoration()),
                ),

                Expanded(
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemBuilder: (_, index) {
                          return Container(
                            padding: EdgeInsets.only(bottom: 11),
                            height: 160,
                            child: ListView.builder(
                              itemBuilder: (_, childIndex) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Column(
                                    children: [
                                      childIndex == 2
                                          ? Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 11,
                                            ),
                                            width: 110,
                                            height: 110,

                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              color:
                                                  Colors.primaries[Random()
                                                      .nextInt(
                                                        Colors.primaries.length,
                                                      )],
                                            ),
                                            child: Center(
                                              child: Text(
                                                podcast[index][childIndex]["name"],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                          : MyRoundedImgCard(
                                            mWidth: 100,
                                            mHeight: 100,
                                            imgPath:
                                                podcast[index][childIndex]['img'],
                                            isBlackBg:
                                                podcast[index][childIndex]['isBlackbg'],
                                            isSpotifyOriginal:
                                                podcast[index][childIndex]['isSpotifyOriginal'],
                                          ),
                                      mSpacer(),
                                      Text(
                                        childIndex == 2
                                            ? ""
                                            : podcast[index][childIndex]['name'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: podcast[index].length,
                              scrollDirection: Axis.horizontal,
                            ),
                          );
                        },
                        itemCount: podcast.length,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 180,
                          child: Center(
                            child: MyCustomRoundedBtn(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DashboardPage(),
                                  ),
                                );
                              },
                              text: "Done",
                              mWidth: 100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
