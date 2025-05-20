import 'package:flutter/material.dart';
import 'package:spotify_clone/Domain/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify',
      theme: ThemeData(
        fontFamily: 'avenir',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      routes: AppRoutes.getRoutes(),
      initialRoute: AppRoutes.Dashboard_page,
    );
  }
}
