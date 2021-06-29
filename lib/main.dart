import 'package:flutter/material.dart';
import 'package:rubik_race/routers.dart';
import 'package:rubik_race/screens/home.dart';
import 'package:rubik_race/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RouteGenerator.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
