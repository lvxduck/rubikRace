import 'package:flutter/material.dart';
class TitleRubik extends StatelessWidget {
  const TitleRubik({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 43, vertical: 23),
      child: RichText(
        text: TextSpan(
            children: [
              TextSpan(
                  text: "RUBIK \nRACE", style: TextStyle(fontSize: 64, fontFamily: 'Academy Engraved LET')
              )
            ]
        ),
      ),
    );
  }
}
