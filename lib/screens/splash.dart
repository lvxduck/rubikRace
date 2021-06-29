import 'package:flutter/material.dart';
import 'package:rubik_race/core/constants/image_path.dart';
import 'package:rubik_race/core/constants/palette.dart';
import 'package:rubik_race/routers.dart';

class Splash extends StatefulWidget {
  const Splash();

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.of(context)?.pushNamed(
          RouteGenerator.homePage
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 32),
              child: SizedBox(
                width: 210,
                child: Image.asset(ImagePath.logoApp),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, bottom: 32),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 96,
                  child: Image.asset(ImagePath.logoCompany),
                ),
                SizedBox(width: 28),
                const Text("XDUCK", style: const TextStyle(color: Colors.white, fontSize: 22)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
