import 'package:flutter/widgets.dart';
import 'package:spotify_clone/Ui/create_account/create_account.dart';
import 'package:spotify_clone/Ui/dashboard/dashboard_screen.dart';
import 'package:spotify_clone/Ui/intro/choose_artist_page.dart';
import 'package:spotify_clone/Ui/intro/choose_podcast_page.dart';
import 'package:spotify_clone/Ui/intro/intro_page.dart';
import 'package:spotify_clone/Ui/splash/splash_page.dart';

class AppRoutes {
  static const String splash_page = '/splash';
  static const String intro_page = '/intro';
  static const String create_account = '/account';
  static const String choose_artist_page = '/choose_artist';
  static const String choose_podcast_page = '/choose_podcast';
  static const String Dashboard_page = '/Dashboard';

  static Map<String, Widget Function(BuildContext)> getRoutes() => {
    splash_page: (context) => SplashPage(),
    intro_page: (context) => IntroPage(),
    create_account: (context) => CreateAccount(),
    choose_artist_page: (context) => ChooseArtistPage(),
    choose_podcast_page: (context) => ChoosePodcastPage(),
    Dashboard_page: (context) => DashboardPage(),
  };
}
