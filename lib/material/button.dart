import 'package:flutter/material.dart';
import 'package:rubik_race/core/constants/palette.dart';
class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.size, this.imgUrl, this.textName,
  }) : super(key: key);

  final Size size;
  final String imgUrl, textName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.15),
      child: Container(
        width: size.width * 0.7,
        height: size.height * 0.09,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Palette.primaryColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Color(0x40696969),
                offset: Offset(-4, -4),
              ),
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 1,
                color: Color(0x59000000),
                offset: Offset(4, 4),
              )
            ]
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                  20),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgUrl),
                      fit: BoxFit.cover,
                    )
                ),
              ),
            ),
            Text("${textName}",
              style: TextStyle(fontSize: 30, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}