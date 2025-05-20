import 'package:flutter/material.dart';
import 'package:spotify_clone/Domain/app_colors.dart';
import 'package:spotify_clone/Domain/app_routes.dart';
import 'package:spotify_clone/Domain/spacer.dart';
import 'package:spotify_clone/Ui/widgets/Uihelper.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBlackColor,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Uihelper.customImage(img: "intro.png"),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.blackColor.withOpacity(0.6),
                    AppColors.blackColor,
                  ],
                ),
              ),
            ),
            bottomLoginUi(context),
          ],
        ),
      ),
    );
  }

  Widget bottomLoginUi(BuildContext context) => Container(
    padding: EdgeInsets.only(bottom: 60),
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Uihelper.customLogos(logo: "spotify.png", imgHeight: 50, imgWidth: 50),
        mSpacer(),
        Text(
          "Millions of Songs. \n  Free on Spotify.",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        mSpacer(),
        MyCustomRoundedBtn(
          text: "Sign up free",
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.create_account);
          },
          bgColor: AppColors.primaryColor,
        ),
        mSpacer(),

        MyCustomRoundedBtn(
          mIconPath: "assets/logos/google_logo.png",
          text: "Continue with Google",
          textColor: Colors.white,
          onTap: () {},
          bgColor: AppColors.primaryColor,
          isOutlined: true,
        ),
        mSpacer(),

        MyCustomRoundedBtn(
          mIconPath: "assets/logos/facebook.png",
          text: "Continue with Facebook",
          textColor: Colors.white,
          onTap: () {},
          bgColor: AppColors.primaryColor,
          isOutlined: true,
        ),
        mSpacer(),

        MyCustomRoundedBtn(
          mIconPath: "assets/logos/apple_logo.png",
          text: "Continue with Apple",
          textColor: Colors.white,
          onTap: () {},
          bgColor: AppColors.primaryColor,
          isOutlined: true,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Log in",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}
