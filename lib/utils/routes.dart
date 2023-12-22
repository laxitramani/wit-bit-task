import 'package:flutter/material.dart';
import 'package:wit_by_bit/screens/home_screen.dart';
import 'package:wit_by_bit/screens/search_screen.dart';
import 'package:wit_by_bit/screens/splash_screen.dart';

class RouteName {
  static const String splashScreen = "/splashScreen";
  static const String homeScreen = "/homeScreen";
  static const String searchScreen = "/searchScreen";
}

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteName.splashScreen: (context) => const SplashScreen(),
    RouteName.homeScreen: (context) => const HomeScreen(),
    RouteName.searchScreen: (context) => const SearchScreen(),
  };
}
