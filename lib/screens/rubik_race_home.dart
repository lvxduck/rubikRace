import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rubik_race/core/constants/palette.dart';
import 'package:rubik_race/material/button.dart';
import 'package:rubik_race/material/title_rubik.dart';
class RubikRaceHome extends StatelessWidget {
  const RubikRaceHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.primaryColor,
        body: Column(
          children: [
            TitleRubik(),
            SizedBox(height: 20,),
            Button(size: size, imgUrl:"assets/images/person.png", textName: "Single",),
            SizedBox(height: 20,),
            Button(size: size, imgUrl:"assets/images/people.png", textName: "Multiple",),
            SizedBox(height: 20,),
            Button(size: size, imgUrl:"assets/images/podium 1.png", textName: "LeaderBoard",),
            SizedBox(height: 20,),
            Button(size: size, imgUrl:"assets/images/home.png", textName: "How To Play ?",),
          ],
        ),
      ),
    );
  }
}





