import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rubik_race/models/direction.dart';
import 'package:rubik_race/models/square.dart';

class Rubik extends StatefulWidget {
  final int size;
  final double width;
  final double margin;
  final List<Color> colors;

  Rubik({Key key, this.size, this.width, this.margin, this.colors}) : super(key: key);

  @override
  _RubikState createState() => _RubikState((width - (margin - 1) * size) / size);
}

class _RubikState extends State<Rubik> with TickerProviderStateMixin {
  final double squareWidth;
  List<List<Square>> squares;
  Square emptySquare;

  AnimationController _animationController;

  _RubikState(this.squareWidth);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    Random random = Random();
    squares = List.generate(widget.size, (x) {
      return List.generate(widget.size, (y) {
        return Square(
            offset: Offset(
              x * squareWidth + x * widget.margin,
              y * squareWidth + y * widget.margin,
            ),
            x: x,
            y: y,
            color: widget.colors[random.nextInt(widget.colors.length - 1)],
            type: SquareType.normal);
      });
    });
    emptySquare = squares[2][2];
    emptySquare.type = SquareType.empty;
    emptySquare.color = Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return Stack(
      children: List.generate(widget.size * widget.size, (index) {
        Square square = squares[index % widget.size][index ~/ widget.size];
        if (square.type == SquareType.moving) {
          print("moving");
          square.type = SquareType.normal;
          square.x = index % widget.size;
          square.y = index ~/ widget.size;
          double oldLeft = square.offset.dx;
          double oldTop = square.offset.dy;
          double leftDistance = square.x * squareWidth + square.x * widget.margin - square.offset.dx;
          double topDistance = square.y * squareWidth + square.y * widget.margin - square.offset.dy;
          square.offset = Offset(
            square.x * squareWidth + square.x * widget.margin,
            square.y * squareWidth + square.y * widget.margin,
          );
          AnimationController animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 130))..forward();
          return AnimatedBuilder(
            animation: animationController,
            child: buildSquare(square, index),
            builder: (context, child) {
              // square.offset = Offset(
              double left =  oldLeft + leftDistance * animationController.value;
              double top =  oldTop + topDistance * animationController.value;
              // );
              return Positioned(top: top, left: left, child: child);
            },
          );
        } else
          return Positioned(
            top: square.offset.dy,
            left: square.offset.dx,
            child: buildSquare(square, index),
          );
      }),
    );
  }

  Widget buildSquare(Square square, index) {
    return InkWell(
      onTap: () {
        _onSquareClicked(square.x, square.y);
      },
      child: Container(
        decoration: BoxDecoration(
          color: square.color,
          borderRadius: BorderRadius.circular(8),
        ),
        height: squareWidth,
        width: squareWidth,
        // child: Text(index.toString()),
      ),
    );
  }

  void _onSquareClicked(int x, int y) {
    Direction direction = _getDirection(x, y);
    print(direction);
    _updateState(direction, x, y);
  }

  Direction _getDirection(int x, int y) {
    if (squares[x][y].type == SquareType.empty) return Direction.none;
    if (y == emptySquare.y) return emptySquare.x < x ? Direction.left : Direction.right;
    if (x == emptySquare.x) return emptySquare.y < y ? Direction.top : Direction.bottom;
    return Direction.none;
  }

  void _updateState(Direction direction, int x, int y) {
    switch (direction) {
      case Direction.none:
        break;
      case Direction.top:
        setState(() {
          for (int i = emptySquare.y; i < y; i++) {
            print("oke");
            squares[emptySquare.x][i] = squares[emptySquare.x][i + 1];
            squares[emptySquare.x][i].type = SquareType.moving;
          }
          squares[emptySquare.x][y] = Square.clone(squares[emptySquare.x][y]);
          emptySquare = squares[emptySquare.x][y];
          emptySquare.toEmpty();
        });
        break;
      case Direction.left:
        setState(() {
          for (int i = emptySquare.x; i < x; i++) {
            print("oke");
            squares[i][emptySquare.y] = squares[i + 1][emptySquare.y];
            squares[i][emptySquare.y].type = SquareType.moving;
          }
          squares[x][emptySquare.y] = Square.clone(squares[x][emptySquare.y]);
          emptySquare = squares[x][emptySquare.y];
          emptySquare.toEmpty();
        });
        break;
      case Direction.bottom:
        setState(() {
          for (int i = emptySquare.y; i > y; i--) {
            print("oke");
            squares[emptySquare.x][i] = squares[emptySquare.x][i - 1];
            squares[emptySquare.x][i].type = SquareType.moving;
          }
          squares[emptySquare.x][y] = Square.clone(squares[emptySquare.x][y]);
          emptySquare = squares[emptySquare.x][y];
          emptySquare.toEmpty();
        });
        break;
      case Direction.right:
        setState(() {
          for (int i = emptySquare.x; i > x; i--) {
            print("oke");
            squares[i][emptySquare.y] = squares[i - 1][emptySquare.y];
            squares[i][emptySquare.y].type = SquareType.moving;
          }
          squares[x][emptySquare.y] = Square.clone(squares[x][emptySquare.y]);
          emptySquare = squares[x][emptySquare.y];
          emptySquare.toEmpty();
        });
        break;
    }
  }
}
