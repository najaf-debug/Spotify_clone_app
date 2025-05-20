import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spotify_clone/Domain/app_colors.dart';
import 'package:spotify_clone/Domain/app_routes.dart';
import 'package:spotify_clone/Ui/widgets/Uihelper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.intro_page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: Uihelper.customLogos(
          logo: "spotify.png",
          imgHeight: 80,
          imgWidth: 80,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
