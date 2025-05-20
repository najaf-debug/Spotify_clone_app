// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:spotify_clone/Domain/app_colors.dart';
import 'package:spotify_clone/Domain/app_routes.dart';
import 'package:spotify_clone/Domain/spacer.dart';
import 'package:spotify_clone/Ui/widgets/Uihelper.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  int selectedIndex = 0;

  List<Widget> allPages = [];

  bool isPP1Selected = false;
  bool isPP2Selected = false;

  @override
  void initState() {
    super.initState();
    allPages = [partOneUi(), partTwoUi(), partThreeUi(), partFourUi()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create account",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.blackColor,
        leading: InkWell(
          onTap: () {
            if (selectedIndex > 0) {
              selectedIndex--;
              setState(() {});
            } else {
              Navigator.pop(context);
            }
          },
          child: Padding(
            padding: EdgeInsets.all(14.0),

            child: Uihelper.customIcons(
              icon: "Left.png",
              color: Colors.white,
              mHeight: 12,
              mWidth: 12,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            allPages[selectedIndex],
            mSpacer(mHeight: 21),
            Padding(
              padding: EdgeInsets.only(bottom: selectedIndex < 3 ? 0 : 43),
              child: MyCustomRoundedBtn(
                onTap: () {
                  if (selectedIndex < 3) {
                    selectedIndex++;
                    setState(() {});
                  } else {
                    // Next screen
                    Navigator.pushNamed(context, AppRoutes.choose_artist_page);
                  }
                },
                text: selectedIndex < 3 ? "Next" : "Create an Account",
                mWidth: selectedIndex < 3 ? 100 : 180,
              ),
            ),
            mSpacer(),
          ],
        ),
      ),
    );
  }

  Widget partOneUi() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        " What's your email",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: getCreateAccTextFieldDecoration(),
      ),
      mSpacer(mHeight: 7),
      Text(
        " You'll need to confirm this email later.",
        style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );

  Widget partTwoUi() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        " Create a password",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: getCreateAccTextFieldDecoration(),
      ),
      mSpacer(mHeight: 7),
      Text(
        " Use at least 8 characters.",
        style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );

  Widget partThreeUi() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        " What's your gender?",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      mSpacer(),
      Wrap(
        alignment: WrapAlignment.spaceEvenly,
        runSpacing: 11,
        children: [
          MyCustomRoundedBtn(
            mWidth: 100,
            mHeight: 34,
            isOutlined: true,
            textColor: Colors.white,
            onTap: () {},
            text: "Male",
            bgColor: AppColors.primaryColor,
          ),
          MyCustomRoundedBtn(
            mWidth: 100,
            mHeight: 34,
            isOutlined: true,
            textColor: Colors.white,
            onTap: () {},
            text: "Female",
            bgColor: AppColors.primaryColor,
          ),
          MyCustomRoundedBtn(
            mWidth: 170,
            mHeight: 34,
            isOutlined: true,
            textColor: Colors.white,
            onTap: () {},
            text: "prefer not to say",
            bgColor: AppColors.primaryColor,
          ),
          MyCustomRoundedBtn(
            mWidth: 100,
            mHeight: 34,
            isOutlined: true,
            textColor: Colors.white,
            onTap: () {},
            text: "Others",
            bgColor: AppColors.primaryColor,
          ),
        ],
      ),
    ],
  );

  Widget partFourUi() => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " What's your name?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        TextField(
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: getCreateAccTextFieldDecoration(),
        ),
        mSpacer(mHeight: 7),
        Text(
          " This appears on your spotify profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        mSpacer(mHeight: 30),
        Divider(color: AppColors.greyColor, height: 1),
        mSpacer(mHeight: 25),
        Text(
          '  By tapping on "Create account",you agree to the spotify Terms of Use',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        mSpacer(mHeight: 25),
        Text(
          '  Terms of Use',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        mSpacer(mHeight: 25),
        Text(
          '  To learn more about how Spotify, collect, uses, shares and protects your\n personal data, Please see the Spotify Privacy Policy',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        mSpacer(mHeight: 25),
        Text(
          '  Privacy Policy',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        mSpacer(mHeight: 10),
        RadioListTile.adaptive(
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text(
            'Please send news and offers from Spotify.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          value: isPP1Selected,
          groupValue: false,
          onChanged: (value) {
            isPP1Selected = value!;
            setState(() {});
          },
        ),
        mSpacer(mHeight: 15),
        RadioListTile.adaptive(
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text(
            'Share my registration data with Spotify\'s contents provide for marketing purposes.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          value: isPP2Selected,
          groupValue: false,
          onChanged: (value) {
            isPP2Selected = value!;
            setState(() {});
          },
        ),
      ],
    ),
  );
}
