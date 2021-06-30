import 'package:flutter/material.dart';
import 'package:rubik_race/screens/home.dart';
import 'package:rubik_race/screens/rubik_race_home.dart';
import 'package:rubik_race/screens/splash.dart';

class RouteGenerator {
  static const String splash = '/';
  static const String rubikRaceHome = '/rubikRaceHome';
  static const String homePage = '/random';


  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const Splash(),
        );
      case rubikRaceHome:
        return MaterialPageRoute(
          builder: (_) => const RubikRaceHome(),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      default:
        throw FormatException("Route not found");
    }
  }
}

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
