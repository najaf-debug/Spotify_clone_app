// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:spotify_clone/Domain/app_colors.dart';
import 'package:spotify_clone/Domain/app_routes.dart';
import 'package:spotify_clone/Domain/spacer.dart';
import 'package:spotify_clone/Ui/widgets/Uihelper.dart';
import 'package:spotify_clone/Ui/widgets/my_circular_img_bg.dart';

class ChooseArtistPage extends StatefulWidget {
  ChooseArtistPage({super.key});

  @override
  State<ChooseArtistPage> createState() => _ChooseArtistPageState();
}

class _ChooseArtistPageState extends State<ChooseArtistPage> {
  List<int> selectedArtist = [];

  List<Map<String, dynamic>> artist = [
    {"img": "assets/images/Members.png", "name": "Members"},
    {"img": "assets/images/Afterburner.png", "name": "After Burner"},
    {"img": "assets/images/bryce_vine.png", "name": "Bruce Wayne"},
    {"img": "assets/images/From the Fires.png", "name": "From The Fires"},
    {
      "img": "assets/images/Dance Gavin Dance - Members.png",
      "name": "Gavin Members",
    },
    {"img": "assets/images/Dance Gavin Dance.png", "name": "Gavin Dance"},
    {"img": "assets/images/greta.png", "name": "Greta"},
    {"img": "assets/images/Time Bomb.png", "name": "Time Bomb"},
    {"img": "assets/images/Self Titled.png", "name": "Self Titled"},
    {"img": "assets/images/MGK.png", "name": "MGK Band"},
    {"img": "assets/images/tycho.png", "name": "Tycho"},
    {"img": "assets/images/the_office.png", "name": "The Office"},
    {
      "img": "assets/images/Anthem of the Peaceful Army.png",
      "name": "Peaceful anthem",
    },
    {"img": "assets/images/Chon.png", "name": "Chon"},
    {"img": "assets/images/Coastin.png", "name": "Coastin"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  "Choose 3 or more artists you like.",
                  style: TextStyle(
                    fontSize: 20,
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
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 11,
                        crossAxisSpacing: 11,
                        childAspectRatio: 7 / 8,
                      ),

                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () {
                            if (!selectedArtist.contains(index)) {
                              selectedArtist.add(index);
                              setState(() {});
                            } else {
                              selectedArtist.remove(index);
                              setState(() {});
                            }
                          },
                          child: Column(
                            children: [
                              MyCircularImgBg(
                                imgPath: artist[index]["img"],
                                isSelected: selectedArtist.contains(index),
                              ),
                              mSpacer(),
                              Text(
                                artist[index]["name"],
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
                      itemCount: artist.length,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 180,
                        child:
                            selectedArtist.length >= 3
                                ? Center(
                                  child: MyCustomRoundedBtn(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.choose_podcast_page,
                                      );
                                    },
                                    text: "Next",
                                    mWidth: 100,
                                  ),
                                )
                                : Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
