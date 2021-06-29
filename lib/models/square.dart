import 'package:flutter/material.dart';


enum SquareType{
  normal,
  moving,
  empty
}
class Square{
  int id;
  int x;
  int y;
  Color color;
  Offset offset;
  SquareType type;

  Square({this.id, this.x, this.y, this.color, this.offset, this.type});

  Square.clone(Square square){
    this.id = square.id;
    this.x = square.x;
    this.y = square.y;
    this.color = square.color;
    this.offset = square.offset;
    this.type = square.type;
  }

  void toEmpty(){
    this.color = Colors.transparent;
    this.type = SquareType.empty;
  }
}