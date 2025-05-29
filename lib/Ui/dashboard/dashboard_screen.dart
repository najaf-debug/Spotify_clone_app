import 'package:flutter/material.dart';
import 'package:spotify_clone/Domain/app_colors.dart';
import 'package:spotify_clone/Ui/dashboard/navigations/home_bottom_nav_page.dart';
import 'package:spotify_clone/Ui/dashboard/navigations/library_bottom_nav_page.dart';
import 'package:spotify_clone/Ui/dashboard/navigations/search_botttom_nav_page.dart';
import 'package:spotify_clone/Ui/widgets/Uihelper.dart';
import 'package:spotify_clone/Ui/widgets/my_duct_music_player_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedBottomIndex = 0;
  List<Widget> mBottomNavPages = [
    HomeBottomNavPage(),
    SearchBotttomNavPage(),
    LibraryBottomNavPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 16,
        currentIndex: selectedBottomIndex,
        backgroundColor: AppColors.secondaryBlackColor,
        onTap: (value) {
          selectedBottomIndex = value;
          setState(() {});
        },
        selectedLabelStyle: TextStyle(color: AppColors.whiteColor),
        unselectedLabelStyle: TextStyle(color: AppColors.greyColor),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.greyColor,

        items: [
          BottomNavigationBarItem(
            activeIcon: Uihelper.customIcons(
              icon: "Home_Solid.png",
              color: Colors.white,
              mHeight: 20,
              mWidth: 20,
            ),
            icon: Uihelper.customIcons(
              icon: "Home_outline.png",
              color: AppColors.greyColor,
              mHeight: 20,
              mWidth: 20,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Uihelper.customIcons(
              icon: "Search_Solid.png",
              mHeight: 20,
              mWidth: 20,
              color: AppColors.greyColor,
            ),
            activeIcon: Uihelper.customIcons(
              icon: "Search_outline.png",
              mHeight: 20,
              mWidth: 20,
              color: Colors.white,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Uihelper.customIcons(
              icon: "Library_Solid.png",
              mHeight: 20,
              mWidth: 20,
              color: AppColors.greyColor,
            ),
            activeIcon: Uihelper.customIcons(
              icon: "Library_outline.png",
              mHeight: 20,
              mWidth: 20,
              color: Colors.white,
            ),
            label: "Library",
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 65.0),
            child: mBottomNavPages[selectedBottomIndex],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MyDuctMusicPlayerWidget(
              songTitle: "From Me to You - Mono / Remastered",
              albumTitle: "The B",
              isBluetooth: true,
              bluetoothName: "BEATSPILL+",
              bgColor: Color(0xFF550A1C).withOpacity(0.3),
              thumbnailPath: "assets/images/remastered.png",
            ),
          ),
        ],
      ),
    );
  }
}
