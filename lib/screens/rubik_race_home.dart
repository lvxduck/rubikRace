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
            Button(size: size, imgUrl:"assets/images/persional.svg", textName: "Single",),
            SizedBox(height: 20,),
            Button(size: size, imgUrl:"assets/images/multi.svg", textName: "Multiple",),
            SizedBox(height: 20,),
            Button(size: size, imgUrl:"assets/images/leader.svg", textName: "LeaderBoard",),
            SizedBox(height: 20,),
            Button(size: size, imgUrl:"assets/images/help.svg", textName: "How To Play ?",),
            SizedBox(height: 5,),
            // Padding(
            //   padding: const EdgeInsets.only(left: 32, bottom: 10),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     mainAxisSize: MainAxisSize.max,
            //     children: [
            //       SizedBox(
            //         height: 90,
            //         child: Image.asset("assets/logos/logo_company.png"),
            //       ),
            //       SizedBox(width: 28),
            //       const Text("XDUCK", style: const TextStyle(color: Colors.white, fontSize: 22)),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}





